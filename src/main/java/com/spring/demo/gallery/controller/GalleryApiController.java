package com.spring.demo.gallery.controller;

import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.service.GalleryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Log4j2
@RestController
@RequiredArgsConstructor
@CrossOrigin
//@RequestMapping("/api")
@PropertySource("classpath:uploadpath.properties")
public class GalleryApiController {

    private final GalleryService galleryService;
    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    @PutMapping("api/gallery/mod/{galleryId}")
    public String modify(@PathVariable("galleryId") Long gid, @RequestBody Gallery gallery) {
        log.info("/api/gallery/mod POST! - {}",gallery);
        boolean flag = galleryService.modifyService( gallery);

        return flag ? "mod-success" : "mod-fail";
    }

    @GetMapping("gallery/api/loadFile")
    public void download(@RequestParam("id") int id, HttpServletRequest request, HttpServletResponse response) {
        Gallery gallery = galleryService.findOneService(id);
        String filePath = gallery.getSrc();
        String fileName = filePath.substring(filePath.indexOf("_") + 1);
        try {
            byte[] fileByte = FileUtils.readFileToByteArray(new File(UPLOAD_PATH + filePath));
            log.info("fileByte = {}",fileByte);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;fileName=\""
                    + URLEncoder.encode(fileName, StandardCharsets.UTF_8) + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");

            response.getOutputStream().write(fileByte);
            response.getOutputStream().flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

