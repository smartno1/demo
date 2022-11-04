package com.spring.demo.myPage.repository;

import com.spring.demo.board.domain.Board;
import com.spring.demo.common.paging.Page;
import com.spring.demo.myPage.dto.MyPageBoardDTO;
import com.spring.demo.myPage.dto.MyPageReplyDTO;
import com.spring.demo.reply.domain.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {


    List<Board> findBoardByAccount(String account, Page page);

    List<MyPageReplyDTO> findReplyByAccount(String account, Page page);


    int findBoardCount(String account);

    int findReplyCount(String account);



}
