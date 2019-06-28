package com.oaec.webShop.util;

import com.alibaba.druid.pool.DruidDataSource;

public class JdbcDataSource {
    private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    private static  final  String USERNAME = "zhen";
    private  static  final String PASSWORD = "123456";
    private static DruidDataSource druidDataSource;
    static {
         druidDataSource = new DruidDataSource();
         druidDataSource.setUrl(URL);
         druidDataSource.setUsername(USERNAME);
         druidDataSource.setPassword(PASSWORD);
    }
    public static DruidDataSource getDruidDataSource(){
        return druidDataSource;
    }
}
