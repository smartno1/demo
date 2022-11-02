package com.spring.demo.member.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.spring.demo.member.domain.OAuthValue.KAKAO_APP_KEY;
import static com.spring.demo.member.domain.OAuthValue.KAKAO_REDIRECT_URI;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/juso")
public class JusoController {

    @GetMapping("/jusoPopup")
    public void jusoTest(Model model) {
    }

    @PostMapping("/jusoPopup")
    public void jusoPostTest(Model model) {
    }


    @GetMapping("/Sample")
    public void sampleTest(Model model) {
    }




}
