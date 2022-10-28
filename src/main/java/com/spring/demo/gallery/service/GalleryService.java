package com.spring.demo.gallery.service;

import com.spring.demo.common.page.Page;
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
    public Gallery findOneService (int id){
        log.info("findOneService start ");

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

    public boolean modifyService (int id, String userId){
        log.info("modifyService start ");

        return galleryMapper.modify(id, userId);
    }


}
