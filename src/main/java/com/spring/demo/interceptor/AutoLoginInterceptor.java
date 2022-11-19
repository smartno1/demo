package com.spring.demo.interceptor;

import com.spring.demo.member.domain.Member;
import com.spring.demo.member.repository.MemberMapper;
import com.spring.demo.shop.repository.ShopSoldMapper;
import com.spring.demo.visitor.domain.Visitor;
import com.spring.demo.visitor.repository.VisitorMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.spring.demo.util.LoginUtils.*;



@Configuration
@RequiredArgsConstructor
@Log4j2
public class AutoLoginInterceptor implements HandlerInterceptor {

    private final MemberMapper memberMapper;
    private final VisitorMapper visitorMapper;
    private final ShopSoldMapper shopSoldMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("autologin prehandle start");
        //1. 자동로그인 쿠키 탐색
        Cookie c = getAutoLoginCookie(request);

        //2. 자동로그인 쿠키가 발견될 경우 쿠키값을 읽어서 세션아이디를 확인
        if (c != null) {

            String sessionId = c.getValue();

            //3. 쿠키에 저장된 세션아이디와 같은 값을 가진 회원정보 조회
            Member member = memberMapper.findMemberBySessionId(sessionId);

            if (member != null) {
                // 4. 세션에 해당 회원정보를 저장
                member.setBasket(shopSoldMapper.findAllCount(member.getAccount()));
                request.getSession().setAttribute(LOGIN_FLAG, member);
                log.info("logincookie ");
            }
        }else {
            //3. 자동로그인 쿠키가 없을경우 visitor 쿠키 탐색
            Cookie v = getVisitorCookie(request);

            //4. visitor 쿠키가 발견될 경우 쿠키값을 읽어서 세션아이디에 대입
            if (v != null) {
                String sessionId = v.getValue();

                //5. 쿠키에 저장된 세션아이디와 같은 값을 가진 방문자 정보 조회
                Visitor visitor = visitorMapper.findOne(sessionId);


                if (visitor != null) {
                    // 6. 세션에 해당 방문자정보를 저장
                    visitor.setBasket(shopSoldMapper.findAllCount(sessionId));
                    request.getSession().setAttribute(VISITOR_FLAG, visitor);
                    log.info("visitorcookie");
                }
            }
        }

        return true;
    }
}
