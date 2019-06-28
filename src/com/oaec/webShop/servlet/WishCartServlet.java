package com.oaec.webShop.servlet;

import com.oaec.webShop.dao.WishDao;
import com.oaec.webShop.dao.impl.WishDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/wish")

public class WishCartServlet extends HttpServlet {
    private WishDao wishDao = new WishDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //��ȡ��ǰ�û���¼�ı��
        HttpSession session = req.getSession();
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int id = Integer.parseInt(user.get("users_id").toString());
        //��ѯ�û����ﳵ�е���Ʒ
        List<Map<String, Object>> goods = wishDao.queryByUserId(id);
        //����ѯ������Ʒ����request��
        req.setAttribute("goods",goods);
        System.out.println("goods = " + goods);
        //ת����cart.jspҳ��
        req.getRequestDispatcher("/account-wishlist.jsp").forward(req,resp);
    }
}
