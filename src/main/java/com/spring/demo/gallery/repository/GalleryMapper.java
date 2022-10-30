package com.spring.demo.gallery.repository;

import com.spring.demo.common.paging.Page;
import com.spring.demo.gallery.domain.Gallery;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GalleryMapper {

    // 저장
    boolean save(Gallery gallery);

    // 수정
    boolean modify(int id, String userId);
    // 개별조회
    Gallery findOne(int id);
    // 전체조회
    List<Gallery> findAll(Page page);
    // 전체 게시물 수 조회
    int getTotalCount();

    // 삭제

    // 업로드

    // 업로드 삭제

}
