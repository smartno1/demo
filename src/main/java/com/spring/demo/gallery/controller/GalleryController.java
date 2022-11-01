package com.spring.demo.gallery.controller;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.paging.PageMaker;
import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.service.GalleryService;
import com.spring.demo.like.domain.Like;
import com.spring.demo.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@PropertySource("classpath:uploadpath.properties")
@RequestMapping("/member")
public class GalleryController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final GalleryService galleryService;


    @GetMapping("/gallrey/list")
    public String list(Page page, Model model, HttpServletRequest request){
        log.info("GalleryController /gallery/list GET!");

        Map<String , Object> galleryMap = galleryService.findAllService(page);
        log.info("/galleryImg/list GET! = {}", galleryMap);

        // 페이지 정보
        PageMaker pm = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (Integer) galleryMap.get("tc")
                );

        model.addAttribute("galleries", galleryMap.get("galleries"));
        model.addAttribute("pm", pm);

        // 루트 경로확인
//        String path = request.getSession().getServletContext().getRealPath("/");
//        log.info("realPath= {}",path );
        return "gallery/list";
    }

    @GetMapping("/upload-form")
    public String uploadForm(){

        return "upload/upload-form"; }

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
    @GetMapping("/gallery/del")
    public String del(int id, String pageNum, String amount){

        Gallery gallery = galleryService.findOneService(id);
        String src = gallery.getSrc();
//        log.info("/gallery/del GET! - {}", gallery);
//        log.info("pN - {} am - {}",pageNum,amount);

        try {
            //파일 삭제
            File delFile = new File(UPLOAD_PATH + src);

            delFile.delete();

            galleryService.deleteService(gallery);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/gallery/list?pageNum="+pageNum+"&amount="+amount;
    }




}
