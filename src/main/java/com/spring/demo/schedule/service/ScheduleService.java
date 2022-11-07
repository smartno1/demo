package com.spring.demo.schedule.service;

import com.spring.demo.schedule.domain.Schedule;
import com.spring.demo.schedule.repository.ScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;

    public List<Schedule> getCalListService(String account){

        return scheduleMapper.getCalList(account);
    }

    public boolean insertCalendarService(Schedule ins){

        return scheduleMapper.insertCalendar(ins);
    }

    public boolean updateCalendarService(Schedule upt){
        return scheduleMapper.updateCalendar(upt);
    }

    public boolean deleteCalendarService(int id){
        return scheduleMapper.deleteCalendar(id);
    }

}
