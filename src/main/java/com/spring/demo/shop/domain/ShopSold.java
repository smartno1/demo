package com.spring.demo.shop.domain;

import lombok.*;

import java.time.LocalDate;

@Setter @Getter @ToString
@AllArgsConstructor @NoArgsConstructor
public class ShopSold {
    private int id;
    private int goodsId;
    private String purchaseAccount;
    private String recipient;
    private String deliveryAddress;
    private PurchaseDone purchaseComplete;
    private int count;
    private int price;
    private int totalPrice;
    private LocalDate regDate;

    //---------
    private boolean purchase;
    private String name;
    private String src;
}