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

        LikeTypeDTO like = new LikeTypeDTO();
        HttpSession session = request.getSession();
        if (!isLogin(session)){
            log.info("로그인 정보 없음");

            request.setAttribute("message","no-login");
            return false;
        }
        String account = getCurrentMemberAccount(session);

        String boardType = request.getParameter("boardNo");

        String replyType = request.getParameter("replyNo");

        if(boardType !=null){
            Long boardNo = Long.parseLong(boardType);
            like = new LikeTypeDTO(account, boardType,boardNo);


        }else if(replyType !=null){

            Long replyNo = Long.parseLong(replyType);
            like = new LikeTypeDTO(account, replyType,replyNo);
        }

        String writeUser= likeMapper.findAccount(like);

        if(account.equals((writeUser))){
            request.setAttribute("message","same-Account");
            return false;
        }

        request.setAttribute("like",like);
        return true;
    }
}
