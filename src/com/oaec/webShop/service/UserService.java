package com.oaec.webShop.service;

import java.util.Map;

public interface UserService {
    Map<String,Object> login(String username ,String password);
    Map<String,Object> insertUser(String username ,String email, String password1,String password2);
    Map<String,Object> LookPassword(String password ,String email);
    boolean updatePhoto( String photo,Integer userId);
    boolean updateUserDatebase(String username, String password1, String passeord2 ,Integer userId);
}
