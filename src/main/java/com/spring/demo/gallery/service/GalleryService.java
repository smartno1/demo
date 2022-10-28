package com.spring.demo.gallery.service;

import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.repository.GalleryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GalleryService {

    private final GalleryMapper galleryMapper;

    public boolean saveService (Gallery gallery) {
        log.info("saveService start ");

        return galleryMapper.save(gallery);
    }

    public Gallery findOneService (int id){
        log.info("findOneService start ");

        return galleryMapper.findOne(id);
    }

    public List<Gallery> findAllService() {
        log.info("findAllService start ");

        return galleryMapper.findAll();
    }

}
