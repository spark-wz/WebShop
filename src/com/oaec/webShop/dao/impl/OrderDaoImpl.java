package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.OrderDao;
import com.oaec.webShop.util.CommonDao;

import java.util.List;
import java.util.Map;

public class OrderDaoImpl extends CommonDao implements OrderDao {
    @Override
    public List<Map<String, Object>> queryOrderByUserId(Integer userId) {
        String sql  = "select  *  from ORDERS where  USERS_ID = ?";
        return query4MapList(sql,userId);
    }

    @Override
    public List<Map<String, Object>> queryGoodsByOrederId(Integer orderId) {
        String sql = "select DETAILS.GOODS_ID, DETAILS.GOODS_ADDRESS,DETAILS.GOODS_NAME,DETAILS.GOODS_PRICE,DETAILS.DETAILS_NUM from orders ,DETAILS where orders.orders_id = details.orders_id and orders.orders_id = ?";
        return query4MapList(sql,orderId);
    }

    @Override
    public Double getTotalPrice(Integer orderId) {
        String sql = "select sum(DETAILS.DETAILS_NUM*DETAILS.GOODS_PRICE) total_price from orders ,DETAILS where orders.orders_id = details.orders_id and orders.orders_id = ?";
        Map<String, Object> map = query4Map(sql, orderId);
        System.out.println("map = " + map);
        return Double.parseDouble(map.get("total_price").toString());
    }

    @Override
    public int doInsert(Integer userId, Integer placeId) {
        String sql = "insert into ORDERS values (?,1,sysdate,?,?)";
        int orderId = getOrderId();
        int i = executeUpdate(sql,orderId , userId, placeId);
        if (i == 1) {
            return orderId;
        }
        return 0;
    }

    @Override
    public int doInsertDetails(Map<String, Object> param) {
        String sql = "insert  into DETAILS values (SEQ_DETAILS.nextval,?,?,?,?,?,?)";
        return executeUpdate(sql,param.get("orders_id"),param.get("goods_id"),param.get("goods_name"),param.get("goods_address"),param.get("goods_price"),param.get("cart_num"));
    }

    private int getOrderId(){
        String sql = "select SEQ_ORDER.nextval orders_id from dual";
        Map<String, Object> map = query4Map(sql);
        int id = Integer.parseInt(map.get("orders_id").toString());
        return id;
    }
}
