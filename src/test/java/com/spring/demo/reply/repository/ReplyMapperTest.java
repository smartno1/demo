package com.spring.demo.reply.repository;

import com.spring.demo.common.paging.Page;
import com.spring.demo.reply.domain.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class ReplyMapperTest {



    @Autowired
    ReplyMapper replyMapper;

    @Test
    @DisplayName("댓글 1000개를 무작위 게시물에 등록해야 한다.")
    void saveTest() {

        for (int i = 1; i <= 100; i++) {
            long bno = (long) (Math.random() * 300 + 1);

            Reply reply = new Reply();
            reply.setBoardNo(bno);
            reply.setReplyText("댓글" + i);
            reply.setReplyWriter("메롱이"+ i);
            reply.setAccount("hello");

            replyMapper.save(reply);
        }
    }

    @Test
    @DisplayName("댓글 200개를 300번 게시물에 등록해야 한다.")
    void bulkSaveTest() {

        for (int i = 1; i <= 200; i++) {
            long bno = 300L;

            Reply reply = new Reply();
            reply.setBoardNo(bno);
            reply.setReplyText("댓글" + i);
            reply.setReplyWriter("메롱이"+ i);
            reply.setAccount("hello");

            replyMapper.save(reply);
        }

    }

    @Test
    @DisplayName("댓글 내용을 수정, 개별조회해야 한다.")
    void modifyTest() {

        Long rno = 1000L;

        Reply reply = new Reply();
        reply.setReplyText("수정된 댓글");
        reply.setReplyNo(rno);

        replyMapper.modify(reply);

        Reply one = replyMapper.findOne(rno);

        assertEquals("수정된 댓글", one.getReplyText());

    }

    @Test
    @DisplayName("특정 게시물의 댓글목록을 조회해야 한다.")
    void findAllTest() {
        List<Reply> replyList = replyMapper.findAll(297L, new Page());

        replyList.forEach(System.out::println);

        System.out.println("0번 : "+replyList.get(0));

        assertEquals(9, replyList.size());

    }


    @Test
    @DisplayName("특정 댓글을 조회해야 한다.")
    void findOneTest() {
        Reply reply = replyMapper.findOne(1L);


        System.out.println("댓글 : "+reply);

    }

    @Test
    @DisplayName("댓글 수 조회")
    void getReplyCountTest() {

        int replyCnt = replyMapper.getReplyCount(300L);


        assertEquals(203, replyCnt);

    }




}