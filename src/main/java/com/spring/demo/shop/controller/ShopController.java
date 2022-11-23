package com.spring.demo.shop.controller;

import com.spring.demo.common.paging.Page;
import com.spring.demo.common.paging.PageMaker;
import com.spring.demo.common.search.Search;
import com.spring.demo.like.domain.Like;
import com.spring.demo.member.domain.Member;
import com.spring.demo.shop.domain.PurchaseDone;
import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.domain.ShopSold;
import com.spring.demo.shop.service.ShopService;
import com.spring.demo.shop.service.ShopSoldService;
import com.spring.demo.util.FileUtils;
import com.spring.demo.visitor.domain.Visitor;
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

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import static com.spring.demo.util.LoginUtils.*;

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
        log.info(id);
        log.info(search);
        return "shop/shop-detail";
    }

    @Transactional
    @PostMapping("/buy")
    @ResponseBody
    public String buy(@RequestBody ShopSold shopSold, HttpSession session ){
            ShopSold shopSold2 = shopSoldService.findOneService(shopSold.getId());
        if(shopSold2 == null){
            shopSold.setPurchaseAccount(getCurrentMemberAccount(session));
            shopSold.setPrice(shopService.findOneService(shopSold.getGoodsId()).getPrice());
            shopSold.setTotalPrice(shopSold.getPrice() * shopSold.getCount());
            if(shopSold.isPurchase()){
                shopSold.setPurchaseComplete(PurchaseDone.DONE);
            }else{
                shopSold.setPurchaseComplete(PurchaseDone.BASKET);
            }
            return shopSoldService.insertService(shopSold) ? "success" : "fail";
        }else{
            shopSold2.setRecipient(shopSold.getRecipient());
            shopSold2.setDeliveryAddress(shopSold.getDeliveryAddress());
            String msg = shopSoldService.updateService(shopSold2) ? "success_"+shopSold2.getId() : "fail_"+shopSold2.getId();
            log.info("msg - {}",msg);
            return msg;
        }
    }

    @Transactional
    @PostMapping("/basket")
    @ResponseBody
    public String basket(@RequestBody ShopSold shopSold, HttpSession session){

        shopSold.setPrice(shopService.findOneService(shopSold.getGoodsId()).getPrice());
        shopSold.setTotalPrice(shopSold.getPrice() * shopSold.getCount());
        if(isLogin(session)){
            shopSold.setPurchaseAccount(getCurrentMemberAccount(session));
        }else{
            shopSold.setPurchaseAccount(getCurrentVisitor(session));
        }

        if(shopSold.isPurchase()){
            shopSold.setPurchaseComplete(PurchaseDone.DONE);
        }else{
            shopSold.setPurchaseComplete(PurchaseDone.BASKET);
        }
        boolean flag = false;
        if(shopSoldService.insertService(shopSold)){
            if(isLogin(session)){
                Member member = (Member) session.getAttribute("loginUser");
                member.setBasket(shopSoldService.findAllCountService(member.getAccount()));
            }else{
                Visitor visitor = (Visitor) session.getAttribute("visitor");
                visitor.setBasket(shopSoldService.findAllCountService(visitor.getSessionId()));
            }
            flag = true;
        }
        return flag?"success":"fail";
    }

    @GetMapping("/basket")
    public String basket(HttpSession session, Model model){
        String account = "";
        if(isLogin(session)){
            account = getCurrentMemberAccount(session);
        }else{
            account = getCurrentVisitor(session);
        }

        List<ShopSold> shopSoldList = shopSoldService.findAllService(account);
        List<Shop> shopList = new ArrayList<>();
        for (ShopSold s:shopSoldList) {
            Shop shop = shopService.findOneService(s.getGoodsId());
            s.setName(shop.getName());
            s.setSrc(shop.getSrc());
        }
        model.addAttribute("shopSolds",shopSoldList);

        return "shop/shop-basket";
    }



}
