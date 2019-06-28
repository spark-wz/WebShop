<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Shopping Cart | Inspina E-Commerce HTML Template</title>
    <!-- Mobile Specific Meta Tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/favicon.ico">
    <!-- Bootsrap CSS -->
    <link rel="stylesheet" media="screen" href="assets/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
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
    <style type="text/css" rel="stylesheet">
        .btn-cart{
            display: inline-block;
            width: 40px;
            height: 40px;
        }
        .goods_num{
            display: inline-block;
            width: 60px;
            height: 40px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
           $("#select-all").click(function () {
               $(":checkbox[name='goodsId']").prop("checked",this.checked)
               queryTotal();
           });
            $(":checkbox[name='goodsId']").click(function () {
                queryTotal();
                $("#select-all").prop("checked",$(":checkbox[name='goodsId']").length ===$(":checkbox[name='goodsId']:checked").length)
            });
        });
                function queryTotal() {
            var url = "${pageContext.request.contextPath}/cartTotal?"
            var inputs = $(":checkbox[name='goodsId']:checked");
            if (inputs.length === 0){
                $("#total-sum").text(0);
                $("#total-price").text("￥0.00");
                return;
            }
            //获取选中复选框
            $(":checkbox[name='goodsId']:checked").each(function () {
                url += "goodsId="+this.value+"&";
            });
            $.ajax({
                url:url,
                type:"get",
                success : function (res) {
                    console.log(res);
                    $("#total-sum").text(res.total_sum);
                    $("#total-price").text(res.total_price);
                }
            })
        };
        function updateCartNums(e){
            var tr = $(e).parent().parent();
            var input =$(e).parent().parent().children(":first").children(":first").children("input");
            input.prop("checked",true);
            var goodsId = $(e).parent().parent().children(":first").children(":first").children("").val();
            var reserve = $(e).parent().parent().children(":first").children(":first").children("#reserve").val();
            var  action = "add";
            if ($(e).text()!="+"){
                action = "sub";
            }
            var input = $(e).parent().children("input");
            if (action === "add" && input.val() === reserve){
                alert("添加购物车数量超出库存");
                return;
            }
            if (action ==="sub" &&input.val()==="1"){
                alert("购物车商品不能小于1");
                return;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/updateGoodsNum",
                type:"get",
                data:{
                  goodsId:goodsId,
                  action:action
                },
                success:function (res) {
                    //计算合计
                    queryTotal();
                    var num = input.val();
                    if (res.success === true) {
                        //成功
                        if (action === "add"){
                            input.val(++num);
                        }else {
                            input.val(--num);
                        }
                    }else {
                        //失败
                        alert("修改失败");
                    }
                }
            });
        };
        $(function () {
            $("#btn-allDelete").click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/DeleteAllCart",
                    type:"get",
                    success:function (res) {
                        if (!res.success) {
                            alert("删除失败");
                    }else{
                            alert("删除成功");
                            location = "${pageContext.request.contextPath}/cart"
                        }
                    }
                });
            });
        });
        function del(e) {
            //获取要删除的商品编号
            var tr = $(e).parent().parent();
            var goodsId = $(e).parent().parent().children(":first").children(":first").children().val();
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteCart",
                type:"get",
                data:{
                    goodsId:goodsId,
                },
                success:function (res) {
                    console.log(res.success)
                    queryTotal();
                    if (res.success){
                        alert("删除成功");
                        tr.remove();
                    }else {
                        alert("删除失败");
                    }
                }
            })
        };
    </script>
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

<!-- Start TopBar -->
<div class="topbar">
</div>
<!-- End TopBar -->
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
            <a class="site-logo" href="index-1.html"><img src="assets/images/logo/logo.png" alt="Inspina"></a>
        </div>
    </div>
    <!-- End Logo -->
    <!-- Start Toolbar -->
    <div class="toolbar">
        <div class="inner">
            <div class="tools">
                <div class="search"><i class="icon-search"></i></div>

                <!-- Start Cart -->
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
                        </div>
                    </div>
                </div>
                <!-- End Cart -->
            </div>
        </div>
    </div>
    <!-- End Toolbar -->
</header>
<!-- End NavBar -->
<div class="offcanvas-wrapper">
    <!-- Start Page Title -->
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>购物车</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>购物车</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Page Title -->
    <!-- Start Cart Content -->
    <div class="container padding-top-1x padding-bottom-3x">
        <!-- Start Shopping Cart -->
        <div class="table-responsive shopping-cart">
            <table class="table">
                <thead>
                <tr>
                    <label><input type="checkbox" id="select-all"><i></i> 全选</label>
                    <th>商品</th>
                    <th class="text-center w-25">数量</th>
                    <th class="text-center">价格</th>
                    <th class="text-center">折扣</th>
                    <th class="text-center">
                        <a class="btn btn-sm btn-outline-danger" id="btn-allDelete">清空购物车</a>
                    </th>
                </tr>
                </thead>
                <tbody>
               <c:forEach items="${requestScope.goods}" var="goods">
                   <tr>
                       <td>
                           <div class="product-item">
                               <input type="checkbox" name="goodsId" value="${goods.goods_id}">
                               <input type="hidden" id="reserve" value="${goods.goods_reserve}">
                               <a class="product-thumb" href="shop-single-1.html"><img src="${pageContext.request.contextPath}/${goods.goods_address}" alt="Product"></a>
                               <div class="product-info">
                                   <h4 class="product-title"><a href="shop-single-1.html">${goods.goods_discribe}</a></h4>
                                   <span>${goods.goods_describe}</span>
                               </div>
                           </div>
                       </td>
                       <td class="text-center">
                           <%--<div class="count-input">
                           </div><select class="form-control">
                           <option>1</option>
                           <option>2</option>
                           <option>3</option>
                           <option>4</option>
                           <option>5</option>
                       </select>--%>
                               <button class="btn-cart" onclick="updateCartNums(this)">-</button>
                               <input class="goods_num text-center" type="text" value="${goods.cart_num}">
                               <button class="btn-cart"onclick="updateCartNums(this)">+</button>
                       </td>
                       <td class="text-center text-lg text-medium">￥${goods.goods_price}</td>
                       <td class="text-center">&mdash;</td>
                       <td class="text-center">
                           <button  onclick="del(this)" class="btn btn-sm btn-danger">删除</button>
                       </td>
                   </tr>
               </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="shopping-cart-footer">
            <div class="column">
                <form class="coupon-form" method="post">
                    <input class="form-control form-control-sm" type="text" placeholder="Coupon Code" required>
                    <button class="btn btn-outline-primary btn-sm" type="submit"></button>
                </form>
            </div>
            <div class="column text-lg">总数 &nbsp;  <span id="total-sum" class="text-medium"></span></div>
            <div class="column text-lg">总价 &nbsp; <span id="total-price" class="text-medium"></span></div>
        </div>
        <div class="shopping-cart-footer">
            <div class="column">
                <a class="btn btn-outline-secondary" id="btn-recycle">一键还原</a>
            </div>
            <div class="column">
                <button   class="btn btn-success" id="btn-checkOut">结算</button>
            </div>
        </div>
        <!-- End Shopping Cart -->
    </div>
    <!-- End Cart Content -->
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
        $("#btn-checkOut").click(function () {
             var inputs = $(":checkbox[name='goodsId']:checked");
              if (inputs.length === 0){
                  alert("请至少选择一个商品");
                  return;
              }
              var url = "${pageContext.request.contextPath}/checkOut?"
            $(":checkbox[name='goodsId']:checked").each(function () {
                url += "goodsId="+this.value+"&";
            });/*
              f*/
            location = url;
        });
        $("#btn-recycle").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/recycle",
                type:"get",
                success:function (res) {
                    if (!res.success) {
                        alert("还原失败");
                    }else{
                        alert("还原成功");
                        location = "${pageContext.request.contextPath}/cart"
                    }
                }
            });
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
