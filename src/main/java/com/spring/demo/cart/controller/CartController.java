package com.spring.demo.cart.controller;


import com.spring.demo.cart.domain.Cart;
import com.spring.demo.cart.service.CartService;
import com.spring.demo.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;


    @PostMapping("/add")
    @ResponseBody
    public String addCartPOST(Cart cart, HttpSession session) {

        String account = LoginUtils.getCurrentMemberAccount(session);

        if(!(cart.getAccount().equals(account))) return "wrong-approach";

        int result = cartService.addCart(cart);

        switch (result){
            case 1:
                return "addCart-Success";
            case 2:
                return "addCart-inNotEmpty";
            default:
                return "addCart-failed";
        }

    }

    @GetMapping("")
    @ResponseBody
    public List<Cart> cartPageGET(HttpSession session) {

        String account = LoginUtils.getCurrentMemberAccount(session);


        List<Cart> cartList = cartService.getCartList(account);

        return cartList;
    }



}
