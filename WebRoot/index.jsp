<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>

<head>
<title><s:property
		value="#session.basicConfiguration.webSiteName" /></title>
<meta name="description" content="个人设计工作室" />
<meta name="keywords" content="鱼香是只猫" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!-- stylesheets -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/colour.css" rel="stylesheet" type="text/css" />
<!-- modernizr enables HTML5 elements and feature detects -->
<script type="text/javascript" src="js/iframe.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<%
	Object o = application.getAttribute("count");
	if (o == null) {
		application.setAttribute("count", 1);
	} else {
		application.setAttribute("count", (Integer) o + 1);
	}
%>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	<%--变换菜单按钮的颜色 --%>
	<script type="text/javascript">
		function changebg(id) {
			$("#a").css("color", "#000");
			$("#b").css("color", "#000");
			$("#c").css("color", "#000");
			$("#d").css("color", "#000");
			$("#e").css("color", "#000");
			$("#f").css("color", "#000");
			$("#"+id).css("color", "#61B3B8");
		}
	</script>
</head>

<body>
	<div id="main">
		<!-- begin header -->
		<header>
			<div id="logo">
				<img src="images/title.png" width="300" height="70"
					style="-webkit-box-shadow:0px 0px 0px 0px" />
				<h1 style="display:inline;font-size:14px;color:#8B8B83;">贺洁个人设计工作室</h1>
			</div>
			<nav>
				<ul class="sf-menu" id="nav">
					<li class="selected"><a id="a" onclick="changebg('a')"
						href="findHousesToFrontAction" target="iframepage">小窝</a></li>
					<li><a  id="b" onclick="changebg('b')"
						href="findAboutJspAction" target="iframepage">关于主人</a></li>
					<li><a  id="c" onclick="changebg('c')"
						href="findAlbumsToFrontAction" target="iframepage">主人作品</a></li>
					<li ><a id="d" onclick="changebg('d')"
						href="findDynamicsToFrontAction" target="iframepage">主人旅途</a></li>
					<li><a id="e" onclick="changebg('e')"
						href="findContactJspAction" target="iframepage">联系主人</a></li>
					<!-- <li><a href="login2.jsp" target="iframepage" id="">登录用户</a></li> -->
					<li><a  id="f" onclick="changebg('f')"
						href="findLeaveMessageToFrontAction" target="iframepage" id="">留言版</a></li>
				</ul>
			</nav>
		</header>
		<!-- end header -->
		<!-- begin content -->
		<iframe id="iframepage" name="iframepage" frameborder="0"
			scrolling="no" width="1350px" src="findHousesToFrontAction"
			onLoad="SetCwinHeight(this)" style="position:relative;left:-200px;">
		</iframe>
		<!-- end content -->
		<!-- begin footer -->
		<footer>
			<p
				style="display:inline;font-size:14px;color:#8B8B83;position:relative;left:-300px;top:10px;">
				<span style="padding-right:150px;">总访问 <span
					style="font-size:14px; color:#FF6600"
					mce_style="font-size:14px; color:#FF6600">${applicationScope.count}</span>次
				</span>&copy; 2014 鱼香是只猫. 蒙ICP备13002765号-1. <a
					href="findHousesToFrontAction" target="iframepage">网站首页</a>.
			</p>
			<div class="bdsharebuttonbox"
				style="position:relative;top:-23px;left:800px;">
				<a href="#" class="bds_more" data-cmd="more"></a><a href="#"
					class="bds_qzone" data-cmd="qzone"></a><a href="#"
					class="bds_tsina" data-cmd="tsina"></a><a href="#" class="bds_tqq"
					data-cmd="tqq"></a><a href="#" class="bds_renren" data-cmd="renren"></a><a
					href="#" class="bds_weixin" data-cmd="weixin"></a>
			</div>
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
						"viewList" : [ "qzone", "tsina", "tqq", "renren",
								"weixin" ],
						"viewText" : "分享到：",
						"viewSize" : "16"
					},
					"selectShare" : {
						"bdContainerClass" : null,
						"bdSelectMiniList" : [ "qzone", "tsina", "tqq",
								"renren", "weixin" ]
					}
				};
				with (document)
					0[(getElementsByTagName('head')[0] || body)
							.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
							+ ~(-new Date() / 36e5)];
			</script>
		</footer>
		<!-- end footer -->

	</div>
</body>
</html>

