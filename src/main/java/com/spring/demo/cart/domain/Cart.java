package com.spring.demo.cart.domain;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Cart {


    private int cartId;

    private String account;

    private int goodsId;

    private int goodsCnt;

    //goods

    private String goodsName;

    private int goodsPrice;


    // 추가

    private int totalPrice;



    public void initTotal(){
        this.totalPrice = this.goodsPrice * this.goodsCnt;
    }

}
