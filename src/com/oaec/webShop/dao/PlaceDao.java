package com.oaec.webShop.dao;

import java.util.Map;

public interface PlaceDao {
    //���ݵ�ַ��Ų�ѯ��ַ
    Map<String,Object> queryPlaceByPlaceId(Integer placeId);
}
