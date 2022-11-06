package com.spring.demo.schedule.service;

import com.spring.demo.schedule.domain.Calendar;
import com.spring.demo.schedule.dto.Dto;
import com.spring.demo.schedule.repository.CalendarMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@RequiredArgsConstructor
public class CalenderService {

    private final CalendarMapper calendarMapper;

    public List<Calendar> findAllService(){
        return calendarMapper.findAll();
    }

    public Calendar findOneService(Dto dto){ return  calendarMapper.findOne(dto);}

    public boolean insertService(Calendar calendar){

        return calendarMapper.insert(calendar);

    }

    public boolean updateService(Calendar calendar){

        return calendarMapper.update(calendar);
    }

    public boolean deleteService(Dto dto){

        return calendarMapper.delete(dto);
    }

}
