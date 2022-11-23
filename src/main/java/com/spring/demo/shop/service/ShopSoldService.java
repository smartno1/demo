package com.spring.demo.shop.service;

import com.spring.demo.like.domain.Like;
import com.spring.demo.shop.domain.PurchaseDone;
import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.domain.ShopSold;
import com.spring.demo.shop.repository.ShopSoldMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ShopSoldService {

    private final ShopSoldMapper shopSoldMapper;

    private final ShopService shopService;

    public boolean insertService(ShopSold shopSold){

       boolean flag = shopSoldMapper.insert(shopSold);
       if(flag){
            if(shopSold.isPurchase()) {
                Shop shop = new Shop();
                shop.setId(shopSold.getGoodsId());
                shop.setStock((long) shopSold.getCount());
                return shopService.updateCountService(shop);
            }else {
                return true;
            }
       }else {
           return false;
       }
    }

    public List<ShopSold> findAllService(String account){

        return shopSoldMapper.findAll2(account);
    }

    public int findAllCountService(String account){
        return shopSoldMapper.findAllCount(account);
    }

    public ShopSold findOneService(int id){
        return shopSoldMapper.findOne(id);
    }

    public boolean updateService(ShopSold shopSold2){
        shopSold2.setPurchaseComplete(PurchaseDone.DONE);
        boolean flag = shopSoldMapper.update(shopSold2);
        if(flag){
            Shop shop = new Shop();
            shop.setId(shopSold2.getGoodsId());
            shop.setStock((long) shopSold2.getCount());
            return shopService.updateCountService(shop);
        }else {
            return false;
        }
    }

}
