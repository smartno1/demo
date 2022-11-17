package com.spring.demo.shop.service;

import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.domain.ShopSold;
import com.spring.demo.shop.repository.ShopSoldMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class ShopSoldService {

    private final ShopSoldMapper shopSoldMapper;

    private final ShopService shopService;

    public boolean insertService(ShopSold shopSold){

       boolean flag = shopSoldMapper.insert(shopSold);
       if(flag){

           Shop shop = new Shop();
           shop.setId(shopSold.getGoodsId());
           shop.setStock((long) shopSold.getCount());
           return  shopService.updateCountService(shop);

       }else {
           return false;
       }
    }

}
