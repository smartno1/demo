package com.spring.demo.schedule;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {

    @GetMapping("")
    public String viewSchedule(){

        log.info("schedule 호출");
        return "/schedule/schedule";


    }

}
