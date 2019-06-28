package com.oaec.webShop.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
    //商品的检索
    List<Map<String ,Object>> queryGoods(String name, String id , String bid);
    //根据编号获取一个商品
    Map<String ,Object> queryGoodsById(String id );
    //心愿单
    boolean addWishGoods(Integer userId,Integer goodsId);
    //查询所有的商品分页
    List<Map<String,Object>> queryPageGoodsAll(Integer page);
}
