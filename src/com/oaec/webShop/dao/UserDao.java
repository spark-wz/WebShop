package com.oaec.webShop.dao;

import java.util.Map;

public interface UserDao {
    Map<String,Object> queryByUsername(String username);
    int updateUserDatebase(String username , String password1 ,String passeord2,Integer userId);
}
