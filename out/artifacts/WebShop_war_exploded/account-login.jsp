<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zxx">
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
<%--    <script src="https://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>--%>
    <style>
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
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Login | Inspina E-Commerce HTML Template</title>
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
            $("#tijiao").click(function () {
                var data = $("#login-form").serialize();
                $.ajax({
                    url:"${pageContext.request.contextPath}/login",
                    type:"post",
                    data:data,
                    success:function (res) {
                        if (res.error){
                            alert(res.error);
                        }else {
                            location = "${pageContext.request.contextPath}/index";
                        }
                    }
                });
                return false;
            });
            $("#register").click(function () {
                var data = $("#register-form").serialize();
                console.log(data);
                // return false;
                $.ajax({
                    url:"${pageContext.request.contextPath}/register",
                    type:"post",
                    data:data,
                    success:function (res) {
                        if (res.error){
                            alert(res.error);
                        }else {
                            location = "${pageContext.request.contextPath}/index";
                        }
                    }
                });
                return false;
            });
        });

    </script>
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

    <!-- Start Toolbar -->
    <div class="toolbar">
        <div class="inner">
            <div class="tools">
                <div class="search"><i class="icon-search"></i></div>
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
                <h1>登录和注册</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>登录和注册</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Page Title -->
    <!-- Start Account Access -->
    <div class="container padding-top-1x padding-bottom-3x">
        <div class="row">
            <div class="col-md-6">
                <form class="login-box"  id ="login-form" method="post" action="${pageContext.request.contextPath}/login">
                    <h4 class="margin-bottom-1x">登录你的账户</h4>
                    <div class="form-group input-group">
                        <input class="form-control" type="text" name="username" placeholder="用户名" required><span class="input-group-addon"><i class="icon-mail"></i></span>
                    </div>
                    <div class="form-group input-group">
                        <input class="form-control" type="password" name="password" placeholder="密码" required><span class="input-group-addon"><i class="icon-lock"></i></span>
                    </div>
                    <div class="d-flex flex-wrap justify-content-between padding-bottom-1x">
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" id="remember_me" checked>
                        </div><a class="navi-link" href="account-password-recovery.jsp">忘记密码?</a>
                    </div>
                    <div class="text-center text-sm-right">
                        <button class="btn btn-primary margin-bottom-none"  id = "tijiao" type="submit">Login</button>
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <div class="padding-top-3x hidden-md-up"></div>
                <h3 class="margin-bottom-1x padding-top-1x">没有账户?注册</h3>
                <form class="row" id="register-form" method="post">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="reg-fn">用户名</label>
                            <input class="form-control"  name="username" type="text" id="reg-fn" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="reg-email">邮箱</label>
                            <input class="form-control" type="text" name="email" id="reg-email" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="reg-pass">密码</label>
                            <input class="form-control" type="password" name="password1" id="reg-pass" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="reg-pass-confirm">再次输入</label>
                            <input class="form-control" type="password" name="password2" id="reg-pass-confirm" required>
                        </div>
                    </div>
                    <p>
                        <input type="text" class="topAlign" id="verify" name="verify" required>
                        <canvas width="100" height="40" id="verifyCanvas"></canvas>
                        <img id="code_img">
                    </p>
                    <div class="col-12 text-center text-sm-right">
<%--                        <a class="btn btn-success" id="yanzheng">验证</a>--%>
                        <button class="btn btn-success" type="button" onclick="return false;" id="yanzheng">验证</button>
                        <button class="btn btn-primary margin-bottom-none" id="register" type="submit" disabled>注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Account Access -->
    <!-- Start Footer -->
    <footer class="site-footer">
        <div class="container">
            <!-- Start Footer Info -->
            <div class="row">
                <!-- Start Contact Info -->
                <div class="col-lg-3 col-md-6 ">
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
        var nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
            'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
            'y', 'z'
        ];
        var colors = []
        drawCode();
        // 绘制验证码
        function drawCode() {
            var canvas = document.getElementById("verifyCanvas"); //获取HTML端画布
            var context = canvas.getContext("2d"); //获取画布2D上下文
            context.fillStyle = "cornflowerblue"; //画布填充色
            context.fillRect(0, 0, canvas.width, canvas.height);
            // 创建渐变
            var gradient = context.createLinearGradient(0, 0, canvas.width, 0);
            gradient.addColorStop("0", "magenta");
            gradient.addColorStop("0.5", "blue");
            gradient.addColorStop("1.0", "red");
            //清空画布
            context.fillStyle = gradient; //设置字体颜色
            context.font = "25px Arial"; //设置字体
            var rand = new Array();
            var x = new Array();
            var y = new Array();
            for (var i = 0; i < 4; i++) {
                rand[i] = nums[Math.floor(Math.random() * nums.length)]
                x[i] = i * 16 + 10;
                y[i] = Math.random() * 20 + 20;
                context.fillText(rand[i], x[i], y[i]);
            }
            // console.log(rand);
            //画3条随机线
            for (var i = 0; i < 3; i++) {
                drawline(canvas, context);
            }

            // 画30个随机点
            for (var i = 0; i < 30; i++) {
                drawDot(canvas, context);
            }
            convertCanvasToImage(canvas)

            $("#yanzheng").click((e) => {
                var input = $("#verify").val();
                var newRand=rand.join('').toUpperCase();
                console.log(newRand);
                if (input === newRand){
                    alert("验证成功")
                    $("#register").prop("disabled",false);
                } else {
                    alert("验证码输入错误");
                }
            })
        }
        // 随机线
        function drawline(canvas, context) {
            context.moveTo(Math.floor(Math.random() * canvas.width), Math.floor(Math.random() * canvas.height)); //随机线的起点x坐标是画布x坐标0位置，y坐标是画布高度的随机数
            context.lineTo(Math.floor(Math.random() * canvas.width), Math.floor(Math.random() * canvas.height)); //随机线的终点x坐标是画布宽度，y坐标是画布高度的随机数
            context.lineWidth = 0.5; //随机线宽
            context.strokeStyle = 'rgba(50,50,50,0.3)'; //随机线描边属性
            context.stroke(); //描边，即起点描到终点
        }
        // 随机点(所谓画点其实就是画1px像素的线，方法不再赘述)
        function drawDot(canvas, context) {
            var px = Math.floor(Math.random() * canvas.width);
            var py = Math.floor(Math.random() * canvas.height);
            context.moveTo(px, py);
            context.lineTo(px + 1, py + 1);
            context.lineWidth = 0.2;
            context.stroke();

        }
        // 绘制图片
        function convertCanvasToImage(canvas) {
            document.getElementById("verifyCanvas").style.display = "none";
            var image = document.getElementById("code_img");
            image.src = canvas.toDataURL("image/png");
            return image;
        }

        // 点击图片刷新
        document.getElementById('code_img').onclick = function () {
            $('#verifyCanvas').remove();
            $('#verify').after('<canvas width="100" height="40" id="verifyCanvas"></canvas>')
            drawCode();
        }

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
