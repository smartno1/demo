package com.spring.demo.myPage.dto;

import com.spring.demo.reply.domain.Reply;
import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPageReplyDTO extends Reply {

    private Date boardDate;
    private String boardTitle;
    private int boardReplyCnt;


}
