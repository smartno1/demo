package com.spring.demo.like.controller;


import com.spring.demo.like.dto.LikeTypeDTO;
import com.spring.demo.like.service.LikeService;
import com.spring.demo.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/like")
public class LikeController {


    private final LikeService likeService;


    // 추천 확인
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<Boolean> LikeChk(LikeTypeDTO like, HttpSession session) {
        log.info("/check {} GET!! ASYNC", like );

        boolean flag = likeService.isLike(like);

        return new ResponseEntity<>(flag, HttpStatus.OK);
    }



    // 추천 업데이트
    @GetMapping("/update")
    @ResponseBody
    public int updateLike(LikeTypeDTO like, HttpSession session) {

        log.info("/update {} GET!! ASYNC", like );
        return likeService.updateLike(like);

    }


//
//    // 추천 확인
//    @GetMapping("/boardCheck")
//    @ResponseBody
//    public ResponseEntity<Boolean> boardCheck(Long boardNo, HttpSession session) {
//        log.info("/like/boardCheck?boardNo={} GET!! ASYNC", boardNo );
//
//        String account = LoginUtils.getCurrentMemberAccount(session);
//
//        LikeTypeDTO like = new LikeTypeDTO(account,"boardNo",  boardNo);
//
//        boolean flag = likeService.isLike(like);
//
//        return new ResponseEntity<>(flag, HttpStatus.OK);
//    }
//
//    // 추천 확인
//    @GetMapping("/replyCheck")
//    @ResponseBody
//    public ResponseEntity<Boolean> replyCheck(Long replyNo, HttpSession session) {
//
//        log.info("/like/replyCheck?replyNo={} GET!! ASYNC", replyNo);
//
//        String account = LoginUtils.getCurrentMemberAccount(session);
//
//        LikeTypeDTO like = new LikeTypeDTO(account,"replyNo",  replyNo);
//
//        boolean flag = likeService.isLike(like);
//
//        return new ResponseEntity<>(flag, HttpStatus.OK);
//
//    }
//




//
//    // 추천 업데이트
//    @GetMapping("/boardLike")
//    @ResponseBody
//    public int boardLike(Long boardNo, HttpSession session) {
//
//        log.info("/like//boardLike?boardNo={} GET!! ASYNC", boardNo );
//
//        String account = LoginUtils.getCurrentMemberAccount(session);
//
//        LikeTypeDTO like = new LikeTypeDTO(account,"boardNo",  boardNo);
//
//        return likeService.updateLike(like);
//
//
//    }
//
//
//
//
//    @GetMapping("/replyLike")
//    @ResponseBody
//    public int replyLike(Long replyNo, HttpSession session) {
//
//        log.info("/like//replyLike?replyNo={} GET!! ASYNC", replyNo );
//
//        String account = LoginUtils.getCurrentMemberAccount(session);
//
//        LikeTypeDTO like = new LikeTypeDTO(account,"replyNo",  replyNo);
//
//        return likeService.updateLike(like);
//
//
//    }
//
//



}
