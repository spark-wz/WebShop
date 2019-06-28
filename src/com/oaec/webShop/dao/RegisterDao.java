package com.oaec.webShop.dao;

import java.util.Map;

public interface RegisterDao {
    Map<String,Object> insertUser(String username ,String email, String password1 ,String passeord2);

}
