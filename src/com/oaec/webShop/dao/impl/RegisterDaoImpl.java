package com.oaec.webShop.dao.impl;

import com.oaec.webShop.dao.RegisterDao;
import com.oaec.webShop.dao.UserDao;
import com.oaec.webShop.util.CommonDao;

import java.util.HashMap;
import java.util.Map;

public class RegisterDaoImpl extends CommonDao implements RegisterDao {
    private UserDao userDao = new UserDaoImpl();

    @Override
    public Map<String, Object> insertUser(String username,String email, String password1,String password2) {
        Map<String, Object> map = userDao.queryByUsername(username);
        if (map == null){
            map = new HashMap<>();
            if (password1.equals(password2)){
                String sql = "insert into users values(seq_users.nextval,?,?,1,sysdate,?,'u=3680036483,2233880141&fm=26&gp=0.jpg')";
                int i = executeUpdate(sql, username, email, password1);
                map.put("success","成功");
                return map;
            }else {
                map.put("error","两次密码输入不一致");
                return map;
            }
        }else {
            map.put("error","用户名已经存在");
            return map;
        }
        /*if (map.containsKey("users_name")){
            if (map.containsKey("users_name")){
                map.put("error","用户名已经存在");
                return map;
            }else if (password1.equals(password2)){
                map.put("error","两次密码输入不一致");
                return map;
            }else {
                String sql = "insert into users values(seq_users.nextval,?,?,1,sysdate,?)";
                int i = executeUpdate(sql, username, email, password1);
                map.put("success","成功");
                return map;
            }
        }*/
//        return map;
    }

}
