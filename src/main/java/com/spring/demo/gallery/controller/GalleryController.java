package com.spring.demo.gallery.controller;

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

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    private final GalleryService galleryService;


    @GetMapping("/list")
    public String list(Model model, HttpServletRequest request){
        log.info("GalleryController /gallery/list GET!");

        List<Gallery> galleries = galleryService.findAllService();
        log.info("/galleryImg/list GET! = {}", galleries);
        model.addAttribute("galleries", galleries);
//        for(Gallery g : galleries){
//            String gsrc = g.getSrc();
////            String newgsrc = gsrc.replace("/","\\");
//            g.setSrc(newgsrc);
//        }
        String path = request.getSession().getServletContext().getRealPath("/");
        log.info("realPath= {}",path );
        return "/gallery/list";

    }


}
