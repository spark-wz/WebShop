package com.oaec.webShop.servlet;

import com.oaec.webShop.service.ProductService;
import com.oaec.webShop.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/page")

public class QUeryAllGoodsPage extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String id = req.getParameter("id");
        String bid = req.getParameter("bid");
        String page = req.getParameter("page");
        if (page==null){
            page = "1";
            int i = Integer.parseInt(page);
        }

    }
}
