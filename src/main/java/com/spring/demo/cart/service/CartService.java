package com.spring.demo.cart.service;


import com.spring.demo.cart.domain.Cart;
import com.spring.demo.cart.repository.CartMapper;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class CartService {

    private final CartMapper cartMapper;


    public int addCart(Cart cart){

        // 장바구니 데이터 체크
        Cart checkCart = cartMapper.checkCart(cart);

        if(checkCart != null) {
            return 2;
        }

        return cartMapper.addCart(cart);


    }

    public List<Cart> getCartList(String account){

        List<Cart> cartList = cartMapper.getCart(account);

        for(Cart cart : cartList) {
            cart.initTotal();
        }

        return cartList;

    }






}
