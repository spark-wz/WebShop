package com.oaec.webShop.servlet;

import com.oaec.webShop.service.OrderService;
import com.oaec.webShop.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/order")

public class OrdreServlet extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        List<Map<String, Object>> ordersList = orderService.getOrders(userId);
        req.setAttribute("ordersList",ordersList);
        req.getRequestDispatcher("/account-orders.jsp").forward(req,resp);
    }
}
