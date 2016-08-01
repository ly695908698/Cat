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
<title>主功能界面</title>
<meta name="description" content="个人设计工作室" />
<meta name="keywords" content="鱼香是只猫" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

</head>

<body>
	欢迎你，
	<s:property value="#session.user.userName" />
	<br />
	<a href="frontUserLogOutAction">退出登录</a>
	<br />
	<a href="#">评论主人博客</a>
	<br />
	<a href="#">评论主人照片</a>
	<br />
	<a href="#">给主人留言</a>
	<br />
</body>
</html>

