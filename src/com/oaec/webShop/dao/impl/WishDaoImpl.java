package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.WishDao;
import com.oaec.webShop.util.CommonDao;

import java.util.List;
import java.util.Map;

public class WishDaoImpl extends CommonDao implements WishDao {
    @Override
    public int addWish(Integer userId, Integer goods) {
        String sql = "insert into wish values (seq_wish.nextval,?,?,1)";
        return executeUpdate(sql,userId,goods);
    }

    @Override
    public List<Map<String, Object>> queryByUserId(Integer id) {
        String sql = "select GOODS.GOODS_ID,GOODS_NAME,GOODS_RESERVE,GOODS.GOODS_ADDRESS,GOODS.GOODS_DESCRIBE,GOODS.GOODS_PRICE from wish,GOODS where GOODS.GOODS_ID=WISH.GOODS_ID and USERS_ID =? and wish_status = 1";
        List<Map<String, Object>> maps = query4MapList(sql, id);
        return maps;
    }

    @Override
    public int deleteWish(Integer userId) {
        String sql = "update wish set wish.wish_status =0 where users_id = ?";
        int i = executeUpdate(sql, userId);
        return i;
    }
}
