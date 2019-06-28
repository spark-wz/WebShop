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
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/deleteWish")

public class DeleteWishServlet extends HttpServlet {
    private WishDao wishDao = new WishDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        int i = wishDao.deleteWish(userId);
        boolean delete = i==1;
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"success\":"+delete+"}");
        writer.close();
    }
}
