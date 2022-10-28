package com.spring.demo.gallery.domain;

import lombok.*;

import java.time.LocalDate;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Gallery {

    private int id;
    private String src;
    private String text;
    private String userId;
    private LocalDate regDate;
    private int like;




}
