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
<title>鱼香是只猫</title>
<meta name="description" content="个人设计工作室" />
<meta name="keywords" content="鱼香是只猫" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!-- stylesheets -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/colour.css" rel="stylesheet" type="text/css" />
<!-- modernizr enables HTML5 elements and feature detects -->
<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
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
</head>

<body style="background: transparent;">

	<!-- begin content -->
	<div id="site_content">
		<div id="left_content">
			<h1 style="font-family: xin">联系我吧</h1>
			<p>以下是主人信息.</p>
			<form id="contact" action="contact.jsp" method="post">
				<div class="form_settings">
					<p>
						性别：
						<s:property value="userDetails.sex" />
					</p>
					<p>
						年龄：
						<s:property value="userDetails.age" />
					</p>
					<p>
						邮箱：
						<s:property value="userDetails.email" />
					</p>
					<p>
						手机：
						<s:property value="userDetails.phone" />
					</p>
					<p>
						Q&nbsp;&nbsp;Q：
						<s:property value="userDetails.qq" />
					</p>
					<p>
						地址：
						<s:property value="userDetails.address" />
					</p>
				</div>
			</form>
		</div>
		<div id="right_content">
			<img src="images/contact.jpg" width="450" height="450"
				title="联系主人" alt="联系主人" />
		</div>
	</div>
	<!-- end content -->
</body>
</html>
