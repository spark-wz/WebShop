package com.oaec.webShop.service;

import java.util.List;
import java.util.Map;

public interface CartService {
    //查询指定用户购物车中的商品
    List<Map<String,Object>> getCartGoods( Integer id);
    Map<String,Object> getNum(Integer id);
    //添加商品到购物车
    Boolean addCart(Integer userId ,Integer goodsId , Integer num);
    //删除购物车
    Boolean deleteCart(Integer id ,Integer goodsId);
    //全部删除购物车，假删除
    boolean deleteAll(Integer id);
    //购物车添加删除按钮
    boolean updateGoodsNum( String action ,Integer id ,Integer goodsId);
    //控制添加不能超出库存
    Map<String, Object> controlReserveNotFull(Integer goodsId);
    Map<String, Object> getTotal(Integer userId,String[] goods);
    List<Map<String, Object>> getGoodsCheckOut(Integer userId,String[] goods);
    boolean getRecycleCart(Integer userId);
}
