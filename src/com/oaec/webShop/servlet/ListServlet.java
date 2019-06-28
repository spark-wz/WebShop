package com.oaec.webShop.servlet;

import com.oaec.webShop.service.impl.ProductServiceImpl;
import com.oaec.webShop.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/list")
public class ListServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String id = req.getParameter("id");
        String bid = req.getParameter("bid");
        //查询商品
        List<Map<String, Object>> list = productService.queryGoods(name,id,bid);
        //将查询到的商品存放在request中
        req.setAttribute("list",list);
        //转发到list.jsp
        req.getRequestDispatcher(("/shop-grid-1.jsp")).forward(req,resp);
    }
}
