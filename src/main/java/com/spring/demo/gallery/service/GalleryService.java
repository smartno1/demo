package com.spring.demo.gallery.service;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.search.Search;
import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.repository.GalleryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@Service
@Log4j2
@RequiredArgsConstructor
public class GalleryService {

    private final GalleryMapper galleryMapper;

    public boolean saveService (Gallery gallery) {
        log.info("saveService start ");

        return galleryMapper.save(gallery);
    }

    @Transactional
    public Gallery findOneService (Long galleryNo){
        log.info("findOneService start - id : {}",galleryNo);

        return galleryMapper.findOne(galleryNo);
    }

    public Map<String, Object> findAllService(Search search) {
        log.info("findAllService start , search -- {}", search);

        Map<String, Object> findDataMap = new HashMap<>();

        // gallery 리스트
        List<Gallery> galleries = galleryMapper.findAll2(search);

        if(Objects.equals(search.getType(), "best" )){
            galleries = galleryMapper.findAll3(search);
            log.info("Type = best galleries -- {}",galleries);
        }

        // 토탈 카운트
        int totalCount = galleryMapper.getTotalCount2(search);

        findDataMap.put("galleries", galleries);
        findDataMap.put("tc", totalCount);
        return findDataMap;
    }

    public boolean modifyService (Gallery gallery){
        log.info("modifyService start ");

        return galleryMapper.modify(gallery);
    }

    public boolean deleteService(Gallery gallery){
        log.info("deleteService start - {}", gallery);

        return galleryMapper.delete(gallery);
    }

}
