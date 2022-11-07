package com.spring.demo.schedule.controller;

import com.spring.demo.member.domain.Member;
import com.spring.demo.schedule.domain.Calendar;
import com.spring.demo.schedule.dto.Dto;
import com.spring.demo.schedule.repository.CalendarMapper;
import com.spring.demo.schedule.service.CalenderService;
import com.spring.demo.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.spring.demo.util.LoginUtils.getCurrentMemberAccount;
import static com.spring.demo.util.LoginUtils.isLogin;

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
    public List list (HttpServletRequest request){

        log.info("list - start");
        Dto dto = new Dto();

        HttpSession session = request.getSession();
//        if(!isLogin(session)){
//
//
//        }else{
//            dto.setAccount(getCurrentMemberAccount(session));
//
//        }

        log.info(dto);

        List<Calendar> calenderList = new ArrayList<>(calenderService.findAllService());

        log.info(calenderList);

        return calenderList;

    }
    @PostMapping("/update")
    @ResponseBody
    public String update (@RequestBody Calendar calendar, HttpServletRequest request, HttpServletResponse response) {

        Dto dto = new Dto(calendar.getAccount(), calendar.getNo());

        log.info("no = {},  acc = {}",dto.getNo(),dto.getAccount());
//        if(dto.getNo() > 0) {
//            log.info("update");
//            boolean flag = calenderService.updateService(calendar);
//        }
//        if (calenderService.findOneService(dto) == null) {
            log.info("insert");

            boolean flag = calenderService.insertService(calendar);
//        } else {

//        }

        return "redirect:/schedule/list";

    }

    @PostMapping("/delete")
    public String delete(@RequestBody Dto dto, HttpServletRequest request){


        log.info("delete ");
        calenderService.deleteService(dto);

        return "redirect:/schedule/list";
    }

}
