package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.ProductDao;
import com.oaec.webShop.util.CommonDao;

import java.util.List;
import java.util.Map;

public class ProductDaoImpl extends CommonDao implements ProductDao {
    @Override
    public List<Map<String, Object>> queryAll() {
        String sql = "select * from goods where goods_status = 1 order by GOODS_SALE desc";
        return  query4MapList(sql);
    }

    @Override
    public List<Map<String, Object>> queryAllSort(Integer page) {
        String sql = "SELECT * FROM (SELECT ROWNUM rn,t1.* FROM(select * from goods where goods_status = 1 order by GOODS_SALE desc) t1)t2 WHERE t2.rn > ? AND t2.rn <= ?;";
        return query4MapList(sql,page);
    }

    @Override
    public List<Map<String, Object>> queryLike(String name) {
        String sql = "select * from goods where upper(goods_name)like upper(?) and goods_status = 1";
        return query4MapList(sql,"%"+name+"%");
    }

    @Override
    public List<Map<String, Object>> querySort(Integer id) {
        String sql = "select * from goods where sort_id = ?";
        return  query4MapList(sql,id);
    }

    @Override
    public List<Map<String, Object>> queryByBid(Integer bid) {
        String sql = "select * from goods where BRAND_ID = ? and goods_status = 1";
        return query4MapList(sql,bid);
    }

    @Override
    public List<Map<String, Object>> queryByBidAndSort(Integer bid, Integer id) {
        String sql = "select * from goods where BRAND_ID = ? and sort_id = ? and goods_status = 1";
        return query4MapList(sql,bid,id);
    }

    @Override
    public Map<String, Object> queryByGid(Integer id) {
        String sql = "select * from goods where goods_id = ?";
        return query4Map(sql,id);
    }

    @Override
    public int updateGoodsReserveAndNum(Integer goodsId, Integer shu) {
        String sql = "update GOODS set GOODS_SALE = GOODS_SALE + ? , GOODS_RESERVE = GOODS_RESERVE - ? where GOODS_ID = ?";
        int i = executeUpdate(sql, shu, shu, goodsId);
        return i;
    }

}
