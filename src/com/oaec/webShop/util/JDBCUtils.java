package com.oaec.webShop.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * JDBC的工具类，负责：加载驱动，建立连接，释放资源
 *
 */
public class JDBCUtils {

    private static final String DRIVER = "oracle.jdbc.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    /*private static final String USER = "SCOTT";
    private static final String PASSWORD = "TIGER";*/
    private static final String USER = "wang";
    private static final String PASSWORD = "123456";

    /**
     * 建立和数据库的连接
     *
     * @return 连接
     */
    public Connection getConnection() {
        try {
            return JdbcDataSource.getDruidDataSource().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 释放资源
     *
     * @param rs
     *            结果集
     * @param stm
     *            语句对象
     * @param conn
     *            连接
     */
    public void close(ResultSet rs, Statement stm, Connection conn) {
        try {
            // 关闭结果集
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                // 关闭语句对象
                if (stm != null && !stm.isClosed()) {
                    stm.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    // 关闭连接
                    if (conn != null && !conn.isClosed()) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 释放资源
     *
     * @param stm
     *            语句对象
     * @param conn
     *            连接
     */
    public void close(Statement stm, Connection conn) {
        close(null, stm, conn);
    }

}
