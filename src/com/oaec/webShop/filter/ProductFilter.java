package com.oaec.webShop.filter;

import com.oaec.webShop.service.DaoHangService;
import com.oaec.webShop.service.impl.DaoHangServiceImpl;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebFilter({"/index","/list","/login","/cart","/datebase","/order","/addAddress","/checkOut"})
public class ProductFilter extends HttpFilter {
    private DaoHangService daoHangService = new DaoHangServiceImpl();
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        List<Map<String, Object>> daoHang = daoHangService.getDaoHang();
        request.setAttribute("daoHang",daoHang);
        filterChain.doFilter(request,response);
    }
}
