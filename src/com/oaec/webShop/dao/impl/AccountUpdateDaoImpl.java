package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.AccountUpdateDao;
import com.oaec.webShop.dao.UserDao;
import com.oaec.webShop.util.CommonDao;

import java.util.HashMap;
import java.util.Map;

public class AccountUpdateDaoImpl extends CommonDao implements AccountUpdateDao {
    private UserDao userDao = new UserDaoImpl();
    @Override
    public Map<String, Object> UpdateUser(String username, String email, String password1, String password2) {
        Map<String, Object> map = userDao.queryByUsername(username);
        if (map == null) {
            map = new HashMap<>();
            if (password1.equals(password2)) {
                String sql = "update users set USERS_NAME = ?,USERS_PASSWORD = ? where USERS_NAME = ?";
                int i = executeUpdate(sql, username, email, password1);
                map.put("success", "成功");
                return map;
            } else {
                map.put("error", "两次密码输入不一致");
                return map;
            }
        } else {
            map.put("error", "用户名已经存在");
            return map;
        }
    }

    @Override
    public int updateAccountPhoto(String photo,Integer userId) {
        String sql = "update users set users_address = ? where users_id = ?";
        return executeUpdate(sql,photo,userId);
    }
}
