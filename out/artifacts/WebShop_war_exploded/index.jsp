<!DOCTYPE html>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Inspina | Universal E-Commerce HTML Template</title>
    <!-- Mobile Specific Meta Tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/favicon.ico">
    <!-- Bootsrap CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/font-awesome.min.css">
    <!-- Feather Icons CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/feather-icons.css">
    <!-- Pixeden Icons CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/pixeden.css">
    <!-- Social Icons CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/socicon.css">
    <!-- PhotoSwipe CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/photoswipe.css">
    <!-- Izitoast Notification CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/izitoast.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/style.css">
</head>
<body>


<!-- Start Shop Category Menu -->
<div class="offcanvas-container" id="shop-categories">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title">商品分类</h3>
    </div>
    <nav class="offcanvas-menu">
        <ul class="menu">
            <c:forEach items="${requestScope.daoHang }" var="daoHang">
                <li class="has-children">
                    <span>
                        <a href="${pageContext.request.contextPath}/list?id=${daoHang.sort_id}">${daoHang.sort_name}</a>
                        <span class="sub-menu-toggle"></span>
                    </span>
                        <ul class="offcanvas-submenu">
                            <c:forEach items="${daoHang.brands}" var="brand">
                                <li><a href="${pageContext.request.contextPath}/list?<c:if test="${daoHang.sort_id != null}">id=${daoHang.sort_id}&</c:if>bid=${brand.brand_id}">${brand.brand_name}</a></li>
                            </c:forEach>

                        </ul>
                </li>
            </c:forEach>
            <li class="has-children">
                    <span>
                        <a href="${pageContext.request.contextPath}/list">全部商品</a>
                        <span class="sub-menu-toggle"></span>
                    </span>
                <ul class="offcanvas-submenu">

                </ul>
            </li>
        </ul>
    </nav>
</div>
<!-- Start NavBar -->
<header class="navbar navbar-sticky">
    <!-- Start Search -->
    <form class="site-search" method="get"  action="${pageContext.request.contextPath}/list">
        <input type="text" name="name" value="${param.name}" placeholder="输入关键字">
        <div class="search-tools">
            <span class="clear-search">Clear</span>
            <span class="close-search"><i class="icon-cross"></i></span>
            <input type="submit" class="btn btn-outline-secondary" value="搜索"/>
        </div>
    </form>
    <!-- End Search -->
    <!-- Start Logo -->
    <div class="site-branding">
        <div class="inner">
            <a class="offcanvas-toggle cats-toggle" href="#shop-categories" data-toggle="offcanvas"></a>
            <a class="offcanvas-toggle menu-toggle" href="#mobile-menu" data-toggle="offcanvas"></a>
            <a class="site-logo" href="index-1.jsp"><img src="assets/images/logo/logo.png" alt="Inspina"></a>
        </div>
    </div>
    <!-- End Logo -->
    <!-- Start Nav Menu -->
    <nav class="site-menu">
        <ul>
            <li class="active">
                <c:if test="${sessionScope.user == null}"><a href="${pageContext.request.contextPath}/login"><span>登录</span></a></c:if>
            </li>
        </ul>
    </nav>
    <!-- End Nav Menu -->
    <!-- Start Toolbar -->
    <div class="toolbar">
        <div class="inner">
            <div class="tools">
                <div class="search"><i class="icon-search">
                </i></div>
                <!-- Start Account -->
                <c:if test="${sessionScope.user != null}">
                    <div class="account" type="hidden">
                        <a href="#"></a><i class="icon-head"></i>
                        <ul class="toolbar-dropdown">
                            <li class="sub-menu-user">
                                <div class="user-ava">
                                    <img src="${sessionScope.user.users_address}" alt="Tony Stark">
                                </div>
                                <div class="user-info">
                                    <h6 class="user-name">${sessionScope.user.users_name}</h6>
                                    <span class="text-xs text-muted"></span>
                                </div>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/datebase">我的资料</a></li>
                            <li><a href="${pageContext.request.contextPath}/order">我的订单</a></li>
                            <li><a href="${pageContext.request.contextPath}/wish">我的心愿单</a></li>
                            <li class="sub-menu-separator"></li>
                            <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-lock"></i> 退出</a></li>
                        </ul>
                    </div>
                </c:if>
                <!-- End Account -->
                <!-- Start Cart -->
                <c:if test="${sessionScope.user != null}">
                    <div class="cart">
                        <a href="#"></a>
                        <i class="icon-bag"></i>
                        <span class="count">${requestScope.num.count}</span>
                        <div class="toolbar-dropdown">
                            <c:forEach items="${requestScope.goods}" var="goods">
                                <div class="dropdown-product-item">
                                    <span class="dropdown-product-remove"><i class="icon-cross"></i></span>
                                    <a class="dropdown-product-thumb" href="${pageContext.request.contextPath}/${goods.goods_address}">
                                        <img src="${pageContext.request.contextPath}/${goods.goods_address}" alt="Product">
                                    </a>
                                    <div class="dropdown-product-info">
                                        <a class="dropdown-product-title" href="${pageContext.request.contextPath}/${goods.goods_address}">${goods.goods_name}</a>
                                        <span class="dropdown-product-details">${goods.cart_num}  x￥  ${goods.goods_price}</span>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="toolbar-dropdown-group">
                            </div>
                            <div class="toolbar-dropdown-group">
                                <div class="column">
                                    <a class="btn btn-sm btn-block btn-secondary" href="${pageContext.request.contextPath}/cart">查看购物车</a>
                                </div>
                                <div class="column">
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <!-- End Toolbar -->
</header>
<!-- End NavBar -->
<div class="offcanvas-wrapper">
    <!-- Start Main Slider -->
    <div class="hero-slider home-1-hero">
        <div class="owl-carousel large-controls dots-inside" data-owl-carousel='{"nav": true, "dots": true, "loop": true, "autoplay": true, "autoplayTimeou": 7000}'>
            <!-- Start Slide #1 -->
            <div class="item">
                <div class="container padding-top-3x">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center hidden-md-down">
                            <div class="from-bottom">
                                <img class="d-inline-block w-150 mb-4" src="assets/images/hero-slider/logo02.png" alt="Puma">
                                <div class="h2 text-body text-normal mb-2 pt-1">Sony Mobile Collection</div>
                                <div class="h2 text-body text-normal mb-4 pb-1">starting at <span class="text-bold">$200</span></div>
                            </div>
                            <a class="btn btn-primary scale-up delay-1" href="shop-categories-1.jsp">Shop Now</a>
                        </div>
                        <div class="col-md-6 padding-bottom-2x mb-3">
                            <img class="d-block mx-auto" src="assets/images/hero-slider/02.png" alt="Puma Backpack">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Slide #1 -->
            <!-- Start Slide #2 -->
            <div class="item">
                <div class="container padding-top-3x">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center hidden-md-down">
                            <div class="from-bottom">
                                <img class="d-inline-block w-200 mb-4" src="assets/images/hero-slider/logo01.png" alt="Converse">
                                <div class="h2 text-body text-normal mb-2 pt-1">Intel Laptops Collection</div>
                                <div class="h2 text-body text-normal mb-4 pb-1">starting at <span class="text-bold">$372</span></div>
                            </div>
                            <a class="btn btn-primary scale-up delay-1" href="shop-categories-2.jsp">Shop Now</a>
                        </div>
                        <div class="col-md-6 padding-bottom-2x mb-3">
                            <img class="d-block mx-auto" src="assets/images/hero-slider/01.png" alt="Chuck Taylor All Star II">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Slide #2 -->
            <!-- Start Slide #3 -->
            <div class="item">
                <div class="container padding-top-3x">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center hidden-md-down">
                            <div class="from-bottom">
                                <img class="d-inline-block mb-4 home-1-hero-item" src="assets/images/hero-slider/logo03.png" alt="Motorola">
                                <div class="h2 text-body text-normal mb-2 pt-1">LG Televisions Collection</div>
                                <div class="h2 text-body text-normal mb-4 pb-1">starting at <span class="text-bold">$460</span></div>
                            </div>
                            <a class="btn btn-primary scale-up delay-1" href="shop-categories-3.jsp">Shop Now</a>
                        </div>
                        <div class="col-md-6 padding-bottom-2x mb-3">
                            <img class="d-block mx-auto" src="assets/images/hero-slider/03.png" alt="Moto 360">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Slide #3 -->
        </div>
    </div>
    <!-- End Main Slider -->
    <!-- Start Top Categories -->
    <section class="container padding-top-3x">
        <h3 class="text-center mb-30">Top Categories</h3>
        <div class="row">
            <div class="col-md-4 col-sm-6 home-cat">
                <div class="card">
                    <a class="card-img-tiles" href="shop-categories-1.jsp">
                        <div class="inner">
                            <div class="main-img">
                                <img src="assets/images/shop/categories/01.jpg" alt="Category">
                            </div>
                            <div class="thumblist">
                                <img src="assets/images/shop/categories/02.jpg" alt="Category">
                                <img src="assets/images/shop/categories/03.jpg" alt="Category">
                            </div>
                        </div>
                    </a>
                    <div class="card-body text-center">
                        <h4 class="card-title">Smartphones</h4>
                        <p class="text-muted">Starting from $149</p>
                        <a class="btn btn-outline-primary btn-sm" href="#">View Products</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 home-cat">
                <div class="card">
                    <a class="card-img-tiles" href="shop-categories-2.jsp">
                        <div class="inner">
                            <div class="main-img">
                                <img src="assets/images/shop/categories/04.jpg" alt="Category">
                            </div>
                            <div class="thumblist">
                                <img src="assets/images/shop/categories/05.jpg" alt="Category">
                                <img src="assets/images/shop/categories/06.jpg" alt="Category">
                            </div>
                        </div>
                    </a>
                    <div class="card-body text-center">
                        <h4 class="card-title">Laptops</h4>
                        <p class="text-muted">Starting from $349</p>
                        <a class="btn btn-outline-primary btn-sm" href="#">View Products</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 horizontal-center home-cat">
                <div class="card">
                    <a class="card-img-tiles" href="shop-categories-3.jsp">
                        <div class="inner">
                            <div class="main-img">
                                <img src="assets/images/shop/categories/07.jpg" alt="Category">
                            </div>
                            <div class="thumblist">
                                <img src="assets/images/shop/categories/08.jpg" alt="Category">
                                <img src="assets/images/shop/categories/09.jpg" alt="Category">
                            </div>
                        </div>
                    </a>
                    <div class="card-body text-center">
                        <h4 class="card-title">Televisions</h4>
                        <p class="text-muted">Starting from $499</p>
                        <a class="btn btn-outline-primary btn-sm" href="#">View Products</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Top Categories -->
    <!-- Start Featured Products -->
    <section class="container padding-top-3x padding-bottom-3x">
        <h3 class="text-center mb-30">Featured Products</h3>
        <div class="owl-carousel"
             data-owl-carousel='{"nav": false, "dots": false, "margin": 30, "responsive": {"0":{"items":1},"576":{"items":2},"768":{"items":3},"991":{"items":4},"1200":{"items":4}} }'>
            <!-- Start Product #1 -->
            <div class="grid-item">
                <div class="product-card">
                    <a class="product-thumb" href="shop-single-3.jsp">
                        <img src="assets/images/shop/products/01.jpg" alt="Product">
                    </a>
                    <h3 class="product-title"><a href="shop-single-3.jsp">iPhone X</a></h3>
                    <h4 class="product-price">$749.99</h4>
                    <div class="product-buttons">
                        <div class="product-buttons">
                            <button class="btn btn-outline-secondary btn-sm btn-wishlist" data-toggle="tooltip" title="Whishlist">
                                <i class="icon-heart"></i>
                            </button>
                            <button class="btn btn-outline-primary btn-sm" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product #1 -->
            <!-- Start Product #2 -->
            <div class="grid-item">
                <div class="product-card">
                    <div class="rating-stars">
                        <i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i>
                    </div>
                    <a class="product-thumb" href="shop-single-2.jsp">
                        <img src="assets/images/shop/products/05.jpg" alt="Product">
                    </a>
                    <h3 class="product-title"><a href="shop-single-2.jsp">Panasonic TX-32</a></h3>
                    <h4 class="product-price">$949.50</h4>
                    <div class="product-buttons">
                        <div class="product-buttons">
                            <button class="btn btn-outline-secondary btn-sm btn-wishlist" data-toggle="tooltip" title="Whishlist">
                                <i class="icon-heart"></i>
                            </button>
                            <button class="btn btn-outline-primary btn-sm" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product #2 -->
            <!-- Start Product #3 -->
            <div class="grid-item">
                <div class="product-card">
                    <a class="product-thumb" href="shop-single-3.jsp">
                        <img src="assets/images/shop/products/09.jpg" alt="Product">
                    </a>
                    <h3 class="product-title"><a href="shop-single-3.jsp">Sony HDR-AS50R</a></h3>
                    <h4 class="product-price">$700.00</h4>
                    <div class="product-buttons">
                        <div class="product-buttons">
                            <button class="btn btn-outline-secondary btn-sm btn-wishlist" data-toggle="tooltip" title="Whishlist">
                                <i class="icon-heart"></i>
                            </button>
                            <button class="btn btn-outline-primary btn-sm" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product #3 -->
            <!-- Start Product #4 -->
            <div class="grid-item">
                <div class="product-card">
                    <div class="rating-stars">
                        <i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i>
                    </div>
                    <a class="product-thumb" href="shop-single-2.jsp">
                        <img src="assets/images/shop/products/13.jpg" alt="Product">
                    </a>
                    <h3 class="product-title"><a href="shop-single-2.jsp">HP LaserJet Pro 200</a></h3>
                    <h4 class="product-price">$249.50</h4>
                    <div class="product-buttons">
                        <div class="product-buttons">
                            <button class="btn btn-outline-secondary btn-sm btn-wishlist" data-toggle="tooltip" title="Whishlist">
                                <i class="icon-heart"></i>
                            </button>
                            <button class="btn btn-outline-primary btn-sm" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product #4 -->
            <!-- Start Product #5 -->
            <div class="grid-item">
                <div class="product-card">
                    <a class="product-thumb" href="shop-single-3.jsp">
                        <img src="assets/images/shop/products/17.jpg" alt="Product">
                    </a>
                    <h3 class="product-title"><a href="shop-single-3.jsp">Apple Watch 3</a></h3>
                    <h4 class="product-price">$449.00</h4>
                    <div class="product-buttons">
                        <div class="product-buttons">
                            <button class="btn btn-outline-secondary btn-sm btn-wishlist" data-toggle="tooltip" title="Whishlist">
                                <i class="icon-heart"></i>
                            </button>
                            <button class="btn btn-outline-primary btn-sm" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product #5 -->
            <!-- Start Product #6 -->
            <div class="grid-item">
                <div class="product-card">
                    <div class="rating-stars">
                        <i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i>
                    </div>
                    <a class="product-thumb" href="shop-single-2.jsp">
                        <img src="assets/images/shop/products/21.jpg" alt="Product">
                    </a>
                    <h3 class="product-title"><a href="shop-single-2.jsp">Acer Aspire 15.6 i3</a></h3>
                    <h4 class="product-price">$649.50</h4>
                    <div class="product-buttons">
                        <div class="product-buttons">
                            <button class="btn btn-outline-secondary btn-sm btn-wishlist" data-toggle="tooltip" title="Whishlist">
                                <i class="icon-heart"></i>
                            </button>
                            <button class="btn btn-outline-primary btn-sm" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product #6 -->
        </div>
    </section>
    <!-- End Featured Products -->
    <!-- Start Popular Brands -->
    <section class="bg-faded padding-top-3x padding-bottom-3x">
        <div class="container">
            <h3 class="text-center mb-30">Popular Brands</h3>
            <div class="owl-carousel" data-owl-carousel='{ "nav": false, "dots": false, "loop": true, "autoplay": true, "autoplayTimeout": 4000, "responsive": {"0":{"items":2}, "470":{"items":3},"630":{"items":4},"991":{"items":5},"1200":{"items":6}} }'>
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/01.png" alt="Brands">
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/02.png" alt="Brands">
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/03.png" alt="Brands">
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/04.png" alt="Brands">
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/05.png" alt="Brands">
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/06.png" alt="Brands">
                <img class="d-block w-110 opacity-75 m-auto" src="assets/images/brands/07.png" alt="Brands">
            </div>
        </div>
    </section>
    <!-- End Popular Brands -->
    <!-- Start Services -->
    <section class="container padding-top-3x padding-bottom-3x">
        <div class="row">
            <div class="col-md-3 col-sm-6 text-center home-cat">
                <img class="d-block w-90 img-thumbnail rounded-circle mx-auto mb-3" src="assets/images/services/01.png" alt="Shipping">
                <h6>Free Shipping</h6>
                <p class="text-muted margin-bottom-none">On order over $200 ...</p>
            </div>
            <div class="col-md-3 col-sm-6 text-center home-cat">
                <img class="d-block w-90 img-thumbnail rounded-circle mx-auto mb-3" src="assets/images/services/02.png" alt="Money Back">
                <h6>Money Back</h6>
                <p class="text-muted margin-bottom-none">Moneyback guarantee ...</p>
            </div>
            <div class="col-md-3 col-sm-6 text-center home-cat">
                <img class="d-block w-90 img-thumbnail rounded-circle mx-auto mb-3" src="assets/images/services/03.png" alt="Support">
                <h6>24/7 Support</h6>
                <p class="text-muted margin-bottom-none">Online consultations ...</p>
            </div>
            <div class="col-md-3 col-sm-6 text-center home-cat">
                <img class="d-block w-90 img-thumbnail rounded-circle mx-auto mb-3" src="assets/images/services/04.png" alt="Payment">
                <h6>Secure Payment</h6>
                <p class="text-muted margin-bottom-none">Safe Shopping Guarantee ...</p>
            </div>
        </div>
    </section>
    <!-- End Services -->
    <!-- Start Footer -->
    <footer class="site-footer">
        <div class="container">
            <!-- Start Footer Info -->
            <div class="row">
                <!-- Start Contact Info -->
                <div class="col-lg-3 col-md-6">
                    <section class="widget widget-light-skin">
                        <h3 class="widget-title">Inspina Contact Info</h3>
                        <p class="text-white"><i class="fa fa-phone"></i> +1 888 888 8888</p>
                        <p class="text-white"><i class="fa fa-envelope-o"></i> info@yoursite.com</p>
                        <p class="text-white"><i class="fa fa-map-marker"></i> 221B Baker Street, London, UK</p>
                        <ul class="list-unstyled text-sm text-white">
                            <li><span class="opacity-50">Mon - Fri: </span>09:00 - 18:00</li>
                            <li><span class="opacity-50">Sat - Sun: </span>10.00 - 15:00</li>
                        </ul>
                        <a class="social-button shape-circle sb-facebook sb-light-skin" href="#">
                            <i class="socicon-facebook"></i>
                        </a>
                        <a class="social-button shape-circle sb-twitter sb-light-skin" href="#">
                            <i class="socicon-twitter"></i>
                        </a>
                        <a class="social-button shape-circle sb-instagram sb-light-skin" href="#">
                            <i class="socicon-googleplus"></i>
                        </a>
                        <a class="social-button shape-circle sb-instagram sb-light-skin" href="#">
                            <i class="socicon-instagram"></i>
                        </a>
                    </section>
                </div>
                <!-- End Contact Info -->
                <!-- Start Mobile Apps -->
                <div class="col-lg-3 col-md-6">
                    <section class="widget widget-links widget-light-skin">
                        <h3 class="widget-title">Our Services</h3>
                        <ul>
                            <li><a href="#">Creative Web Design</a></li>
                            <li><a href="#">Full Responsive Front-End</a></li>
                            <li><a href="#">Compatible For All Browsers</a></li>
                            <li><a href="#">W3C Walidated Code</a></li>
                            <li><a href="#">Amazing Supper Ideas</a></li>
                            <li><a href="#">50+ Different Pages</a></li>
                            <li><a href="#">Tested on Multiple Devices</a></li>
                        </ul>
                    </section>
                </div>
                <!-- End Mobile Apps -->
                <!-- Start About Us -->
                <div class="col-lg-3 col-md-6">
                    <section class="widget widget-links widget-light-skin">
                        <h3 class="widget-title">About Us</h3>
                        <ul>
                            <li><a href="#">Our Company</a></li>
                            <li><a href="#">Our Team</a></li>
                            <li><a href="#">Our Products</a></li>
                            <li><a href="#">Our Clients</a></li>
                            <li><a href="#">Our Testimonials</a></li>
                            <li><a href="#">24/7 Support</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </section>
                </div>
                <!-- End About Us -->
                <!-- Start Account Info -->
                <div class="col-lg-3 col-md-6">
                    <section class="widget widget-links widget-light-skin">
                        <h3 class="widget-title">Account Info</h3>
                        <ul>
                            <li><a href="#">My Shopping Cart</a></li>
                            <li><a href="#">My Wishlist</a></li>
                            <li><a href="#">My Profile</a></li>
                            <li><a href="#">My Tickets</a></li>
                            <li><a href="#">My Orders</a></li>
                            <li><a href="#">Order Tracking</a></li>
                            <li><a href="#">Single Tickets</a></li>
                        </ul>
                    </section>
                </div>
                <!-- End Account Info -->
            </div>
            <!-- End Footer Info -->
            <hr class="hr-light">
            <!-- Start Copyright -->
            <p class="footer-copyright text-center">© 2018 Inspina | All rights <a href="http://www.17sucai.com/">Reserved</a></p>
            <!-- End Copyright -->
        </div>
    </footer>
    <!-- End Footer -->
</div>
<!-- Start Back To Top -->
<a class="scroll-to-top-btn" href="#">
    <i class="icon-arrow-up"></i>
</a>
<!-- End Back To Top -->
<div class="site-backdrop"></div>
<!-- Modernizr JS -->
<script src="assets/js/modernizr.min.js"></script>
<!-- JQuery JS -->
<script src="assets/js/jquery.min.js"></script>
<!-- Popper JS -->
<script src="assets/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- CountDown JS -->
<script src="assets/js/count.min.js"></script>
<!-- Gmap JS -->
<script src="assets/js/gmap.min.js"></script>
<!-- ImageLoader JS -->
<script src="assets/js/imageloader.min.js"></script>
<!-- Isotope JS -->
<script src="assets/js/isotope.min.js"></script>
<!-- NouiSlider JS -->
<script src="assets/js/nouislider.min.js"></script>
<!-- OwlCarousel JS -->
<script src="assets/js/owl.carousel.min.js"></script>
<!-- PhotoSwipe UI JS -->
<script src="assets/js/photoswipe-ui-default.min.js"></script>
<!-- PhotoSwipe JS -->
<script src="assets/js/photoswipe.min.js"></script>
<!-- Velocity JS -->
<script src="assets/js/velocity.min.js"></script>
<!-- Main JS -->
<script src="assets/js/script.js"></script><script src="assets/js/custom.js"></script>
</body>
</html>
