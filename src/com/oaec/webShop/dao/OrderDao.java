package com.oaec.webShop.dao;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    //�����û���Ų�ѯ����
    List<Map<String,Object>> queryOrderByUserId(Integer userId);
    //��ѯ������������Ʒ
    List<Map<String ,Object>> queryGoodsByOrederId(Integer orderId);
    //��ѯ�������ܽ��
    Double getTotalPrice(Integer orderId);
    //�����������
    int doInsert(Integer userId, Integer placeId);
    //������ϸ���������
    int doInsertDetails(Map<String,Object> param );
}
