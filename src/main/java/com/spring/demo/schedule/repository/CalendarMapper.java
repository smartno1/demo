package com.spring.demo.schedule.repository;

import com.spring.demo.schedule.domain.Calendar;
import com.spring.demo.schedule.dto.Dto;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

@Mapper
public interface CalendarMapper {

    List<Calendar> findAll();

    Calendar findOne(Dto dto);

    boolean insert(Calendar calendar);

    boolean update(Calendar calendar);

    boolean delete(Dto dto);


}
