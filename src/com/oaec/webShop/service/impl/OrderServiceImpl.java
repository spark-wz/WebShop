package com.oaec.webShop.service.impl;

import com.oaec.webShop.dao.CartDao;
import com.oaec.webShop.dao.OrderDao;
import com.oaec.webShop.dao.PlaceDao;
import com.oaec.webShop.dao.ProductDao;
import com.oaec.webShop.dao.impl.CartDaoImpl;
import com.oaec.webShop.dao.impl.OrderDaoImpl;
import com.oaec.webShop.dao.impl.PlaceDaoImpl;
import com.oaec.webShop.dao.impl.ProductDaoImpl;
import com.oaec.webShop.service.OrderService;

import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();
    private PlaceDao placeDao = new PlaceDaoImpl();
    private CartDao cartDao = new CartDaoImpl();
    private ProductDao productDao = new ProductDaoImpl();
    @Override
    public List<Map<String, Object>> getOrders(Integer userId) {
        //�����û���Ų�ѯ���еĶ���
        List<Map<String, Object>> orders = orderDao.queryOrderByUserId(userId);
        //��ѯ������Ӧ�ĵ�ַ
        for (Map<String, Object> map : orders) {
            //��ȡ��ַ���
            int placeId = Integer.parseInt(map.get("place_id").toString());
            Map<String, Object> place = placeDao.queryPlaceByPlaceId(placeId);
            map.put("place",place);
            //��ѯ�������ܼ�Ǯ
            int ordersId = Integer.parseInt(map.get("orders_id").toString());
            System.out.println("ordersId = " + ordersId);
            Double totalPrice = orderDao.getTotalPrice(ordersId);
            map.put("totalPrice",totalPrice );
            //����ѯ������Ӧ����Ʒ
           List<Map<String, Object>> goods = orderDao.queryGoodsByOrederId(ordersId);
           map.put("goods",goods);
        }
        return orders;
    }

    @Override
    public boolean submit(Integer userId,Integer placeId, String[] places) {
        int result = 0;
        int ordersId = orderDao.doInsert(userId, placeId);
        for (String pid : places) {
            Integer goodsId = Integer.parseInt(pid);
            Map<String, Object> map = cartDao.queryByUserIDAndGoodsId(userId, goodsId);
            map.put("orders_id",ordersId);
            result+=orderDao.doInsertDetails(map);
            result+=cartDao.dodelete(userId, goodsId);
            int cart_num = Integer.parseInt(map.get("cart_num").toString());
            result+=productDao.updateGoodsReserveAndNum(goodsId, cart_num);

        }
        return result==3;
    }
}
