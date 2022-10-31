package com.spring.demo.reply.domain;

import lombok.*;

import java.util.Date;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

    private Long replyNo;

    private String replyText;

    private String replyWriter;

    private Date replyDate;

    private Long boardNo;

    private String account;

    private int likeCnt;









}
