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
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/submit")

public class SubmitServlet extends HttpServlet {

    private OrderService orderService  = new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        //拿到地址编号
        int id = Integer.parseInt(req.getParameter("placeId"));
        //获取要结算的商品编号
        String[] gids = req.getParameterValues("gid");
        boolean submit = orderService.submit(userId, id, gids);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"success\":"+submit+"}");
        writer.close();
    }
}
