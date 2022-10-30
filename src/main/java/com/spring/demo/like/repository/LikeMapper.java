package com.spring.demo.like.repository;

import com.spring.demo.like.dto.LikeTypeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface LikeMapper {



    public int likeCnt(LikeTypeDTO like);

    public boolean insertLike(LikeTypeDTO like);

    public boolean deleteLike(LikeTypeDTO like);

    public int likeChk(LikeTypeDTO like);


}
