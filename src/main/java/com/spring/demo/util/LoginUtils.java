package com.spring.demo.util;


import com.spring.demo.member.domain.Member;
import com.spring.demo.visitor.domain.Visitor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtils {

    public static final String LOGIN_FLAG = "loginUser";
    public static final String LOGIN_FROM = "loginMethod";
    public static final String LOGIN_COOKIE = "autoLoginCookie";
    public static final String VISITOR_FLAG = "visitor";
    public static final String VISITOR_COOKIE = "visitorCookie";

    // 로그인했는지 알려주기~~
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_FLAG) != null;
    }

    // 로그인한 사용자 계정 가져오기
    public static String getCurrentMemberAccount(HttpSession session) {
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getAccount();
    }

    // 로그인한 사용자 권한 가져오기
    public static String getCurrentMemberAuth(HttpSession session) {
        Member member = (Member) session.getAttribute(LOGIN_FLAG);
        return member.getAuth().toString();
    }

    // 자동 로그인 쿠키 가져오기
    public static Cookie getAutoLoginCookie(HttpServletRequest request) {
        return WebUtils.getCookie(request, LOGIN_COOKIE);
    }

    // 자동 로그인 쿠키가 있는지 여부 확인
    public static boolean hasAutoLoginCookie(HttpServletRequest request) {
        return getAutoLoginCookie(request) != null;
    }

    // 방문자 쿠키 가져오기
    public static Cookie getVisitorCookie(HttpServletRequest request){
        return WebUtils.getCookie(request, VISITOR_COOKIE);
    }

    public static String getCurrentVisitor(HttpSession session) {
        Visitor visitor = (Visitor) session.getAttribute(VISITOR_FLAG);
        return visitor.getSessionId();
    }

}
