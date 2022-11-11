package com.spring.demo.shop.controller;

import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.service.ShopService;
import com.spring.demo.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller @RequiredArgsConstructor
@Log4j2 @PropertySource("classpath:uploadpath.properties")
@RequestMapping("/shop")
public class ShopController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    private final ShopService shopService;

    @GetMapping("/list")
    public String list (){
        return "shop/shop-list";
    }


    @GetMapping("/regist")
    public String regist(){

        return "shop/regist-form";
    }
    @PostMapping("/regist")
    public void resist2(MultipartFile file, HttpServletRequest request){

        Shop shop = FileUtils.uploadShop(file,UPLOAD_PATH,request);

        log.info("upload - {}",shop);
        shopService.insertService(shop);

    }

    @GetMapping("/detail")
    public String detail(){
        return "";
    }

}
