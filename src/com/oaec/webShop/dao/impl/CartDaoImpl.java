package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.CartDao;
import com.oaec.webShop.util.CommonDao;

import java.util.List;
import java.util.Map;

public class CartDaoImpl extends CommonDao implements CartDao {
    @Override
    public List<Map<String, Object>> queryByUserId(Integer id) {
        String sql = "select GOODS.GOODS_ID,GOODS_NAME,GOODS_RESERVE,GOODS.GOODS_ADDRESS,GOODS.GOODS_DESCRIBE,GOODS.GOODS_PRICE,CART.CART_NUM from cart,GOODS where GOODS.GOODS_ID=CART.GOODS_ID and USERS_ID =? and GOODS_STATUS = 1 and cart_status = 1";
        List<Map<String, Object>> maps = query4MapList(sql, id);
        return maps;
    }

    @Override
    public Map<String, Object> countNum(Integer id) {
        String sql = "select count(CART_ID) count from CART where  USERS_ID = ? and cart_status = 1";
        Map<String, Object> map = query4Map(sql, id);
        return map;
    }

    @Override
    public int doInsert(Map<String, Object> param) {
        String sql = "insert into cart values(SEQ_CART.nextval,?,?,?,1)";
        return executeUpdate(sql,param.get("num"),param.get("userId"),param.get("goodsId"));
    }

    @Override
    public Map<String, Object> queryByUserIDAndGoodsId(Integer userId, Integer goodsId) {
        String sql ="select * from cart,GOODS where CART.GOODS_ID = GOODS.GOODS_ID and USERS_ID = ? and GOODS.GOODS_ID = ? and cart_status = 1";
        Map<String, Object> map = query4Map(sql, userId, goodsId);
        return map;
    }

    @Override
    public int updateNum(Map<String, Object> param) {
        String sql = "update CART set CART_NUM = CART_NUM +? where USERS_ID = ? and GOODS_ID = ? and    cart_status = 1";
        int i = executeUpdate(sql, param.get("num"), param.get("userId"), param.get("goodsId"));
        return i;
    }

    @Override
    public int dodelete(Integer id, Integer goodsId) {
        String sql = "delete from cart where USERS_ID = ? and GOODS_ID = ? and cart_status = 1";
        return executeUpdate(sql,id,goodsId);
    }

    @Override
    public int nullCart(Integer id) {
        String sql = "update cart set cart_status =0 where 1=1 and users_id = ?";
        return executeUpdate(sql,id);
    }

    @Override
    public int recycleCart(Integer userId) {
        String sql = "update cart set cart_status =1 where 1=1 and users_id = ?";
        return executeUpdate(sql,userId);
    }

    @Override
    public int addCartNum(Integer id, Integer goodsId) {
        String sql = "update cart set cart_num = cart_num + 1 where users_id = ? and goods_id = ? and cart_num < ? ";
        Map<String, Object> map = QueryGoodsReserve(goodsId);
        if (map!=null){
            Integer goodsReserve = Integer.parseInt((map.get("goods_reserve").toString()));
            int i = executeUpdate(sql, id, goodsId, goodsReserve);
            return i;
        }
        return 0;
    }

    @Override
    public Map<String, Object> QueryGoodsReserve(Integer goodsId) {
        String sql = "select GOODS_RESERVE from GOODS where GOODS_ID = ?";
        return query4Map(sql,goodsId);
    }

    @Override
    public int subCartNum(Integer id, Integer goodsId) {
        String sql = "update cart set cart_num = cart_num - 1 where users_id = ? and goods_id = ? and cart_num >0 ";
        int i = executeUpdate(sql, id, goodsId);
        return i;
    }

    @Override
    public Map<String, Object> controlAddNum(Integer goodsId) {
        String sql = "select goods_reserve from goods where goods_id = ?";
        return query4Map(sql,goodsId);
    }

    @Override
    public Map<String, Object> queryTotal(Integer userId, String[] goods) {
        StringBuilder sql = new StringBuilder("select sum(CART_NUM)  total_sum ,sum(CART_NUM*GOODS_PRICE) total_price from CART ,goods where cart.GOODS_ID = goods.GOODS_ID and USERS_ID = ? and CART.GOODS_ID in (");
        if (goods != null){
            Object [] param = new Object[goods.length+1];
            param[0] = userId;
            for (int i = 0 ;i<goods.length;i++) {
                sql.append("?,");
                param[1+i] = goods[i];
            }
            sql.deleteCharAt(sql.length()-1);
            sql.append(")");

            return query4Map(sql.toString(),param);
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> queryGoods4CheckOut(Integer userId, String[] goods) {
        StringBuilder sql = new StringBuilder("select GOODS.GOODS_ID,GOODS.GOODS_ADDRESS,GOODS.GOODS_DESCRIBE,CART.CART_NUM,GOODS.GOODS_PRICE from CART,GOODS where CART.GOODS_ID = GOODS.GOODS_ID and CART.USERS_ID = ? and GOODS.GOODS_ID in (");
        if (goods != null){
            Object [] param = new Object[goods.length+1];
            param[0] = userId;
            for (int i = 0 ;i<goods.length;i++) {
                sql.append("?,");
                param[1+i] = goods[i];
            }
            sql.deleteCharAt(sql.length()-1);
            sql.append(")");

            return query4MapList(sql.toString(),param);
        }
        return null;
    }
}
