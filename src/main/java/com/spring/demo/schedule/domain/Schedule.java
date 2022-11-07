package com.spring.demo.schedule.domain;

import lombok.*;

@Setter @Getter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Schedule {
    private int id;
    private String account;
    private String title;
    private String start;
    private String end;
    private String content;
    private String borderColor;
    private String backgroundColor;
    private String textColor;
    private boolean allDay;
    private String auth;

}

