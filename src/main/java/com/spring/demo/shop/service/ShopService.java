package com.spring.demo.shop.service;

import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.repository.ShopMapper;
import com.spring.demo.shop.repository.ShopSoldMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<Shop> findAllService(){
        return shopMapper.findAll();
    }

    public  Shop findOneService(int id){
        return shopMapper.findOne(id);
    }

}
