package com.oaec.webShop.servlet;

import com.oaec.webShop.service.ProductService;
import com.oaec.webShop.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gid = req.getParameter("gid");
        Map<String, Object> product = productService.queryGoodsById(gid);
        req.setAttribute("product",product);
        req.getRequestDispatcher("/item_show.jsp").forward(req,resp);
    }
}
