package com.spring.demo.schedule.domain;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Calendar {

    private int calNo;
    private String title;
    private String start;
    private String end;
    private String content;
    private String account;
}
