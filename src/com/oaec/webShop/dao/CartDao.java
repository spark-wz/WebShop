package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface CartDao {
    /**
     * 根据用户编号查询用户的购物车中的商品
     * @param id
     * @return
     */
    List<Map<String,Object>> queryByUserId(Integer id);
    /**
     *查询购物车中的总商品个数（去重）
     */
    Map<String, Object>countNum(Integer id);
    //添加商品到购物车
    int doInsert(Map<String,Object> param);
    //查询购物车有没有商品
    Map<String,Object> queryByUserIDAndGoodsId(Integer userId ,Integer goodsId);
    //购物车存在的商品添加数量
    int updateNum(Map<String,Object> param);
    //删除购物车
    int dodelete(Integer id ,Integer goodsId);
    //清空购物车
    int nullCart(Integer id);
    //一键还原购物车
    int recycleCart(Integer userId);
    //修改购物车加号按钮
    int addCartNum(Integer id ,Integer goodsId);
    //查询商品库存
    Map<String,Object> QueryGoodsReserve( Integer goodsId);
    //修改购物车jian号按钮
    int subCartNum(Integer id ,Integer goodsId);
    //控制商品添加不能超过库存
    Map<String ,Object> controlAddNum(Integer goodsId);
    //统计总价钱和总数量
    Map<String ,Object> queryTotal( Integer userId ,String[]goods);
    //
    List<Map<String ,Object>>  queryGoods4CheckOut(Integer userId ,String[]goods);
}
