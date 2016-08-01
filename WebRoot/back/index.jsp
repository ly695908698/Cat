<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>鱼香是只猫后台管理</title>
</head>
<body style="background: transparent;">
	<div>
		<iframe src="left.jsp" width="230px;" height="1200px" frameborder="0"
			style="position:relative;top:0px;float: left;" scrolling="no"></iframe>
		<iframe src="main.jsp" width="1075px" height="1200px"
			style="position:relative;top:0px;left:0px;" frameborder="0"
			scrolling="no" name="mainFrame" allowTransparency="true"></iframe>
	</div>
</body>
</html>

