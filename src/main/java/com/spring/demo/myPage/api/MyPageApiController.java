package com.spring.demo.myPage.api;

import com.spring.demo.common.paging.Page;
import com.spring.demo.myPage.service.MyPageService;
import com.spring.demo.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

import static com.spring.demo.util.LoginUtils.*;

@RestController
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/api/v1/my-page")
@CrossOrigin
public class MyPageApiController {

    private final MyPageService myPageService;




    @GetMapping("/board")
    public Map<String, Object> getMyBoard(HttpSession session, Page page){


        String account = getCurrentMemberAccount(session);

        log.info("/api/v1/my-page/board 호출 user : {}, page : {}",account,page);

        Map<String, Object> boardList = myPageService.getMyPageBoard(account,page);

        return boardList;

    }

    @GetMapping("/reply")
    public Map<String, Object> getMyReply(HttpSession session, Page page){


        String account = getCurrentMemberAccount(session);

        log.info("/api/v1/my-page/reply 호출 user : {}, page : {}",account,page);

        Map<String, Object> replies = myPageService.getMyPageReply(account,page);

        return replies;

    }






}
