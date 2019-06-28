package com.oaec.webShop.dao;

import java.util.Map;

public interface LookPasswordDao {
    Map<String,Object> LookPassword(String password,String email);
}
