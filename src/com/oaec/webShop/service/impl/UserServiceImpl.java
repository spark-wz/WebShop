package com.oaec.webShop.service.impl;

import com.oaec.webShop.dao.AccountUpdateDao;
import com.oaec.webShop.dao.LookPasswordDao;
import com.oaec.webShop.dao.RegisterDao;
import com.oaec.webShop.dao.UserDao;
import com.oaec.webShop.dao.impl.AccountUpdateDaoImpl;
import com.oaec.webShop.dao.impl.LookPasswordImpl;
import com.oaec.webShop.dao.impl.RegisterDaoImpl;
import com.oaec.webShop.dao.impl.UserDaoImpl;
import com.oaec.webShop.service.UserService;

import java.util.HashMap;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();
    private RegisterDao registerDao = new RegisterDaoImpl();
    private LookPasswordDao lookPasswordDao = new LookPasswordImpl();
    private AccountUpdateDao accountUpdateDao = new AccountUpdateDaoImpl();
    @Override
    public Map<String, Object> login(String username, String password) {
        //根据用户名查询用户
        Map<String, Object> map = userDao.queryByUsername(username);
        if (map == null){
            map = new HashMap<>();
            map.put("error","用户名不存在");
        }else if ((password).equals(map.get("users_password"))){
            return map;
        }else {
            //登录失败，密码错误
            map.clear();
            map.put("error","密码错误");
        }

        return map;
    }

    @Override
    public Map<String, Object> insertUser(String username, String email, String password1,String password2) {
        Map<String, Object> map = registerDao.insertUser(username, email, password1,password2);
        return  map;
    }

    @Override
    public Map<String, Object> LookPassword(String password, String email) {
        Map<String, Object> map = lookPasswordDao.LookPassword(password, email);
        if (map.get("key").equals(1)){
            map.clear();
            map.put("true","成功");
            return map;
        }else {
            map.clear();
            map.put("false","失败");
            return map;
        }
    }

    @Override
    public boolean updatePhoto( String photo , Integer userId) {
        int i = accountUpdateDao.updateAccountPhoto(photo, userId);
        return i==1;
    }

    @Override
    public boolean updateUserDatebase(String username, String password1, String passeord2, Integer userId) {
        int i = userDao.updateUserDatebase(username, password1, passeord2, userId);
        return i==1;
    }
}
