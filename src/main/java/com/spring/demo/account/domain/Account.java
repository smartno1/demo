package com.spring.demo.account.domain;


import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Account {

    private Long userNo;

    private String userId;

    private String password;
    private String name;
    private String email;
    private String address;
    private String phone;
    private String birth;
    private String favorMember;
    private Date regDate;
    private Date lastDate;
    private int level;

}
