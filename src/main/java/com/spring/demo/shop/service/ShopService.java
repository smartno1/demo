package com.spring.demo.shop.service;

import com.spring.demo.common.search.Search;
import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.repository.ShopMapper;
import com.spring.demo.shop.repository.ShopSoldMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShopService {

    private final ShopMapper shopMapper;
    private final ShopSoldMapper shopSoldMapper;

    public boolean insertService(Shop shop){
        return shopMapper.insert(shop);
    }

    public boolean updateService(Shop shop){
        return  shopMapper.update(shop);
    }

    public boolean deleteService(int id){
        return shopMapper.delete(id);
    }

    public  Shop findOneService(int id){

        Shop s = shopMapper.findOne(id);
        convertDateFormat(s);
        substringTitle(s);
        checkNewArticle(s);
        decimalFormat(s);
        return s;
    }

    public Map<String, Object> findAllService(Search search){
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<Shop> shopList = shopMapper.findAll(search);
        log.info("before converting shopList - {}",shopList);

        // 목록 중간 데이터 처리
        processConverting(shopList);
        log.info("after converting shopList - {}",shopList);
        findDataMap.put("shopList", shopList);
        findDataMap.put("tc", shopMapper.getTotalCount(search));
        log.info("findAll service End");

        return findDataMap;
    }

    private void processConverting(List<Shop> shopList) {
        for (Shop s : shopList) {
            convertDateFormat(s);
            substringTitle(s);
            checkNewArticle(s);
            decimalFormat(s);
        }
    }

    // 신규 게시물 여부 처리
    private void checkNewArticle(Shop s) {
        // 게시물의 작성일자와 현재 시간을 대조

        // 게시물의 작성일자 가져오기 - 16억 5초
        long regDateTime = s.getRegDate().getTime();

        // 현재 시간 얻기 (밀리초) - 16억 10초
        long nowTime = System.currentTimeMillis();

        // 현재시간 - 작성시간
        long diff = nowTime - regDateTime;

        // 신규 게시물 제한시간
        long limitTime = 60 * 5 * 1000;


        if (diff < limitTime) {
            s.setNewArticle(true);
        }
    }

    private void convertDateFormat(Shop s) {
        Date date = s.getRegDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd a hh:mm");
        s.setPrettierDate(sdf.format(date));
    }

    private void substringTitle(Shop s) {

        // 만약에 글제목이 5글자 이상이라면
        // 5글자만 보여주고 나머지는 ...처리
        String name = s.getName();
        if (name.length() > 10) {
            String subStr = name.substring(0, 10);
            s.setShortName(subStr + "...");
        } else {
            s.setShortName(name);
        }
    }

    private void decimalFormat(Shop s) {
        int price = s.getPrice();
        DecimalFormat df = new DecimalFormat("###,###");
        s.setDecimalPrice(df.format(price));
    }


}
