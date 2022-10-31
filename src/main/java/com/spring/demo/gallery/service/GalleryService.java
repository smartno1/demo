package com.spring.demo.gallery.service;

import com.spring.demo.common.paging.Page;
import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.repository.GalleryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    public Gallery findOneService (int id){
        log.info("findOneService start - id : {}",id);

        return galleryMapper.findOne(id);
    }

    public Map<String, Object> findAllService(Page page) {
        log.info("findAllService start ");

        Map<String, Object> findDataMap = new HashMap<>();

        List<Gallery> galleries = galleryMapper.findAll(page);

        int totalCount = galleryMapper.getTotalCount();

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
