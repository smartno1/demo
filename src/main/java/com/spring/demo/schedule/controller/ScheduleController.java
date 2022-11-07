package com.spring.demo.schedule.controller;

import com.spring.demo.member.domain.Member;
import com.spring.demo.schedule.domain.Schedule;
import com.spring.demo.schedule.repository.ScheduleMapper;
import com.spring.demo.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("")
    public String viewSchedule(){

        log.info("schedule 호출");
        return "/schedule/schedule";
    }

    // http://localhost:7080/springweb/calendar.do
   @PostMapping("/calendar.do")
    public String calendar() {
        return "schedule/schedule";
    }

    // http://localhost:7080/springweb/calList.do
    @RequestMapping("/calList.do")
    public String calList(HttpSession session, Model model) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        model.addAttribute("callist", scheduleService.getCalListService(loginUser.getAccount()));
        return "pageJsonReport";
    }

    // http://localhost:7080/springweb/calInsert.do
    @RequestMapping("/calInsert.do")
    public String calInsert(Schedule ins) {
        scheduleService.insertCalendarService(ins);

        // 등록 후, 초기화면으로 이동
        return "redirect:/schedule/calendar.do";
    } // calUpdate.do calDelete.do
    // http://localhost:7080/springweb/calUpdate.do

    @RequestMapping("/calUpdate.do")
    public String updateCalendar(Schedule upt) {
        System.out.println("## 수정 ##");
        System.out.println(upt.getTitle());


        scheduleService.updateCalendarService(upt);
        return "redirect:/schedule/calendar.do";
    }

    // http://localhost:7080/springweb/calDelete.do
    @RequestMapping("/calDelete.do")
    public String deleteCalendar(int id) {
        scheduleService.deleteCalendarService(id);
        return "redirect:/schedule/calendar.do";
    }

}
