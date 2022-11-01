package com.spring.demo.interceptor;

import com.spring.demo.board.dto.ValidateMemberDTO;
import com.spring.demo.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.spring.demo.util.LoginUtils.*;

@Configuration
@Log4j2
@RequiredArgsConstructor
public class ReplyInterceptor implements HandlerInterceptor {

    private final ReplyService replyService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        log.info("댓글 수정 삭제 인터셉터");

        HttpSession session = request.getSession();

        String method = request.getMethod();

        //GET(리스트조회)을 제외한 나머지 메서드에서 로그인 확인 및 계정 확인
        if(!method.equalsIgnoreCase("GET")) {
            if (!isLogin(session)) {

                log.info("로그인 정보 없음");

                response.sendRedirect("/member/sign-in?message=no-login");
                return false;
            }

            Long replyNo= (Long)request.getAttribute("rno");

            ValidateMemberDTO dto = replyService.getMember(replyNo);
            // 세션에 저장된 계정명과 댓글의 계정명 정보가 같거나 세션계정이 관리자 권한이라면 접근허용
            if (isAdmin(session)||isMine(session,dto.getAccount())) return true;

            log.info("계정다름");

            response.sendRedirect("/member/sign-in?message=miss-match-account");
            return false;
        }

        return true;
    }

    private boolean isAdmin(HttpSession session) {

        return getCurrentMemberAuth(session).equals("ADMIN");

    }

    private static boolean isMine(HttpSession session, String account) {

        return account.equals(getCurrentMemberAccount(session));

    }

}
