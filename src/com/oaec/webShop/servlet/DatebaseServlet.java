package com.oaec.webShop.servlet;

import com.oaec.webShop.service.UserService;
import com.oaec.webShop.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/datebase")

public class DatebaseServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/account-profile.jsp").forward(req,resp);
    }

    /*@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");
        Map<String, Object> map = userService.insertUser(username, email, password1,password2);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println(JSON.toJSONString(map));
        writer.close();
    }*/
}
