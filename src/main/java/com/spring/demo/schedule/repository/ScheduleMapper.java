package com.spring.demo.schedule.repository;

import com.spring.demo.schedule.domain.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    public List<Schedule> getCalList(String account);
    //입력
    public boolean insertCalendar(Schedule ins);
    //수정
    public boolean updateCalendar(Schedule upt);
    //삭제
    public boolean deleteCalendar(int id);
}
