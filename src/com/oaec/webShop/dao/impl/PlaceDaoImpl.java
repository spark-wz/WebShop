package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.PlaceDao;
import com.oaec.webShop.util.CommonDao;

import java.util.Map;

public class PlaceDaoImpl extends CommonDao implements PlaceDao {
    @Override
    public Map<String, Object> queryPlaceByPlaceId(Integer placeId) {
        String sql = "select  * from PLACE where PLACE_ID = ?";
        return query4Map(sql,placeId);

    }
}
