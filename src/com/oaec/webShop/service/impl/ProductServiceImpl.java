package com.oaec.webShop.service.impl;

import com.oaec.webShop.dao.BrandDao;
import com.oaec.webShop.dao.DaoHangDao;
import com.oaec.webShop.dao.ProductDao;
import com.oaec.webShop.dao.WishDao;
import com.oaec.webShop.dao.impl.BrandDaoImpl;
import com.oaec.webShop.dao.impl.DaoHangDaoImpl;
import com.oaec.webShop.dao.impl.ProductDaoImpl;
import com.oaec.webShop.dao.impl.WishDaoImpl;
import com.oaec.webShop.service.ProductService;

import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private ProductDao productDao = new ProductDaoImpl();
    private DaoHangDao daoHangDao = new DaoHangDaoImpl();
    private BrandDao brandDao = new BrandDaoImpl();
    private WishDao wishDao = new WishDaoImpl();
    @Override
    public List<Map<String, Object>> queryGoods(String name ,String id ,String bid) {
        if (bid!=null && id!=null){
            return productDao.queryByBidAndSort(Integer.parseInt(bid),Integer.parseInt(id));
        }
       if (id != null){
          return productDao.querySort(Integer.parseInt(id));
       }
       if (bid != null){
           return productDao.queryByBid(Integer.parseInt(bid));
       }
       if (name==null){
            return productDao.queryAll();
        }else {
            return productDao.queryLike(name);
        }
    }

    @Override
    public Map<String, Object> queryGoodsById(String id) {
        Map<String, Object> product = productDao.queryByGid(Integer.parseInt(id));
        //获取品牌编号
        int bid = Integer.parseInt(product.get("brand_id").toString());
        int sid = Integer.parseInt(product.get("sort_id").toString());
        // 获取分类的编号
        //查询品牌
        Map<String, Object> brand = brandDao.queryByGid(bid);
        //查询分类
        Map<String, Object> daoHang = daoHangDao.queryByGid(sid);
        product.put("brand",brand);
        product.put("daoHang",daoHang);
        return product;
    }

    @Override
    public boolean addWishGoods(Integer userId, Integer goodsId) {
        int i = wishDao.addWish(userId, goodsId);
        return i==1;
    }

    @Override
    public List<Map<String, Object>> queryPageGoodsAll(Integer page) {
        List<Map<String, Object>> maps = productDao.queryAllSort(page);
        return maps;
    }
}
