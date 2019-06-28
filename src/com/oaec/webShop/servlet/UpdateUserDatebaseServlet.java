package com.oaec.webShop.servlet;

import com.oaec.webShop.service.UserService;
import com.oaec.webShop.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/updateDatebase")

public class UpdateUserDatebaseServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        String username = req.getParameter("username");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");
        boolean b = userService.updateUserDatebase(username, password1, password2, userId);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"success\":"+b+"}");
        writer.close();
    }
}
