package com.oaec.webShop.dao;

import java.util.Map;

public interface AccountUpdateDao {
    Map<String,Object> UpdateUser(String username , String email, String password1 , String password2);
    int updateAccountPhoto(String photo,Integer userId);
}
