package com.spring.demo.shop.repository;

import com.spring.demo.common.search.Search;
import com.spring.demo.shop.domain.Shop;
import com.spring.demo.shop.domain.ShopSold;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopMapper {

    boolean insert(Shop shop);

    boolean update(Shop shop);

    boolean delete(int id);

    List<Shop> findAll(Search search);

    Shop findOne(int id);

    int getTotalCount(Search search);
}
