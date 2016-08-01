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
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

.main {
	position: relative;
	left: 600px;
	top: 50px;
	height: 400px;
	width: 900px;
}

.text {
	position: relative;
	top: 100px;
	height: 450px;
}

.text p {
	text-align: center;
	color: red;
	font-size: 12px;
	font-weight: bold;
}

.text img {
	left: 580px;
	position: relative;
}
</style>
</head>
<body>
	<div class="text">
		<p>出错啦：网站已经被管理员关闭，请耐心等待。。。</p>
		<p>
			您访问的网站是：
			<s:property value="#session.basicConfiguration.webSiteName" />
		</p>
		<p>
			网站的地址是：
			<s:property value="#session.basicConfiguration.webSiteUrl" />
		</p>
		<p>
			关闭原因：
			<s:property value="#session.basicConfiguration.closeWebSiteReason" />
		</p>
	</div>
</body>
</html>
