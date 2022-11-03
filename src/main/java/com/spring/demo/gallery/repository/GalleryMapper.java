package com.spring.demo.gallery.repository;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.search.Search;
import com.spring.demo.gallery.domain.Gallery;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GalleryMapper {

    // 저장
    boolean save(Gallery gallery);

    // 수정
    boolean modify(Gallery gallery);
    // 개별조회
    Gallery findOne(Long id);
    // 전체조회
    List<Gallery> findAll(Page page);
    // 전체 게시물 수 조회
    int getTotalCount();
    // 조건 검색 리스트 조회
    List<Gallery> findAll2(Search search);

    List<Gallery> findAll3(Search search);

    // 조건 검색 리스트 수 조회
    int getTotalCount2(Search search);
    // 삭제
    boolean delete(Gallery gallery);
    // 업로드  - common/UploadController

    // 업로드 삭제

}
