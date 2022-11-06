package com.spring.demo.schedule.domain;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Calendar {

    private int no;
    private String title;
    private String start;
    private String end;
    private String content;
    private String account;
    private boolean allDay;
}
