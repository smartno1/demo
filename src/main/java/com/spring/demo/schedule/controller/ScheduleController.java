package com.spring.demo.schedule.controller;

import com.spring.demo.member.domain.Member;
import com.spring.demo.schedule.domain.Calendar;
import com.spring.demo.schedule.dto.Dto;
import com.spring.demo.schedule.service.CalendarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.spring.demo.util.LoginUtils.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {

    private final CalendarService calendarService;


    @GetMapping("")
    public String viewSchedule(){

        log.info("schedule 호출");
        return "schedule/schedule";


    }

    @GetMapping("/list")
    @ResponseBody
    public List list (HttpServletRequest request){

        log.info("list - start");
        Dto dto = new Dto();

        HttpSession session = request.getSession();
        if(isLogin(session)){
            dto.setAccount(getCurrentMemberAccount(session));
        }

        log.info(dto);

        List<Calendar> calenderList = new ArrayList<>(calendarService.findAllService(dto));

        log.info(calenderList);

        return calenderList;

    }
    @PostMapping("/update")
    @ResponseBody
    public String update (@RequestBody Calendar calendar, HttpServletRequest request, HttpServletResponse response) {

        Dto dto = new Dto(calendar.getAccount(), calendar.getId());
        HttpSession session = request.getSession();
//        log.info("auth  {}" , getCurrentMemberAuth(session));
        if(!getCurrentMemberAuth(session).equals("ADMIN")){
            calendar.setBackgroundColor("#ffc0cb");
            calendar.setBorderColor("#ffc0cb");
        }

        log.info("id = {},  acc = {}",dto.getId(),dto.getAccount());
        log.info("calendar = {}",calendar);
        boolean flag;
        if (calendarService.findOneService(dto) != null){
            log.info("update");
            flag = calendarService.updateService(calendar);
        }else{
            log.info("insert");

            flag = calendarService.insertService(calendar);
        }

//        } else {

//        }

        return "redirect:/schedule/list";

    }

    @PostMapping("/delete")
    public String delete(@RequestBody Dto dto, HttpServletRequest request){


        log.info("delete ");
        calendarService.deleteService(dto);

        return "redirect:/schedule/list";
    }

}