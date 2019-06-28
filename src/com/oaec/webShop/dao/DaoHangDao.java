package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface DaoHangDao {
    List<Map<String,Object>> queryDaoHang();

    List<Map<String,Object>> queryBySortId(Integer sortId);
    //根据编号查询
    Map<String,Object> queryByGid(Integer id);

}
