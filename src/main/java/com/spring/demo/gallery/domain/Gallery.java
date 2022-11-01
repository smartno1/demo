package com.spring.demo.gallery.domain;

import lombok.*;

import java.time.LocalDate;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Gallery {

    private int galleryNo;
    private String src;
    private String text;
    private String account;
    private LocalDate regDate;
    private String nickname;
    private int likeCnt;




}
