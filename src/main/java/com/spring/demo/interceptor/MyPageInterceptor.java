package com.spring.demo.interceptor;

import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.spring.demo.util.LoginUtils.isLogin;

@Configuration
@Log4j2
public class MyPageInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();



        log.info("myPage interceptor preHandle() Start");
        if (!isLogin(session)) {
            log.info("this request deny!! 집에 가");

            response.sendRedirect("/member/sign-in?message=no-login");
            return false;
        }
        log.info("myPage  interceptor preHandle() END");
        return true;
    }

}
