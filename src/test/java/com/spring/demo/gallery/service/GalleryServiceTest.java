package com.spring.demo.gallery.service;

import com.spring.demo.gallery.domain.Gallery;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class GalleryServiceTest {
    @Autowired
    GalleryService service;

   @Test
   @DisplayName("업로드")
   void saveServiceTest(){
        for(int i = 0; i < 300; i++){
            Gallery g = new Gallery();
            g.setSrc();
        }
    }



}