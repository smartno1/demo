package com.spring.demo.like.repository;

import com.spring.demo.reply.domain.Reply;
import com.spring.demo.reply.repository.ReplyMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class LikeMapperTest {

    @Autowired
    LikeMapper likeMapper;

    @Test
    @DisplayName("1번 댓글의 좋아요 생성")
    void insertTest() {




    }

}