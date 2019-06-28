<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Checkout Review | Inspina E-Commerce HTML Template</title>
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
            <c:forEach items="${requestScope.daoHang}" var="daoHang">
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
<!-- End Shop Category Menu -->
<!-- Start NavBar -->
<header class="navbar navbar-sticky">
    <!-- Start Search -->
    <form class="site-search" method="get">
        <input type="text" name="site_search" placeholder="Type to search...">
        <div class="search-tools">
            <span class="clear-search">Clear</span>
            <span class="close-search"><i class="icon-cross"></i></span>
        </div>
    </form>
    <!-- End Search -->
    <!-- Start Logo -->
    <div class="site-branding">
        <div class="inner">
            <a class="offcanvas-toggle cats-toggle" href="#shop-categories" data-toggle="offcanvas"></a>
            <a class="offcanvas-toggle menu-toggle" href="#mobile-menu" data-toggle="offcanvas"></a>
            <a class="site-logo" href="index-1.html"><img src="assets/images/logo/logo.png" alt="Inspina"></a>
        </div>
    </div>
    <!-- End Logo -->
    <!-- Start Toolbar -->
    <div class="toolbar">
    </div>
    <!-- End Toolbar -->
</header>
<!-- End NavBar -->
<div class="offcanvas-wrapper">
    <!-- Start Page Title -->
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>结算页</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>结算页</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Page Title -->
    <!-- Start Checkout Content -->
    <div class="container padding-top-1x padding-bottom-3x">
        <div class="row">
            <!-- Start Checkout Review -->
            <div class="col-lg-9">
                <h3>收货地址</h3>
                <c:forEach items="${requestScope.address}" var="address">
                    <tr>
                        <td>
                            <div class="product-item">
                                <label>
                                    <input type="radio" id="place_id" name="placesId" value="${address.place_id}">
                                    <span>${address.place_name}  ${address.place_phone}   ${address.place_full}</span>
                                </label>
                                <div class="product-info">
                                    <h4 class="product-title"><a href="#"></a></h4>
                                    <span></span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <h4>结算你的订单</h4>
                <hr class="padding-bottom-1x">
                <div class="table-responsive shopping-cart">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>商品名</th>
                            <th class="text-center">价格</th>
                            <th class="text-center">数目</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.goodsList}" var="goodsList">
                            <tr>
                                <td>
                                    <input type="hidden" name="gid" value="${goodsList.goods_id}">
                                    <div class="product-item">
                                        <a class="product-thumb" href="#"><img src="${goodsList.goods_address}" alt="Product"></a>
                                        <div class="product-info">
                                            <h4 class="product-title">
                                                <a href="shop-single-1.html">${goodsList.goods_describe}</a>
                                            </h4>
<%--                                            <span><em>Size:</em> 20MP</span><span><em>Color:</em> Black</span>--%>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center text-lg text-medium">${goodsList.goods_price}</td>
                                <td class="text-center text-lg text-medium">${goodsList.cart_num}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="shopping-cart-footer">
                    <div class="column"></div>
                    <div class="column text-lg">总数 <span class="text-medium">${requestScope.total.total_sum}</span></div>
                    <div class="column text-lg">总价格 <span class="text-medium">${requestScope.total.total_price}</span></div>
                </div>
                <div class="checkout-footer margin-top-1x">
                    <div class="column hidden-xs-down"></div>
                    <button class="btn-success" id="btn-tijiao">提交</button>
                </div>
            </div>
            <!-- End Checkout Review -->
            <!-- Start Sidebar -->
        </div>
    </div>
    <!-- End Product Content -->
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
<script type="text/javascript">
    $(function () {
        $("#btn-tijiao").click(function () {
            var url = "${pageContext.request.contextPath}/submit?"
            var hhh = $(":radio[name='placesId']:checked").val();
            url +="placeId="+hhh+"&";
            $(":hidden[name = 'gid']").each(function () {
                url += "gid="+this.value+"&"
            });
            console.log(hhh);
            console.log(url);
            // return;
            $.ajax({
                url:url,
                type:"get",
                success:function (res)  {
                    console.log(res)
                    if (res.success){
                        alert("订单创建成功")
                        location = "${pageContext.request.contextPath}/index";
                    }
                }
            })
        });
    });
</script>
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
