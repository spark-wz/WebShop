package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface AddressDao {
    int addAddress(String name,String phone,String full,Integer userId);
    //�����û���Ų�ѯ��ַ
    List<Map<String, Object>> queryByUserId(Integer userId);
}
