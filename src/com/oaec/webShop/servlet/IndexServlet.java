package com.oaec.webShop.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.webShop.service.DaoHangService;
import com.oaec.webShop.service.impl.DaoHangServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    private DaoHangService daoHangService = new DaoHangServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //查询导航需要的分类
        List<Map<String, Object>> daoHang = daoHangService.getDaoHang();
        System.out.println(JSON.toJSONString(daoHang));
        //将查询到的导航存入request
        req.setAttribute("daoHang",daoHang);
        //转发到index。jsp
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
