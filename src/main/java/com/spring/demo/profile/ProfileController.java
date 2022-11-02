package com.spring.demo.profile;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {

    @GetMapping("")
    public String viewProfile(){

        log.info("profile 호출");
        return "/profile/profile";

    }
}
