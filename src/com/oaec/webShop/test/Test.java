package com.oaec.webShop.test;

import com.oaec.webShop.dao.OrderDao;
import com.oaec.webShop.dao.impl.OrderDaoImpl;

public class Test {
    public static void main(String[] args) {
        /*productDao product  = new ProductDaoImpl();
        List<Map<String, Object>> maps = product.queryLike("苹果");
        for (Map<String,Object> map:maps) {
            System.out.println("map = " + map);
        }*/
        /*daoHangDao daoHang = new daoHangDaoImpl();
        List<Map<String, Object>> maps = daoHang.queryTwoDaoHang(2001);
        for (Map<String,Object> map:maps) {
            System.out.println("map = " + map);
        }*/
       /* UserService userService = new UserServiceImpl();
        Map<String, Object> tom = userService.login("tom", "123456");
        System.out.println("tom = " + tom);*/
        /*RegisterDao registerDao = new RegisterDaoImpl();
        Map<String, Object> map = registerDao.insertUser("admin", "fff", "123", "123");
        System.out.println("map = " + map);*/
       /* CartDao cartDao = new CartDaoImpl();
        *//*Map<String, Object> map = cartDao.countNum(4001);
        System.out.println("map = " + map);*//*
        Map map = new HashMap();
        map.put("1",6038);
        map.put("2",2);
        map.put("3",4001);
        map.put("4",3023);
        int i = cartDao.doInsert(map);*/
       /* CartService cartService = new CartServiceImpl();
        map.put("2",2);
        map.put("3",4001);
        map.put("4",3023);
        cartService.addCart(map);
        System.out.println("i = " + i)*/;
       /* CartDao cartDao = new CartDaoImpl();
        Map<String, Object> map = cartDao.QueryGoodsReserve(3023);
        System.out.println("map = " + map);
        System.out.println(map.get("goods_reserve"));*/
        /*CartService cartService = new CartServiceImpl();
        boolean b = cartService.updateGoodsNum("sss", 4001, 3023);
        System.out.println("b = " + b);*/
        /*CartDao cartDao = new CartDaoImpl();
        Map<String, Object> map = cartDao.controlAddNum(3023);
        System.out.println("map = " + map);*/
//       OrderServiceImpl orderService = new OrderServiceImpl();
//        List<Map<String, Object>> orders = orderService.getOrders(4001);
        /*AddAddressService addAddressService = new AddAddressServiceImpl();
        List<Map<String, Object>> address = addAddressService.getAddress(4001);
        System.out.println("address = " + address);*/
       /* AddressDao addressDao = new AddressDaoImpl();
        List<Map<String, Object>> maps = addressDao.queryByUserId(4001);
        System.out.println("maps = " + maps);*/
       /* OrderService orderService = new OrderServiceImpl();
        boolean submit = orderService.submit(4001, 5001, new String[]{"3013"});
        System.out.println("submit = " + submit);*/
       /* CartService cartService = new CartServiceImpl();
        Boolean aBoolean = cartService.addCart(4001, 3023, 1);
        System.out.println("aBoolean = " + aBoolean);*/
       OrderDao orderDao = new OrderDaoImpl();
        Double totalPrice = orderDao.getTotalPrice(7044);
        System.out.println("totalPrice = " + totalPrice);
    }
}
