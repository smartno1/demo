package com.spring.demo.schedule.controller;

import com.spring.demo.member.domain.Member;
import com.spring.demo.schedule.domain.Calendar;
import com.spring.demo.schedule.dto.Dto;
import com.spring.demo.schedule.service.CalenderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {

    private final CalenderService calenderService;

    @GetMapping("")
    public String viewSchedule(){

        log.info("schedule 호출");
        return "/schedule/schedule";


    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseEntity<List> list (HttpServletRequest request){

        Dto dto = new Dto();

        Member loginM = (Member) request.getSession().getAttribute("loginUser");
        String account = loginM.getAccount();
        if(account != null){
            dto.setAccount(account);
        }else{
            dto.setAccount("");
        }
        List<Calendar> calendarList = calenderService.findAllService(dto);
        r
    }

}
