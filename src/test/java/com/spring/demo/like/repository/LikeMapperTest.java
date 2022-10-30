package com.spring.demo.like.repository;

import com.spring.demo.like.dto.LikeTypeDTO;
import com.spring.demo.reply.domain.Reply;
import com.spring.demo.reply.repository.ReplyMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class LikeMapperTest {

    @Autowired
    LikeMapper likeMapper;

    @Test
    @DisplayName("1번 댓글의 좋아요 생성")
    void insertLikeTest() {


        LikeTypeDTO like = new LikeTypeDTO("replyNo","peach",1);


        boolean flag = likeMapper.insertLike(like);


        assertTrue(flag);

    }

    @Test
    @DisplayName("1번 댓글의 좋아요 삭제")
    void deleteLikeTest() {

        LikeTypeDTO like = new LikeTypeDTO("replyNo","peach",1);


        boolean flag = likeMapper.deleteLike(like);

        assertTrue(flag);

    }

    @Test
    @DisplayName("좋아요가 있는지 확인")
    void likeChkTest() {

        LikeTypeDTO like = new LikeTypeDTO("replyNo","peach",1);


        int flag = likeMapper.likeChk(like);

        assertEquals(1,flag);

    }

}