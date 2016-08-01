<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>鱼香是只猫</title>
<meta name="description" content="个人设计工作设计室">
<meta name="keywords" content="鱼香是只猫">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/templatemo_style.css" rel="stylesheet">

<link href="css/circle.css" rel="stylesheet">
<link rel="stylesheet" href="css/nivo-slider.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<script>
	window._bd_share_config = {
		"common" : {
			"bdSnsKey" : {},
			"bdText" : "",
			"bdMini" : "2",
			"bdPic" : "",
			"bdStyle" : "0",
			"bdSize" : "16"
		},
		"share" : {},
		"image" : {
			"viewList" : [ "qzone", "tsina", "tqq", "renren", "weixin" ],
			"viewText" : "分享到：",
			"viewSize" : "16"
		},
		"selectShare" : {
			"bdContainerClass" : null,
			"bdSelectMiniList" : [ "qzone", "tsina", "tqq", "renren", "weixin" ]
		}
	};
	with (document)
		0[(getElementsByTagName('head')[0] || body)
				.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
				+ ~(-new Date() / 36e5)];
</script>
<script
	src="http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=388611"></script>
</head>
<body>
	<div id="templatemo_portfolio" class="section2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="glView">
						<div class="switcher">
							<ul>
								<li id="grid" class="grid"><i class="fa fa-th-large"></i></li>
								<li id="list" class="list list-active"><i
									class="fa fa-align-justify"></i></li>
							</ul>
						</div>


						<div class="imgSwitch">
							<div class="row">

								<s:iterator value="dynamics" var="dynamic">
									<div
										class="col-xs-6 col-sm-3 col-md-3 prod-cnt graphic dbox-list"
										style="opacity: 1;">
										<div class="itemCont">
											<a href="#">
												<div class="thumb">
													<img class="img-responsive center-block" alt="动态图片"
														src="back/dynamicimg/<s:property value="#dynamic.dynamicImg"/>">
												</div>
												<div class="itemInfo">
													<h4>
														<s:property value="#dynamic.dynamicTitle" />
													</h4>
													<h6>
														<s:date name="#dynamic.dynamicDate"
															format="yyyy-MM-dd HH:mm:ss" />
													</h6>
													<p>
														<s:property value="#dynamic.dynamicContent" />
													</p>
												</div>
											</a>
										</div>
									</div>
								</s:iterator>
							</div>
							<div class="loadit">
								共 <span class="right-text09"><s:property value="pageAll" />
								</span> 页| 第 <span class="right-text09"><s:property
										value="pageNow" /> </span> 页 [ <a
									href="findDynamicsToFrontAction?pageNow=1" class="right-font08">首页</a>
								| <a
									href="findDynamicsToFrontAction?pageNow=<s:property value="pageNow-1==0?1:pageNow-1"/>"
									class="right-font08">上一页</a> |
								<s:if test="pageNow+1<=pageAll">
									<a
										href="findDynamicsToFrontAction?pageNow=<s:property value="pageNow+1"/>"
										class="right-font08">下一页</a>
								</s:if>
								<s:else>
									<a
										href="findDynamicsToFrontAction?pageNow=<s:property value="pageAll"/>"
										class="right-font08">下一页</a>
								</s:else>
								| <a
									href="findDynamicsToFrontAction?pageNow=<s:property value="pageAll"/>"
									class="right-font08">末页</a>]
								<!-- <button type="button" class="btn btn-primary">Load More</button> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery.cycle2.min.js"></script>
	<script src="js/jquery.cycle2.carousel.min.js"></script>
	<script src="js/jquery.nivo.slider.pack.js"></script>
	<script>
		$.fn.cycle.defaults.autoSelector = '.slideshow';
	</script>
	<script src="js/jquery.cookie.js"></script>
	<script type="text/javascript">
		$(function() {

			//变换按钮的颜色
			function get_grid() {
				$('.list').removeClass('list-active');
				$('.grid').addClass('grid-active');
				$('.prod-cnt').animate({
					opacity : 0
				}, function() {
					$('.prod-cnt').removeClass('dbox-list');
					$('.prod-cnt').addClass('dbox');
					$('.prod-cnt').stop().animate({
						opacity : 1
					});
				});
			}
			//变换按钮的颜色
			function get_list() {
				$('.grid').removeClass('grid-active');
				$('.list').addClass('list-active');
				$('.prod-cnt').animate({
					opacity : 0
				}, function() {
					$('.prod-cnt').removeClass('dbox');
					$('.prod-cnt').addClass('dbox-list');
					$('.prod-cnt').stop().animate({
						opacity : 1
					});
				});
			}
			$('#list').click(function() {
				$.cookie('view', 'list');
				get_list();
			});

			$('#grid').click(function() {
				$.cookie('view', 'grid');
				get_grid();
			});

		});
	</script>

	<script type="text/javascript"
		src="js/lib/jquery.mousewheel-3.0.6.pack.js"></script>
</body>
</html>