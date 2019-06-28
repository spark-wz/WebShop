package com.oaec.webShop.servlet;

import com.oaec.webShop.dao.WishDao;
import com.oaec.webShop.dao.impl.WishDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/wish")

public class WishCartServlet extends HttpServlet {
    private WishDao wishDao = new WishDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取当前用户登录的编号
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int id = Integer.parseInt(user.get("users_id").toString());
        //查询用户购物车中的商品
        List<Map<String, Object>> goods = wishDao.queryByUserId(id);
        //将查询到的商品存入request中
        req.setAttribute("goods",goods);
        System.out.println("goods = " + goods);
        //转发到cart.jsp页面
        req.getRequestDispatcher("/account-wishlist.jsp").forward(req,resp);
    }
}
