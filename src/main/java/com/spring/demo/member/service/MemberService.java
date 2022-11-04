package com.spring.demo.member.service;

import com.spring.demo.member.domain.Member;
import com.spring.demo.member.dto.AutoLoginDTO;
import com.spring.demo.member.dto.LoginDTO;
import com.spring.demo.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.spring.demo.member.service.LoginFlag.*;
import static com.spring.demo.util.LoginUtils.LOGIN_COOKIE;
import static com.spring.demo.util.LoginUtils.getAutoLoginCookie;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;

    private final BCryptPasswordEncoder encoder;

    // 회원 가입 중간 처리
    public boolean signUp(Member member) {
        // 비밀번호 인코딩
        member.setPassword(encoder.encode(member.getPassword()));

        return memberMapper.register(member);
    }

    // 중복확인 중간처리

    /**
     * 계정과 이메일의 중복을 확인하는 메서드
     * @param type - 확인할 정보 (ex: account or email)
     * @param value - 확인할 값
     * @return 중복이라면 true, 중복이 아니라면 false
     */
    public boolean checkSignUpValue(String type, String value) {
        Map<String, Object> checkMap = new HashMap<>();
        checkMap.put("type", type);
        checkMap.put("value", value);

        return memberMapper.isDuplicate(checkMap) == 1;
    }

    // 회원 정보 조회 중간 처리
    public Member getMember(String account) {
        return memberMapper.findUser(account);
    }

    // 로그인 처리
    public LoginFlag login(LoginDTO inputData, HttpSession session, HttpServletResponse response) {
        // 회원가입 여부 확인
        Member foundMember = memberMapper.findUser(inputData.getAccount());
        log.info("멤버 : {}", foundMember);

        if (foundMember != null) {
            log.info("password : {} ", inputData.getPassword());
            log.info("encodePassword : {} ", foundMember.getPassword());
            log.info("encoder.matches : {}",encoder.matches(inputData.getPassword(), foundMember.getPassword()));
            if (encoder.matches(inputData.getPassword(), foundMember.getPassword())) { //패스워드 암호화로 매치메소드를 사용해서 비교.
                // 로그인 성공
                // 세션에 사용자 정보기록 저장

                //자동로그인
                if (inputData.isAutoLogin()) {
                    log.info("checked auto login user!!");
                    keepLogin(foundMember.getAccount(), session, response);
                }


                session.setAttribute("loginUser", foundMember);

                // 세션 타임아웃 설정
                session.setMaxInactiveInterval(60 * 60); // 1시간
                return SUCCESS;
            } else {
                // 비번 틀림
                return NO_PW;
            }
        } else {
            // 아이디 없음
            return NO_ACC;
        }
    }

    private void keepLogin(String account, HttpSession session, HttpServletResponse response) {
        // 1. 자동로그인 쿠키 생성 - 쿠키의 값으로 현재 세션의 아이디를 저장
        String sessionId = session.getId();
        Cookie c = new Cookie(LOGIN_COOKIE, sessionId);
        // 2. 쿠키 설정 (수명, 사용 경로)
        int limitTime = 60 * 60 * 24 * 90; // 90일에 대한 초
        c.setMaxAge(limitTime);
        c.setPath("/"); // 전체경로
        // 3. 로컬에 쿠키 전송
        response.addCookie(c);

        // 4. DB에 쿠키값과 수명 저장
        // 자동로그인 유지시간(초)을 날짜로 변환
        long nowTime = System.currentTimeMillis();
        Date limitDate = new Date(nowTime + ((long) limitTime * 1000));

        AutoLoginDTO dto = new AutoLoginDTO(account, sessionId, limitDate);

        memberMapper.saveAutoLoginValue(dto);
    }

    // 자동로그인 해제
    public void autoLogout(String account, HttpServletRequest request, HttpServletResponse response) {

        //1. 자동로그인 쿠키를 불러온 뒤 수명을 0초로 세팅해서 클라이언트에 돌려보낸다
        Cookie c = getAutoLoginCookie(request);
        if (c != null) {
            c.setMaxAge(0);
            response.addCookie(c);

            //2. 데이터베이스 처리
            AutoLoginDTO dto = new AutoLoginDTO(account, "none", new Date());
            memberMapper.saveAutoLoginValue(dto);
        }
    }





    // 마이페이지


}
