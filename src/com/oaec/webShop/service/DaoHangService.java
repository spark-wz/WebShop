package com.oaec.webShop.service;

import java.util.List;
import java.util.Map;

public interface DaoHangService {
    List<Map<String,Object>> getDaoHang();
    List<Map<String,Object>> getTwoDaoHang(String id);
}
