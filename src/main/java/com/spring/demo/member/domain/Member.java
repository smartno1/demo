package com.spring.demo.member.domain;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    private String account;
    private String password;
    private FavoriteMember favorite;
    private String nickname;
    private String name;
    private String phoneNum;
    private String birth;
    private String address;
    private String email;
    private Gender gender;
    private Auth auth;
    private Date regDate;
    private String sessionId;
    private Date limitTime;

    //-----------------
    private int basket;
}
