package com.oaec.webShop.service.impl;

import com.oaec.webShop.dao.AddressDao;
import com.oaec.webShop.dao.impl.AddressDaoImpl;
import com.oaec.webShop.service.AddAddressService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AddAddressServiceImpl implements AddAddressService {
    private AddressDao addressDao = new AddressDaoImpl();
    @Override
    public Map<String, Object> AddPlace(String name, String phone, String full, Integer userId) {
        int i = addressDao.addAddress(name, phone, full, userId);
        Map<String, Object> map = new HashMap<>();
        if (i==1){
            map.put("success",true);
        }else {
            map.put("error",false);
        }
        return map;
    }

    @Override
    public List<Map<String, Object>> getAddress(Integer userId) {
        List<Map<String, Object>> maps = addressDao.queryByUserId(userId);
        return maps;
    }
}
