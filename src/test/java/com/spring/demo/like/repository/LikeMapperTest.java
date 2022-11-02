package com.spring.demo.like.repository;

import com.spring.demo.like.dto.LikeTypeDTO;
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
    @DisplayName("LikeTypeDTO를 입력받아 1번댓글의 추천값을 수정")
    void updateLikeTest() {


        LikeTypeDTO like = new LikeTypeDTO("peach", "replyNo", 1L);


        boolean flag = likeMapper.updateLike(like);


        assertTrue(flag);

    }

    @Test
    @DisplayName("LikeTypeDTO를 입력받아 1번 댓글의 추천테이블 생성")
    void insertLikeTest() {


        LikeTypeDTO like = new LikeTypeDTO("peach", "replyNo", 1L);


        boolean flag = likeMapper.insertLike(like);


        assertTrue(flag);

    }

    @Test
    @DisplayName("LikeTypeDTO를 입력받아 1번 댓글의 추천테이블 삭제")
    void deleteLikeTest() {

        LikeTypeDTO like = new LikeTypeDTO("peach", "replyNo", 1L);


        boolean flag = likeMapper.deleteLike(like);

        assertTrue(flag);

    }

    @Test
    @DisplayName("LikeTypeDTO를 입력받아 peach가 1번댓글에 추천을 한적이 있는지 확인")
    void likeChkTest() {

        LikeTypeDTO like = new LikeTypeDTO("peach", "replyNo", 1L);


        int flag = likeMapper.likeChk(like);

        assertEquals(1,flag);

    }


    @Test
    @DisplayName("계정찾기")
    void findAccountTest() {

        LikeTypeDTO like = new LikeTypeDTO("peach", "replyNo", 1L);

        String account = likeMapper.findAccount(like);

        System.out.println();
        System.out.println("계정 : "+ account);



    }


}