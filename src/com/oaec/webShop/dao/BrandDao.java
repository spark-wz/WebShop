package com.oaec.webShop.dao;

import java.util.Map;

public interface BrandDao {
    //根据编号查询品牌
    Map<String,Object> queryByGid( Integer id);
}
