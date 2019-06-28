package com.oaec.webShop.filter;

import com.oaec.webShop.service.CartService;
import com.oaec.webShop.service.impl.CartServiceImpl;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebFilter("/index")
public class CartShowFilter extends HttpFilter {
    private CartService cartService = new CartServiceImpl();
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        //获取当前用户登录的编号
        HttpSession session = request.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
       if(user !=null){
           int id = Integer.parseInt(user.get("users_id").toString());
           //查询用户购物车中的商品
           List<Map<String, Object>> goods = cartService.getCartGoods(id);
           Map<String, Object> num = cartService.getNum(id);
           System.out.println("num = " + num);
           System.out.println("goods = " + goods);
           //将查询到的商品存入request中
           request.setAttribute("goods",goods);
           request.setAttribute("num",num);
       }
        filterChain.doFilter(request,response);
    }
}
