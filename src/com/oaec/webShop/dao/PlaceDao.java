package com.oaec.webShop.dao;

import java.util.Map;

public interface PlaceDao {
    //根据地址编号查询地址
    Map<String,Object> queryPlaceByPlaceId(Integer placeId);
}
