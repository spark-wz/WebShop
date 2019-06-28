<!DOCTYPE html>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <%--    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>--%>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Profile | Inspina E-Commerce HTML Template</title>
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
    <style type="text/css">
        #tupian{
            width: 4000px;
            height: 100px;
        }
        #verify {
            height: 34px;
            vertical-align: top;
            font-size: 16px;
        }

        #code_img {
            width: 100px;
            height: 40px;
            cursor: pointer;
            vertical-align: top;
        }
    </style>
</head>
<body>

<!-- Start Shop Category Menu -->
<div class="offcanvas-container" id="shop-categories">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title">Shop Categories</h3>
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
<!-- End Shop Category Menu -->
<!-- Start NavBar -->
<header class="navbar navbar-sticky">
    <!-- Start Logo -->
    <div class="site-branding">
        <div class="inner">
            <a class="offcanvas-toggle cats-toggle" href="#shop-categories" data-toggle="offcanvas"></a>
            <a class="offcanvas-toggle menu-toggle" href="#mobile-menu" data-toggle="offcanvas"></a>
            <a class="site-logo" href="index-1.jsp
"><img src="assets/images/logo/logo.png" alt="Inspina"></a>
        </div>
    </div>
    <!-- End Logo -->

</header>
<!-- End NavBar -->
<div class="offcanvas-wrapper">
    <!-- Start Page Title -->
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>我的资料</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>我的资料</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Page Title -->
    <!-- Start My Profile -->
    <div class="container padding-top-1x padding-bottom-3x">
        <div class="row">
            <div class="col-lg-4">
                <aside class="user-info-wrapper">
                    <div class="user-info">
                        <div class="user-avatar" style="height: border-box"><a class="edit-avatar" id = "updateCard"  ></a><img src="${sessionScope.user.users_address}" id="tupian" alt="User"></div>
                        <div class="user-data">
                            <h4>${sessionScope.user.users_name}</h4><span></span>
                        </div>
                    </div>
                </aside>
                <nav class="list-group">
                    <a class="list-group-item active" href="#+
"><i class="icon-head"></i>My Profile</a>
                    <a class="list-group-item with-badge" href="${pageContext.request.contextPath}/order
"><i class="icon-bag"></i>My Orders<span class="badge badge-primary badge-pill"></span></a>
                    <a class="list-group-item" href="${pageContext.request.contextPath}/addAddress
"><i class="icon-map"></i>My Addresses</a>
                    <a class="list-group-item with-badge" href="${pageContext.request.contextPath}/wish
"><i class="icon-heart"></i>My Wishlist<span class="badge badge-primary badge-pill"></span></a>
                </nav>
            </div>
            <div class="col-lg-8">
                <div class="padding-top-2x mt-2 hidden-lg-up"></div>
                <form class="row"  id="register-form" method="post" >
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-fn">用户名</label>
                            <input class="form-control" name="username" type="text" id="account-fn" value="${sessionScope.user.users_name}" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-email">邮箱</label>
                            <input class="form-control" type="email" name="email" id="account-email" value="${sessionScope.user.users_email}" disabled>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-pass">新密码</label>
                            <input class="form-control" type="password" name="password1" id="account-pass" value="********">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-confirm-pass">确认密码</label>
                            <input class="form-control" type="password" name="password2" id="account-confirm-pass" value="********">
                        </div>
                    </div>
                    <div class="col-12">
                        <hr class="mt-2 mb-3">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <button class="btn btn-primary margin-bottom-none" id="register" type="submit">save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End My Profile -->
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
        var imgs = ["static/1.jpg","static/2.jpg","static/3.jpg"];
        var index = 0;
        $("#updateCard").click(function () {
            /*  var img = this.parentElement.lastChild
              console.log(hhh.src);*/
            index++;
            if (index === imgs.length){
                index = 0;
            }
            var img = document.getElementById("tupian");
            var photo = imgs[index];
            console.log(photo);
            $.ajax({
                url:"${pageContext.request.contextPath}/photo",
                type:"get",
                data:{
                    photo:photo
                },
                success:function (res) {
                    if (res.success){
                        img.src = imgs[index];
                        console.log("更换成功")
                    }
                }
            })
        });
        $("#register").click(function () {
            var data = $("#register-form").serialize();
            $.ajax({
                url:"${pageContext.request.contextPath}/updateDatebase",
                type:"get",
                data:data,
                success:function (res) {
                    if (res.success){
                        alert("修改成功");
                        location = "${pageContext.request.contextPath}/index";
                    }else {
                        alert("修改失败");
                    }
                }
            });
            return false;
        })
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
