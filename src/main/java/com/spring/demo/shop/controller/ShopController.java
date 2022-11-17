package com.spring.demo.shop.controller;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.paging.PageMaker;
import com.spring.demo.common.search.Search;
import com.spring.demo.like.domain.Like;
import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.domain.ShopSold;
import com.spring.demo.shop.service.ShopService;
import com.spring.demo.shop.service.ShopSoldService;
import com.spring.demo.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

import static com.spring.demo.util.LoginUtils.getCurrentMemberAccount;
import static com.spring.demo.util.LoginUtils.getCurrentMemberAuth;

@Controller @RequiredArgsConstructor
@Log4j2 @PropertySource("classpath:uploadpath.properties")
@RequestMapping("/shop")
public class ShopController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    private final ShopService shopService;
    private final ShopSoldService shopSoldService;

    @GetMapping("/list")
    public String list (@ModelAttribute("s") Search search, Model model){

        Map<String, Object> shopMap = shopService.findAllService(search);

        // 페이지 정보 생성
        PageMaker pm = new PageMaker(
                new Page(search.getPageNum(), search.getAmount())
                , (Integer) shopMap.get("tc"));
        log.info("pm - {}", pm);

        model.addAttribute("goods", shopMap.get("shopList"));
        model.addAttribute("pm", pm);

        return "shop/shop-list";
    }


    @GetMapping("/regist")
    public String regist(){

        return "shop/regist-form";
    }

    @Transactional
    @PostMapping("/regist")
    public String regist(MultipartFile file, HttpServletRequest request){

        HttpSession session = request.getSession();
        // 관리자가 아니라면 리스트로 돌려보내기
        if(!getCurrentMemberAuth(session).equals("ADMIN") || session == null ) {
            log.info("돌아가");
            return "shop/shop-list";
        }

        Shop shop = FileUtils.uploadShop(file,UPLOAD_PATH,request);

        log.info("upload - {}",shop);
        shopService.insertService(shop);

        return "redirect:/shop/list";
    }



    @GetMapping("/detail")
    public String detail(int id,Search search, Model model){

        Shop shop = shopService.findOneService(id);

        model.addAttribute("g",shop);
        model.addAttribute("s", search);

        return "shop/shop-detail";
    }

    @Transactional
    @PostMapping("/buy")
    @ResponseBody
    public String buy(@RequestBody ShopSold shopSold, HttpSession session ){

        shopSold.setPurchaseAccount(getCurrentMemberAccount(session));
        shopSold.setPurchaseComplete(true);
        shopSold.setPrice(shopService.findOneService(shopSold.getGoodsId()).getPrice());
        shopSold.setTotalPrice(shopSold.getPrice()*shopSold.getCount());
//        log.info(shopSold);

        return shopSoldService.insertService(shopSold)? "success":"fail";
    }


}
