package com.oaec.webShop.service.impl;

import com.oaec.webShop.dao.DaoHangDao;
import com.oaec.webShop.dao.impl.DaoHangDaoImpl;
import com.oaec.webShop.service.DaoHangService;

import java.util.List;
import java.util.Map;

public class DaoHangServiceImpl implements DaoHangService {
    private DaoHangDao daoHang  = new DaoHangDaoImpl();
    @Override
    public List<Map<String, Object>> getDaoHang() {
        List<Map<String, Object>> maps = daoHang.queryDaoHang();
        for (Map<String, Object> map : maps) {
            int sort_id = Integer.parseInt(map.get("sort_id").toString());
            List<Map<String, Object>> brands = daoHang.queryBySortId(sort_id);
            map.put("brands",brands);
        }
        return  maps;
    }

    @Override
    public List<Map<String, Object>> getTwoDaoHang(String id) {
//        List<Map<String, Object>> maps = daoHang.queryTwoDaoHang(Integer.parseInt(id));
        return null;
    }
}
