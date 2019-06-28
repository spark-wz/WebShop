package com.oaec.webShop.service;

import java.util.List;
import java.util.Map;

public interface AddAddressService  {
    Map<String,Object> AddPlace(String name,String phone,String full,Integer userId);
    List<Map<String,Object>> getAddress (Integer userId);
}
