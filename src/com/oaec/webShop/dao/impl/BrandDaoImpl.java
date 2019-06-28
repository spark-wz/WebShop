package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.BrandDao;
import com.oaec.webShop.util.CommonDao;

import java.util.Map;

public class BrandDaoImpl extends CommonDao implements BrandDao {
    @Override
    public Map<String, Object> queryByGid(Integer id) {
        String sql = "select * from brand where brand_id = ?";
        return query4Map(sql,id);
    }
}
