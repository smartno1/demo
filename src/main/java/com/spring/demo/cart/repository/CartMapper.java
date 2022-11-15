package com.spring.demo.cart.repository;

import com.spring.demo.cart.domain.Cart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {


    /* 장바구니 추가 */
    public int addCart(Cart cart);

    /* 장바구니 삭제 */
    public int deleteCart(int cartId);

    /* 장바구니 수량 수정 */
    public int modifyCount(Cart cart);

    /* 장바구니 목록 */
    public List<Cart> getCart(String account);

    /* 장바구니 확인 */
    public Cart checkCart(Cart cart);


}

