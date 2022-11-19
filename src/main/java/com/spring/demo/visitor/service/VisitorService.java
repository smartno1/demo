package com.spring.demo.visitor.service;

import com.spring.demo.visitor.domain.Visitor;
import com.spring.demo.visitor.repository.VisitorMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Date;

import static com.spring.demo.util.LoginUtils.*;

@Service
@RequiredArgsConstructor
@Log4j2
public class VisitorService {

    private final VisitorMapper visitorMapper;

    public boolean visitorService(HttpSession session, HttpServletResponse response){
        // 방문시마다 쿠키를 확인해서 없으면 생성, 있으면 시간 초기화

        String sessionId;

        if(getCurrentVisitor(session) == null){
            //1. 방문자 세션값이 null 이면 세션 아이디 = 세션아이디
             sessionId = session.getId();
        }else{
            // 방문자 세션값이 null 이 아니면 세션아이디는 = 쿠키에 있는 세션 아이디
            sessionId = getCurrentVisitor(session);
        }

        Cookie c = new Cookie(VISITOR_COOKIE, sessionId);
        //2. 쿠키 설정
        int limitTime= 60*60*24*90; //90일
        c.setMaxAge(limitTime);
        c.setPath("/"); // 전체경로
        //3. 로컬에 쿠키 전송
        response.addCookie(c);

        //4. DB에 쿠키값과 수명 저장
        // 쿠키 유지시간(초)를 날짜로 변환
        long nowTime = System.currentTimeMillis();
        Date limitDate = new Date(nowTime + ((long) limitTime * 1000));

        Visitor visitor = new Visitor(sessionId, limitDate);
        if(visitorMapper.findOne(sessionId) == null) {
            visitorMapper.insert(visitor);
        }else {
            visitorMapper.update(visitor);
        }
        return true;
    }

    public Visitor findOneService(String sessionId){
        return visitorMapper.findOne(sessionId);
    }

    public boolean deleteService(String sessionId){
        return visitorMapper.delete(sessionId);
    }
}
