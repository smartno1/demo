package com.spring.demo.shop.repository;

import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.domain.ShopSold;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopSoldMapper {

    boolean insert(ShopSold shopSold);

    boolean update(ShopSold shopSold);

    boolean delete(String account);

    List<ShopSold> findAll2(String account);

    int findAllCount(String account);

    ShopSold findOne(int id);
}
