package com.spring.demo.account.controller;

import com.fasterxml.jackson.databind.ser.std.StdArraySerializers;
import com.spring.demo.account.domain.Account;
import com.spring.demo.account.service.AccountService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;

/*
 로그인 화면 요청: /login : GET
 로그인 요청 : /login : POST
 회원가입 화면 요청 : /join : GET
 회원가입 요청 : /join : POST
 */
@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/account")
public class AccountController {

    private final AccountService accountService;

    @GetMapping("/join")
    public String join (){
        log.info("controller request /account/join GET!");

        return "account/account-join";
    }


    @PostMapping("/join")
    public String join2(Account account){
        log.info("controller request /account/join POST! = {}", account);

        boolean flag =  accountService.joinService(account);

        if (flag) {
            return "index";
        }else {
            return "account/join-failed";
        }
    }


    @GetMapping("/login")
    public String login() {
        log.info("controller request /account/login GET!");

        return "account/account-login";
    }

    @PostMapping("/login")
    public String login(Account account, Model model, HttpSession session){
        log.info("controller request /account/login POST!", account);

        Account user = accountService.loginService(account);

        if(user != null){
            session.setAttribute("user", user);

            return "/index";
        }else {
            model.addAttribute("input", account);
            model.addAttribute("msg", "id pw 불일치");
            return "/account/account-login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        log.info("controller request /account/logout GET!");
        HttpSession session = req.getSession();
        session.invalidate();
        return "/index";
    }
}
