package com.spring.demo.cart.repository;

import com.spring.demo.cart.domain.Cart;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CartMapperTest {

    @Autowired
    CartMapper mapper;



//장바구니 10개 추가
    @Test
    public void addCart() {

        for(int i=1; i<11; i++) {

            String account = "hello";
            int goodsId = i;
            int count = 1;

            Cart cart = new Cart();
            cart.setAccount(account);
            cart.setGoodsId(goodsId);
            cart.setGoodsCnt(count);


        }
    }


    /* 장바구니 삭제 */

    @Test
    public void deleteCartTest() {
        int cartId = 1;

        mapper.deleteCart(cartId);

    }

    /* 굿즈 수량 수정 */

    @Test
    public void modifyCartTest() {
        int cartId = 3;
        int count = 5;

        Cart cart = new Cart();
        cart.setCartId(cartId);
        cart.setGoodsCnt(count);

        mapper.modifyCount(cart);

    }


    /* 장바구니 목록 */

    @Test
    public void getCartTest() {
        String account = "hello";


        List<Cart> list = mapper.getCart(account);
        for(Cart cart : list) {
            System.out.println(cart);
            cart.initTotal();
            System.out.println("cart : " + cart);
        }



    }


    /* 장바구니 확인 */

    @Test
    public void checkCartTest() {

        String account = "hello";
        int goodsId = 71;

        Cart cart = new Cart();
        cart.setAccount(account);
        cart.setGoodsId(goodsId);

        Cart resultCart = mapper.checkCart(cart);
        System.out.println("결과 : " + resultCart);

    }




}