package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.AddressDao;
import com.oaec.webShop.util.CommonDao;

import java.util.List;
import java.util.Map;

public class AddressDaoImpl extends CommonDao implements AddressDao {
    @Override
    public int addAddress(String name, String phone, String full, Integer userId) {
        String sql = "insert into place values (SEQ_PLACE.nextval,?,?,?,0,0,sysdate,?)";
        return executeUpdate(sql,name,phone,full,userId);
    }

    @Override
    public List<Map<String, Object>> queryByUserId(Integer userId) {
        String sql = "select  * from PLACE where USERS_ID = ?";
        return query4MapList(sql,userId);
    }
}
