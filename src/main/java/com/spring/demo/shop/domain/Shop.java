package com.spring.demo.shop.domain;

import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Shop {

        private int id;
        private String name;
        private String content;
        private String src;
        private int price;
        private String origin;
        private Long stock;
        private Date regDate;

        // 커스텀 데이터 필드
        private String decimalPrice;
        private String shortName; // 줄임 제목
        private String prettierDate; // 변경된 날짜포맷 문자열
        private boolean newArticle; // 신규 게시물 여부



}
