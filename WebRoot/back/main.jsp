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
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css"
	media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript"
	src="resources/scripts/jquery-1.3.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript"
	src="resources/scripts/simpla.jquery.configuration.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
</head>
<body
	style="font-family: Arial, Helvetica, sans-serif; color: #555; background:transpanrent; font-size: 12px; position: relative; left: -200px; top: 20px; background-image: none;">
	<div id="main-content">
		<!-- Main Content Section with everything -->
		<!-- Page Head -->
		<h2>欢迎</h2>
		<p id="page-intro">你想做些什么呢?</p>
		<ul class="shortcut-buttons-set">
			<li><a class="shortcut-button" href="adddynamic.jsp"
				target="mainFrame"><span> <img
						src="resources/images/icons/pencil_48.png" alt="icon"/><br/>
								发表新的动态 </span></a></li>
			<li><a class="shortcut-button"
				href="findUserDetailsByUserIdAction" target="mainFrame"><span>
						<img src="resources/images/icons/paper_content_pencil_48.png"
						alt="icon"/><br/>编辑个人信息 
				</span></a></li>
			<li><a class="shortcut-button" href="findAlbumsForUploadAction"
				target="mainFrame"><span> <img
						src="resources/images/icons/image_add_48.png" alt="icon"/><br/>
								上传新的作品 </span></a></li>
			<li><a class="shortcut-button" href="findHousesAction"
				target="mainFrame"><span> <img
						src="resources/images/icons/clock_48.png" alt="icon"/><br/>
								小窝管理 </span></a></li>
			<li><a class="shortcut-button" href="findLeaveMessageAction"
				target="mainFrame"><span> <img
						src="resources/images/icons/comment_48.png" alt="icon"/><br/>
								管理留言 </span></a></li>
		</ul>
		<!-- End .shortcut-buttons-set -->
		<div class="clear"></div>
		<!-- End .clear -->
		<div class="clear"></div>

		<!-- End Notifications -->
		<div id="footer">
			<small> <!-- Remove this notice or replace it with whatever you want -->
				© Copyright 2014 鱼香是只猫 | 蒙ICP备13002765号-1
			</small>
		</div>
		<!-- End #footer -->
	</div>
	<!-- End #main-content -->
</body>
</html>