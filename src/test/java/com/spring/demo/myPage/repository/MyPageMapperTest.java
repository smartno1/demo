package com.spring.demo.myPage.repository;

import com.spring.demo.board.domain.Board;
import com.spring.demo.common.paging.Page;
import com.spring.demo.myPage.dto.MyPageBoardDTO;
import com.spring.demo.myPage.dto.MyPageReplyDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MyPageMapperTest {

    @Autowired
    public MyPageMapper myPageMapper;


    @Test
    @DisplayName("계정명으로 게시글 검색")
    void findBoardByAccountCheck(){

        String account ="hello";
        Page page = new Page();
        page.setPageNum(1);

        List<Board> boardList = myPageMapper.findBoardByAccount(account,page);

        System.out.println(boardList.get(0).getReplyCount());

    }

    @Test
    @DisplayName("계정명으로 댓글 검색")
    void findReplyByAccountCheck(){

        String account ="hello";
        Page page = new Page();
        page.setPageNum(1);

        List<MyPageReplyDTO> replyList = myPageMapper.findReplyByAccount(account,page);
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println(replyList.get(0).getBoardTitle());
        System.out.println(replyList.get(0).getBoardReplyCnt());
        System.out.println(replyList.get(0).getBoardDate());


    }
}