package com.spring.demo.like.service;

import com.spring.demo.like.dto.LikeTypeDTO;
import com.spring.demo.like.repository.LikeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class LikeService {

    private final LikeMapper likeMapper;


    public int updateLike(LikeTypeDTO like){

        if(isLike(like)==0){
            addLike(like);
        }else{
            subLike(like);
        }

        return likeCnt(like);

    }


    public int likeCnt(LikeTypeDTO like){

        return likeMapper.likeCnt(like);
    }



    public boolean addLike(LikeTypeDTO like){

        return likeMapper.insertLike(like);

    }

    public boolean subLike(LikeTypeDTO like){

        return likeMapper.deleteLike(like);

    }

    public int isLike(LikeTypeDTO like){

        return likeMapper.likeChk(like);

    }









}
