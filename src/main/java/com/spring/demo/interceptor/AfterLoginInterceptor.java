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
public class AfterLoginInterceptor implements HandlerInterceptor {



    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        log.info("after login interceptor preHandle()");
        HttpSession session = request.getSession();
        if (isLogin(session)) {

            response.sendRedirect("/");
            return false;
        }
        return true;

    }
}
