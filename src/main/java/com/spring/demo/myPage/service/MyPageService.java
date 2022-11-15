package com.spring.demo.myPage.service;

import com.spring.demo.board.domain.Board;
import com.spring.demo.common.paging.Page;
import com.spring.demo.common.paging.PageMaker;
import com.spring.demo.myPage.dto.MyPageReplyDTO;
import com.spring.demo.myPage.repository.MyPageMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class MyPageService {

    private final MyPageMapper myPageMapper;



    public Map<String,Object> getMyPageBoard(String account, Page page){

        int count = getBoardCount(account);
        PageMaker maker = new PageMaker(page,count);

        List<Board> boardList = myPageMapper.findBoardByAccount(account,page);
        processBoardConverting(boardList);
        Map<String, Object> boardMap = new HashMap<>();

        boardMap.put("boardList", boardList);
        boardMap.put("maker", maker);
        boardMap.put("count", count);

        return boardMap;

    }

    public Map<String,Object> getMyPageReply(String account, Page page){

        int count = getReplyCount(account);
        PageMaker maker = new PageMaker(page,count);

        List<MyPageReplyDTO> replyList = myPageMapper.findReplyByAccount(account,page);

        Map<String, Object> replyMap = new HashMap<>();

        replyMap.put("replyList", replyList);
        replyMap.put("maker", maker);
        replyMap.put("count", count);

        return replyMap;

    }


    public int getReplyCount(String account) {
        return myPageMapper.findReplyCount(account);
    }
    public int getBoardCount(String account) {
        return myPageMapper.findBoardCount(account);
    }


    private void processBoardConverting(List<Board> boardList) {
        for (Board b : boardList) {
            convertDateFormat(b);
            substringTitle(b);
            checkNewArticle(b);
//            setReplyCount(b);
        }
    }

    private void convertDateFormat(Board b) {
        Date date = b.getRegDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        b.setPrettierDate(sdf.format(date));
    }

    private void substringTitle(Board b) {

        // 만약에 글제목이 5글자 이상이라면
        // 5글자만 보여주고 나머지는 ...처리
        String title = b.getTitle();
        if (title.length() > 5) {
            String subStr = title.substring(0, 5);
            b.setShortTitle(subStr + "...");
        } else {
            b.setShortTitle(title);
        }

    }

    private void checkNewArticle(Board b) {
        // 게시물의 작성일자와 현재 시간을 대조

        // 게시물의 작성일자 가져오기 - 16억 5초
        long regDateTime = b.getRegDate().getTime();

        // 현재 시간 얻기 (밀리초) - 16억 10초
        long nowTime = System.currentTimeMillis();

        // 현재시간 - 작성시간
        long diff = nowTime - regDateTime;

        // 신규 게시물 제한시간
        long limitTime = 60 * 5 * 1000;

        if (diff < limitTime) {
            b.setNewArticle(true);
        }

    }



}
