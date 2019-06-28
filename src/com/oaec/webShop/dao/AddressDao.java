package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface AddressDao {
    int addAddress(String name,String phone,String full,Integer userId);
    //根据用户编号查询地址
    List<Map<String, Object>> queryByUserId(Integer userId);
}
