package com.spring.demo.visitor.repository;

import com.spring.demo.visitor.domain.Visitor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorMapper {

    Visitor findOne(String sessionId);

    boolean insert(Visitor visitor);

    boolean update(Visitor visitor);

    boolean delete(String sessionId);

}
