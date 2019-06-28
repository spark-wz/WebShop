<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<html lang="zh-cmn-Hans">
<head>

	<meta charset="UTF-8">
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/global.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/swiper.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<script src="js/jquery.1.12.4.min.js" charset="UTF-8"></script>
	<script src="js/bootstrap.min.js" charset="UTF-8"></script>
	<script src="js/swiper.min.js" charset="UTF-8"></script>
	<script src="js/global.js" charset="UTF-8"></script>
	<script src="js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
	<title>U袋网</title>
	<script type="text/javascript">
		$(function () {
			$("#btn-add").click(function () {
				//获取商品编号
				var goodsId = "${requestScope.product.goods_id}"
				//获取数量
				var num = $("input[name='lookNum']").val();
				$.ajax({
					url:"${pageContext.request.contextPath}/add2Cart",
					type:"get",
					data:{
						goodsId:goodsId,
						num:num
					},
					success:function (res) {
						if(res.isLogin === false) {
							location = "${pageContext.request.contextPath}/login?url=" + res.uri;
							return;
						}

						console.log(res.success);
						if (res.success){
							alert("添加成功");
							location = "${pageContext.request.contextPath}/cart"
						}else {
							console.log(res.success);
							alert("添加失败");
						}
					}
				})
			});
			$("#btn-wish").click(function () {
				//获取商品编号
				var goodsId = "${requestScope.product.goods_id}"
				$.ajax({
					url:"${pageContext.request.contextPath}/add2wish",
					type:"get",
					data:{
						goodsId:goodsId,
					},
					success:function (res) {
						if (res.success){
							alert("添加成功");
							location = "${pageContext.request.contextPath}/wish"
						}else {
							console.log(res.success);
							alert("添加失败");
						}
					}
				})
			});
		});
	</script>
</head>
<body>
<div class="content inner">
	<section class="item-show__div item-show__head clearfix">
		<div class="pull-left">
			<div class="item-pic__box" id="magnifier">
				<div class="small-box">
					<img class="cover" src="${requestScope.product.goods_address}" alt="重回汉唐 旧忆 原创设计日常汉服女款绣花长褙子吊带改良宋裤春夏">
					<span class="hover"></span>
				</div>
				<div class="thumbnail-box">
					<a href="javascript:;" class="btn btn-default btn-prev"></a>
					<div class="thumb-list">

					</div>
					<a href="javascript:;" class="btn btn-default btn-next"></a>
				</div>
			</div>
			<script src="js/jquery.magnifier.js"></script>
			<script>
				$(function () {
					$('#magnifier').magnifier();
				});
			</script>
			<div class="item-info__box">

				<div class="item-price bgf5">
					<div class="price-box clearfix">

						<script>
							// 会员价格折叠展开
							$(function () {
								$('.vip-price-panel').click(function() {
									if ($(this).hasClass('active')) {
										$('.all-price__box').stop().slideUp('normal',function() {
											$('.vip-price-panel').removeClass('active').find('.iconfont').removeClass('icon-up').addClass('icon-down');
										});
									} else {
										$(this).addClass('active').find('.iconfont').removeClass('icon-down').addClass('icon-up');
										$('.all-price__box').stop().slideDown('normal');
									}
								});
							});
						</script>
					</div>
				</div>
				<ul class="item-ind-panel clearfix">
				</ul>
				<div class="item-key">
					<div class="item-sku">

					</div>
					<div class="small-box">
						<h3>详情</h3><sapn>${requestScope.product.goods_describe}</sapn>
					</div>
					<div class="small-box">
						<h3>商品名</h3><sapn>${requestScope.product.goods_name}</sapn>
					</div>
					<div class="small-box">
						<h3>价格</h3><sapn>￥${requestScope.product.goods_price}</sapn>
					</div>
					<div class="small-box">
						<h3>库存</h3><sapn>${requestScope.product.goods_reserve}</sapn>
					</div>
					<div class="small-box">
						<h3>销量</h3><sapn>${requestScope.product.goods_sale}</sapn>
					</div>
					<div class="item-amount clearfix bgf5">
						<div class="amount-box">
							<div class="amount-widget">
								<input class="amount-input" name="lookNum" value="1" maxlength="8" title="请输入购买量" type="text">
								<div class="amount-btn">
									<a class="amount-but add"></a>
									<a class="amount-but sub"></a>
								</div>
							</div>
							<div class="item-stock"><span style="margin-left: 10px;"> <b id="Stock"></b> </span></div>
							<script>
								$(function () {
									$('.amount-input').onlyReg({reg: /[^0-9]/g});
									var stock = parseInt($('#Stock').html());
									$('.amount-widget').on('click','.amount-but',function() {
										var num = parseInt($('.amount-input').val());
										if (!num) num = 0;
										if ($(this).hasClass('add')) {
											if (num > stock - 1){
												return DJMask.open({
													width:"300px",
													height:"100px",
													content:"您输入的数量超过库存上限"
												});
											}
											$('.amount-input').val(num + 1);
										} else if ($(this).hasClass('sub')) {
											if (num == 1){
												return DJMask.open({
													width:"300px",
													height:"100px",
													content:"您输入的数量有误"
												});
											}
											$('.amount-input').val(num - 1);
										}
									});
								});
							</script>
						</div>
					</div>
					<div class="item-action clearfix bgf5">
						<a href="javascript:;" rel="nofollow" data-addfastbuy="true" title="点击此按钮，到下一步确认购买信息。" role="button" class="item-action__buy"></a>
						<a href="javascript:void (0)"  id="btn-wish" rel="nofollow" data-addfastbuy="true" role="button" class="item-action__basket"><i class="iconfont icon-shopcart"></i> 加入心愿单</a>
						<a href="javascript:void (0)"  id="btn-add" rel="nofollow" data-addfastbuy="true" role="button" class="item-action__basket"><i class="iconfont icon-shopcart"></i> 加入购物车</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>