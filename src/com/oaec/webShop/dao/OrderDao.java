package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    //根据用户编号查询订单
    List<Map<String,Object>> queryOrderByUserId(Integer userId);
    //查询订单包含的商品
    List<Map<String ,Object>> queryGoodsByOrederId(Integer orderId);
    //查询订单的总金额
    Double getTotalPrice(Integer orderId);
    //订单主表插入
    int doInsert(Integer userId, Integer placeId);
    //订单明细表插入数据
    int doInsertDetails(Map<String,Object> param );
}
