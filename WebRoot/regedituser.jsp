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
<title>注册用户界面</title>
<meta name="description" content="个人设计工作室" />
<meta name="keywords" content="鱼香是只猫" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

</head>

<body>
	<form action="saveUserAction" method="post">
		请输入用户名：<input type="text" name="user.userName" /><br />
		请输入密&nbsp;&nbsp;码：<input type="text" name="user.passWord" /><br />
		请确认密&nbsp;&nbsp;码：<input type="text" name="" /><br /> 请输入验证码：<input
			type="text" name="" /><br /> <input type="submit" value="注册" />
	</form>
</body>
</html>

