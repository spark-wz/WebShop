//品牌表
CREATE TABLE brand(
  brand_id NUMBER(6) PRIMARY KEY,
  brand_name VARCHAR2(200),
  brand_status NUMBER(2),
  brand_time DATE
);
CREATE SEQUENCE seq_brand START WITH 1001;
//分类表
CREATE TABLE sort(
  sort_id NUMBER(6) PRIMARY KEY,
  sort_name VARCHAR2(200),
  sort_status NUMBER(2),
  sort_time DATE
);
CREATE SEQUENCE seq_sort START WITH 2001;
//商品表
CREATE TABLE goods(
  goods_id NUMBER(6) PRIMARY KEY,
  goods_name VARCHAR2(200),
  goods_price NUMBER(7,2),
  goods_reserve NUMBER(5),
  goods_sale NUMBER(5),
  goods_address VARCHAR2(200),
  goods_describe VARCHAR2(500),
  goods_status NUMBER(2),
  goods_time DATE,
  brand_id NUMBER(6),
  sort_id NUMBER(6),
  CONSTRAINT fk_goods_brand_id FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  CONSTRAINT fk_goods_sort_id FOREIGN KEY (sort_id) REFERENCES sort(sort_id)
);
CREATE SEQUENCE seq_goods START WITH 3001;
//用户表
CREATE TABLE users(
  users_id NUMBER(6) PRIMARY KEY,
  users_name VARCHAR2(200),
  users_passwword VARCHAR2(200),
  users_email VARCHAR2(200),
  users_status NUMBER(2),
  users_time DATE
);
CREATE SEQUENCE seq_users START WITH 4001;
//收货地址
CREATE TABLE place(
  place_id NUMBER(6) PRIMARY KEY,
  place_name VARCHAR2(200),
  place_phone NUMBER(20),
  place_full VARCHAR2(500),
  place_pretermit NUMBER(2),
  place_status NUMBER(2),
  place_time DATE,
  users_id NUMBER(6),
  CONSTRAINT fk_place_users_id FOREIGN KEY (users_id) REFERENCES users(users_id)
);
  CREATE SEQUENCE seq_place START WITH 5001;
//购物车
CREATE TABLE cart(
  cart_id NUMBER(6) PRIMARY KEY,
  cart_num NUMBER(6),
  users_id NUMBER(6),
  goods_id NUMBER(6),
  CONSTRAINT fk_cart_users_id FOREIGN KEY (users_id) REFERENCES users(users_id),
  CONSTRAINT fk_cart_goods_id FOREIGN KEY (goods_id) REFERENCES goods(goods_id)
);
 CREATE SEQUENCE seq_cart START WITH 6001;
//订单
CREATE TABLE orders(
  orders_id NUMBER(6) PRIMARY KEY,
  orders_status NUMBER(2),
  orders_time DATE,
  users_id,
  place_id NUMBER(6),
  CONSTRAINT fk_orders_users_id FOREIGN KEY (users_id) REFERENCES users(users_id),
  CONSTRAINT fk_orders_goods_id FOREIGN KEY (place_id) REFERENCES place(place_id)
);
  CREATE SEQUENCE seq_order START WITH 7001;
  //订单明细
  CREATE TABLE details(
  details_id NUMBER(6) PRIMARY KEY,
  orders_id NUMBER(6),
  goods_id NUMBER(6),
  goods_name VARCHAR2(200),
  goods_address VARCHAR2(200),
  goods_price NUMBER(7,2),
  details_num NUMBER(6),
  CONSTRAINT fk_details_orders_id FOREIGN KEY (orders_id) REFERENCES orders(orders_id),
  CONSTRAINT fk_details_goods_id FOREIGN KEY (goods_id) REFERENCES goods(goods_id)
);  
	CREATE SEQUENCE seq_details START WITH 8001;

















