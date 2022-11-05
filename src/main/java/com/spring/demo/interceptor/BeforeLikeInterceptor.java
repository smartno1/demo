package com.spring.demo.interceptor;

import com.spring.demo.like.dto.LikeTypeDTO;
import com.spring.demo.like.repository.LikeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.spring.demo.util.LoginUtils.getCurrentMemberAccount;
import static com.spring.demo.util.LoginUtils.isLogin;

@Configuration
@Log4j2
@RequiredArgsConstructor
public class BeforeLikeInterceptor implements HandlerInterceptor {

    private final LikeMapper likeMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        log.info("before like interceptor preHandle()");


        HttpSession session = request.getSession();
        String account = getCurrentMemberAccount(session);
        if (!isLogin(session)){
            log.info("로그인 정보 없음");

            request.setAttribute("message","no-login");
            return false;
        }

        LikeTypeDTO like = new LikeTypeDTO(request);

        String writeUser= likeMapper.findAccount(like);
        // 본인이 작성한 게시물에는 추천 안되도록 배제
        if(account.equals(writeUser)){
            log.info("동일계정");

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
//            request.setAttribute("flag","match-account");
//            response.getWriter().write("{\"flag\":\"match-account\"}");
            response.getWriter().write("match-account");

            return false;
        }
        log.info("before like interceptor preHandle() 종료");

        request.setAttribute("like",like);
        return true;
    }

}
