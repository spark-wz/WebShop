package com.oaec.webShop.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.webShop.service.UserService;
import com.oaec.webShop.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/account-login.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Map<String, Object> login = userService.login(username, password);
        System.out.println("login = " + login);
        //设置ContextType
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();

        if (login.containsKey("error")){
            writer.println(JSON.toJSONString(login));
        }else {
            //登录成功
            req.getSession().setAttribute("user",login);
            writer.println("{\"success\":true}");
        }
        writer.close();
    }
}
