package com.oaec.webShop.service;

import java.util.List;
import java.util.Map;

public interface OrderService {
    //�����û���Ų�ѯ�û��Ķ���
    List<Map<String,Object>> getOrders(Integer userId);
    //���ɶ���
    boolean submit( Integer userId,Integer placeId ,String[] places);
}
