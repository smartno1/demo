package com.spring.demo.gallery.controller;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.paging.PageMaker;
import com.spring.demo.common.search.Search;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Collection;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@PropertySource("classpath:uploadpath.properties")
//@RequestMapping("")
public class GalleryController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final GalleryService galleryService;


    @GetMapping("/gallery/list")
    public String list(@ModelAttribute("search") Search search, Model model, HttpServletRequest request ){
        log.info("GalleryController /gallery/list GET!");

        // amount 변경.
        search.setAmount(8);
        log.info("search - {}",search);

        Map<String , Object> galleryMap = galleryService.findAllService(search);
        log.info("/galleryImg/list GET! = {}", galleryMap);

        // 페이지 정보
        PageMaker pm = new PageMaker(
                new Page(search.getPageNum(), search.getAmount())
                , (Integer) galleryMap.get("tc")
                );
        log.info("pm ==> {}",pm);
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
        log.info("upload ======= {}",gallery);
        galleryService.saveService(gallery);

        return "redirect:/gallery/list";
    }
    @Transactional
    @GetMapping("/gallery/del")
    public ModelAndView del(Long galleryNo, String pageNum, String amount, Model model, HttpServletRequest request){

//        String refer = request.getHeader("Referer");
//        log.info(refer);
        Gallery gallery = galleryService.findOneService(galleryNo);
        String src = gallery.getSrc();
        log.info("/gallery/del GET! - {}", gallery);
//        log.info("pN - {} am - {}",pageNum,amount);


        ModelAndView mv = new ModelAndView();
        mv.addObject("gallery", gallery);
        mv.setViewName("redirect:/gallery/list");
        try {
            //파일 삭제
            File delFile = new File(UPLOAD_PATH + src);

            delFile.delete();

            galleryService.deleteService(gallery);
            String url = "redirect:/gallery/list?pageNum="+pageNum+"&amount="+amount;
            mv.setViewName(url);
            log.info("model === {}", mv);

            return mv;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }
}
