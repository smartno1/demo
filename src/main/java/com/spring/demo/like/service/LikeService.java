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


    // 추천 테이블 insert 후 추천값 수정
    public int updateLike(LikeTypeDTO like){

        if(isLike(like)){
            likeMapper.deleteLike(like);
        }else{
            likeMapper.insertLike(like);

        }
        likeMapper.updateLike(like);
        int cnt = likeMapper.likeCnt(like);;

        return cnt;

    }




    //기존에 추천을 한적이 있으면 true 반환
    public boolean isLike(LikeTypeDTO like){

        return likeMapper.likeChk(like)==1;

    }


//    public String getAccount(LikeTypeDTO like){
//
//        return likeMapper.findAccount(like);
//
//    }








}
