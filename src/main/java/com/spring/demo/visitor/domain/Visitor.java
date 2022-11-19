package com.spring.demo.visitor.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Visitor {

    private String sessionId;
    private Date limitTime;

    //---------------
    private int basket;

    public Visitor(String sessionId, Date limitTime) {
        this.sessionId = sessionId;
        this.limitTime = limitTime;
    }

}
