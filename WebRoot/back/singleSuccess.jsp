<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>文件上传成功提示页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body>
	文件上传成功！
	<br>
	<!-- 显示上传成功的页面 -->
	<img alt="上传图片" src="back/upload/<s:property value='uploadFileName'/>" />
	<s:debug></s:debug>
</body>
</html>
