package com.spring.demo.like.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.spring.demo.util.LoginUtils.getCurrentMemberAccount;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Log4j2
@AllArgsConstructor
public class LikeTypeDTO {

    public String account;

    public String type;

    public Long no;



    public LikeTypeDTO(HttpServletRequest request){

        HttpSession session = request.getSession();

        String account = getCurrentMemberAccount(session);

        String boardNo = request.getParameter("boardNo");

        String replyNo = request.getParameter("replyNo");

        if(boardNo !=null){

            log.info("게시판 추천 기능");

            this.account = account;
            this.type = "boardNo";
            this.no = Long.parseLong(boardNo);


        }else if(replyNo !=null){

            log.info("댓글 추천 기능");
            this.account = account;
            this.type = "replyNo";
            this.no = Long.parseLong(replyNo);

        }


    }



}


