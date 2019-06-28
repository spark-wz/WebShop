package com.oaec.webShop.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.webShop.service.AddAddressService;
import com.oaec.webShop.service.impl.AddAddressServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/mafan")

public class MAFanServlet extends HttpServlet {
    private AddAddressService addAddressService  = new AddAddressServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        String name = req.getParameter("namess");
        String phone = req.getParameter("phone");
        String full = req.getParameter("full");
        System.out.println("full = " + full);
        Map<String, Object> map = addAddressService.AddPlace(name, phone, full, userId);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println(JSON.toJSONString(map));
        writer.close();
    }
}
