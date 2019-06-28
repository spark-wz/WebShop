package com.oaec.webShop.servlet;

import com.oaec.webShop.service.AddAddressService;
import com.oaec.webShop.service.CartService;
import com.oaec.webShop.service.impl.AddAddressServiceImpl;
import com.oaec.webShop.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet("/checkOut")
public class CheckOutServlet extends HttpServlet {

    private CartService cartService = new CartServiceImpl();
    private AddAddressService addAddressService = new AddAddressServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("users_id").toString());
        String[] goodsIds = req.getParameterValues("goodsId");
        //查询收货地址
        List<Map<String, Object>> address = addAddressService.getAddress(userId);
        //查询统计
        Map<String, Object> total = cartService.getTotal(userId, goodsIds);
        //查询要结算的商品
        List<Map<String, Object>> goodsList = cartService.getGoodsCheckOut(userId, goodsIds);
        req.setAttribute("address",address);
        req.setAttribute("total",total);
        req.setAttribute("goodsList",goodsList);
        req.getRequestDispatcher("checkout-review.jsp").forward(req,resp);
    }
}
