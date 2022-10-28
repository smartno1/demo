package com.spring.demo.common;

import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.service.GalleryService;
import com.spring.demo.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.nio.channels.MulticastChannel;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
public class UploadController {

    // 업로드 저장 경로
    private static final String UPLOAD_PATH = "D:\\java_project_09\\demo\\src\\main\\resources\\galleryImg";
    private final GalleryService galleryService;

    // upload-form.jsp로 포워딩 요청

    @GetMapping("/upload-form")
    public String uploadForm(){ return "upload/upload-form"; }

    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file, String fileText, HttpServletRequest request){
        log.info("/upload POST! - {} ", file);

//        for (MultipartFile file: fileList){
        log.info("file-name: {}", file.getName());
        log.info("file-origin-name: {}", file.getOriginalFilename());
        log.info("file-size: {}KB", (double) file.getSize() / 1024);
        log.info("file-type: {}", file.getContentType());
        System.out.println("==================================================================");

        Gallery gallery = FileUtils.uploadFile(file, fileText, UPLOAD_PATH, request);
//       }

        galleryService.saveService(gallery);

        return "redirect:/gallery/list";
    }
}
