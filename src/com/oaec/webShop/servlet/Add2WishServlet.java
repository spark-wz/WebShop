package com.oaec.webShop.servlet;

import com.oaec.webShop.service.ProductService;
import com.oaec.webShop.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/add2wish")

public class Add2WishServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        System.out.println("userId = " + userId);
        //获取请求参数
        Integer goodsId = Integer.parseInt(req.getParameter("goodsId"));
        System.out.println("goodsId = " + goodsId);
        boolean b = productService.addWishGoods(userId, goodsId);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"success\":"+b+"}");
        writer.close();
    }
}
