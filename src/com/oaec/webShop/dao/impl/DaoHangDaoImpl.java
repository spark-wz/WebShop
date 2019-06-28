package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.DaoHangDao;
import com.oaec.webShop.util.CommonDao;

import java.util.List;
import java.util.Map;


public class DaoHangDaoImpl extends CommonDao implements DaoHangDao {
    @Override
    public List<Map<String, Object>> queryDaoHang() {
        String sql = "select * from sort where SORT_ID in (select SORT_ID from GOODS group by SORT_ID)";
        return  query4MapList(sql);
    }

    @Override
    public List<Map<String, Object>> queryBySortId(Integer sortId) {
        String sql = "select * from BRAND where BRAND_ID in (select BRAND_ID from GOODS  where  SORT_ID = ? group by BRAND_ID ) and BRAND_STATUS = 1";
        return query4MapList(sql,sortId);
    }

    @Override
    public Map<String, Object> queryByGid(Integer id) {
        String sql = "select * from sort where sort_id = ?";
        return query4Map(sql,id);
    }
}
