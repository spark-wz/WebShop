package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.LookPasswordDao;
import com.oaec.webShop.util.CommonDao;

import java.util.HashMap;
import java.util.Map;

public class LookPasswordImpl extends CommonDao implements LookPasswordDao {
    @Override
    public Map<String, Object> LookPassword(String password,String email) {
        String sql = "update users set users_password = ? where users_email = ?";
        int i = executeUpdate(sql, password, email);
        Map<String, Object> map = new HashMap<>();
        map.put("key",i);
        return map;
    }
}
