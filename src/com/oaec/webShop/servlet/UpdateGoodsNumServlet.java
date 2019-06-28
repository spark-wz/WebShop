package com.oaec.webShop.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.webShop.service.CartService;
import com.oaec.webShop.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/updateGoodsNum")

public class UpdateGoodsNumServlet extends HttpServlet {
    private CartService cartService = new CartServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //拿到用户编号
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int id = Integer.parseInt(user.get("users_id").toString());
        //拿到商品编号
        Integer goodsId = Integer.parseInt(req.getParameter("goodsId"));
        //拿到action
        String action = req.getParameter("action");
        boolean b = cartService.updateGoodsNum(action, id, goodsId);
        //拿到商品库存
        Map<String, Object> map = cartService.controlReserveNotFull(goodsId);
        //ajax的方式请求
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        map.put("success",b);
        writer.println(JSON.toJSONString(map));
        writer.close();
    }
}
