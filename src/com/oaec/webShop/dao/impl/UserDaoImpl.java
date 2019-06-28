package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.UserDao;
import com.oaec.webShop.util.CommonDao;

import java.util.Map;

public class UserDaoImpl extends CommonDao implements UserDao {
    @Override
    public Map<String, Object> queryByUsername(String username) {
        String sql = "select * from users where users_name = ?";
        return query4Map(sql, username);
    }

    @Override
    public int updateUserDatebase(String username , String password1, String passeord2 ,Integer userId) {
        String sql = "update users set USERS_NAME = ?,USERS_PASSWORD = ? where USERS_ID = ?";
        return executeUpdate(sql,username,password1,userId);
    }
}
