package com.oaec.webShop.servlet;

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

@WebServlet("/add2Cart")

public class Add2CartServlet extends HttpServlet {

    private CartService cartService = new CartServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        //获取请求参数
        Integer goodsId = Integer.parseInt(req.getParameter("goodsId"));
        System.out.println("goodsId = " + goodsId);
        Integer num = Integer.parseInt(req.getParameter("num"));
        Boolean b = cartService.addCart(userId, goodsId, num);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"success\":"+b+"}");
        writer.close();
    }
}
