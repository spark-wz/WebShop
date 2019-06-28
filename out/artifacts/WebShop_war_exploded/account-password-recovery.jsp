<!DOCTYPE html>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Password Recovery | Inspina E-Commerce HTML Template</title>
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
    <script type="text/javascript">
        $(function () {
            $("#lookPassword").click(function () {
                var data = $("#lookPassword-form").serialize();
                $.ajax({
                    url:"${pageContext.request.contextPath}/look",
                    type:"post",
                    data:data,
                    success:function (res) {
                        if (res.false=="失败"){
                            alert(res.false);
                        }else {
                            alert("密码修改成功0");
                            location = "${pageContext.request.contextPath}/index";
                        }
                    }
                });
                return false;
            });
        })

    </script>
</head>
<body>
    <!-- Start Logo -->
    <div class="site-branding">
        <div class="inner">
            <a class="offcanvas-toggle cats-toggle" href="#shop-categories" data-toggle="offcanvas"></a>
            <a class="offcanvas-toggle menu-toggle" href="#mobile-menu" data-toggle="offcanvas"></a>
            <a class="site-logo" href="index-1.html"><img src="assets/images/logo/logo.png" alt="Inspina"></a>
        </div>
    </div>
    <!-- End Logo -->
<!-- End NavBar -->
<div class="offcanvas-wrapper">
    <!-- Start Page Title -->
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>密码重置</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>密码重置</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Page Title -->
    <!-- Start Password Recovery -->
    <div class="container padding-top-1x padding-bottom-3x">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <h2>忘记密码?</h2>
                <p>你可以通过你绑定的邮箱来设定一个新密码</p>
                <form class="card mt-4" id="lookPassword-form">
                    <div class="card-body">
                        <div class="form-group">
                            <input class="form-control" type="text"  name="email" id="email-for-pass" placeholder="输入你的邮箱" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password"  name="password" id="email-for-password" placeholder="输入你的密码" required>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-primary" id="lookPassword" type="submit">更改密码</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Start Password Recovery -->
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
