package com.oaec.webShop.service.impl;

import com.oaec.webShop.dao.CartDao;
import com.oaec.webShop.dao.impl.CartDaoImpl;
import com.oaec.webShop.service.CartService;
import com.oaec.webShop.util.CommonDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartServiceImpl extends CommonDao implements CartService {
    private CartDao cartDao = new CartDaoImpl();

    @Override
    public List<Map<String, Object>> getCartGoods(Integer id) {
        return cartDao.queryByUserId(id);
    }

    @Override
    public Map<String, Object> getNum(Integer id) {
        Map<String, Object> map = cartDao.countNum(id);
        return map;
    }

    @Override
    public Boolean addCart(Integer userId, Integer goodsId, Integer num) {
        //查询用户当前的购物车是否存在商品
        Map<String, Object> map1 = cartDao.queryByUserIDAndGoodsId(userId, goodsId);
        Map<String , Object> map = new HashMap<>();
        map.put("num", num);
        map.put("userId", userId);
        map.put("goodsId", goodsId);
        int i = 0;
        if (map1 == null){
            //不存在add
            i = cartDao.doInsert(map);
        }else {
            //存在update
            i = cartDao.updateNum(map);
        }
        return i==1;
    }

    @Override
    public Boolean deleteCart(Integer id, Integer goodsId) {
        int i = cartDao.dodelete(id, goodsId);
        return i==1;
    }

    @Override
    public boolean deleteAll(Integer id) {
        int i = cartDao.nullCart(id);
        return i==1;
    }

    @Override
    public boolean updateGoodsNum(String action, Integer id, Integer goodsId) {
        int i = 0;
        if ("add".equals(action)){
            i = cartDao.addCartNum(id, goodsId);
        }else {
             i = cartDao.subCartNum(id, goodsId);
        }
        return i==1;
    }

    @Override
    public Map<String, Object> controlReserveNotFull(Integer goodsId) {
        Map<String, Object> map = cartDao.controlAddNum(goodsId);
        return map;
    }

    @Override
    public Map<String, Object> getTotal(Integer userId, String[] goods) {
        return cartDao.queryTotal(userId,goods);
    }

    @Override
    public List<Map<String, Object>> getGoodsCheckOut(Integer userId, String[] goods) {
        return cartDao.queryGoods4CheckOut(userId,goods);
    }

    @Override
    public boolean getRecycleCart(Integer userId) {
        int i = cartDao.recycleCart(userId);
        return i==1;
    }

    /*@Override
    public Boolean addCart(Integer num ,Integer userId, Integer goodsId) {
        //查询用户当前的购物车是否存在商品
        Map<String, Object> map1 = cartDao.queryByUserIDAndGoodsId(userId, goodsId);
        Map<String , Object> map = new HashMap<>();
        map.put("num", num);
        map.put("userId", userId);
        map.put("goodsId", goodsId);
        int i = 0;
        if (map1 == null){
            //不存在add
             i = cartDao.doInsert(map);
        }else {
            //存在update
             i = cartDao.updateNum(map);
        }
        return i==1;
    }*/
}
