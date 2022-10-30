package com.spring.demo.like.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface LikeMapper {



    public int addLike(Map<String, Integer> checkMap);

    public int subLike(Map<String, Integer> checkMap);

    public boolean insertLike(@Param("checkMap")Map<String, Integer> checkMap,@Param("account") String account);

    public boolean deleteLike(Map<String, Integer> checkMap, String account);

    public int likeChk(Map<String, Integer> checkMap, String account);


}
