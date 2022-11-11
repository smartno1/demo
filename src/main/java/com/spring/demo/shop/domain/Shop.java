package com.spring.demo.shop.domain;

import lombok.*;

import java.time.LocalDate;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Shop {

        private int id;
        private String name;
        private String content;
        private String img;
        private String price;
        private int stock;
        private LocalDate regDate;


}
