package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface ProductDao {
    //查询所有
    public List<Map<String,Object>> queryAll();
    public List<Map<String,Object>> queryAllSort(Integer page);
    //模糊查询
    public List<Map<String,Object>> queryLike(String name);
    //根据分类查询
    public List<Map<String,Object>> querySort(Integer id);
    //根据品牌查询
    public List<Map<String,Object>> queryByBid(Integer bid);
    //根据分类及品牌查询
    public List<Map<String,Object>> queryByBidAndSort(Integer bid, Integer id);
    //根据商品编号查询
    public Map<String,Object> queryByGid( Integer id);
    //修改商品的库存和销量
    int updateGoodsReserveAndNum(Integer goodsId , Integer shu);

}
