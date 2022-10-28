package com.spring.demo.gallery.controller;

import com.spring.demo.common.page.Page;
import com.spring.demo.common.page.PageMaker;
import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.service.GalleryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    private final GalleryService galleryService;


    @GetMapping("/list")
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
        return "/gallery/list";

    }


}
