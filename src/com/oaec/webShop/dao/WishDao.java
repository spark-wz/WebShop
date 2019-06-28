package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface WishDao {
    int addWish(Integer userId,Integer goods);
    List<Map<String,Object>> queryByUserId(Integer id);
    int deleteWish(Integer userId);
}
