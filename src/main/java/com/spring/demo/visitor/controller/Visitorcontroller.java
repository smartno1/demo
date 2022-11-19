package com.spring.demo.visitor.controller;

import com.spring.demo.visitor.service.VisitorService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@Controller
@RequiredArgsConstructor
@Log4j2
public class Visitorcontroller {

    private final VisitorService visitorService;

    @GetMapping("/")
    public String insert(HttpSession session, HttpServletResponse response){
        visitorService.visitorService(session,response);

        return "index";
    }
}
