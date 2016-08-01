<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>鱼香是只猫后台管理</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css"
	media="screen">
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript"
	src="resources/scripts/jquery-1.3.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript"
	src="resources/scripts/simpla.jquery.configuration.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
<%--变换菜单的背景 --%>
<script type="text/javascript">
	function changebg(id) {
		$("#a").removeClass("current");
		$("#b").removeClass("current");
		$("#c").removeClass("current");
		$("#d").removeClass("current");
		$("#e").removeClass("current");
		$("#f").removeClass("current");
		$("#" + id).addClass("current");
	}

	function changeStatus(id) {
		$("#a1").removeClass("current");
		$("#b1").removeClass("current");
		$("#b2").removeClass("current");
		$("#c1").removeClass("current");
		$("#d1").removeClass("current");
		$("#d2").removeClass("current");
		$("#e1").removeClass("current");
		$("#f1").removeClass("current");
		$("#f2").removeClass("current");
		$("#" + id).addClass("current");
	}
</script>
</head>
<body>
	<div id="sidebar">
		<div id="sidebar-wrapper">
			<!-- Sidebar with logo and menu -->
			<h1 id="sidebar-title">
				<a href="#">鱼香是只猫</a>
			</h1>
			<!-- Logo (221px wide) -->
			<a href="main.jsp" target="mainFrame"><img id="logo"
				src="resources/images/logo.png" alt="鱼香是只猫"></a>
			<!-- Sidebar Profile links -->
			<div id="profile-links">
				您好, <a href="findUserDetailsByUserIdAction" title="编辑你的个人信息"
					target="mainFrame">admin </a>, 祝您使用愉快！<br> <br> <a
					href="http://www.xn--eprz83b7ojjw2bt9c.cn" title="查看网站前台"
					target="_blank">查看网站的前台</a> | <a href="logOutAction" title="注销登录"
					target="_top">注销登录</a>
			</div>
			<ul id="main-nav">
				<!-- Accordion Menu -->
				<li><a href="#" class="nav-top-item no-submenu"
					style="padding-right: 15px;" id="a" onclick="changebg('a')">
						小窝 </a>
					<ul style="display: none;">
						<li><a href="findHousesAction" target="mainFrame" id="a1"
							onclick="changeStatus('a1')">查看小窝信息</a></li>
					</ul></li>

				<li><a href="#" class="nav-top-item" id="c"
					onclick="changebg('c')">关于/联系主人 </a>
					<ul style="display: none;">
						<li><a href="findUserDetailsByUserIdAction"
							target="mainFrame" id="c1" onclick="changeStatus('c1')">查看主人个人资料</a></li>
					</ul></li>
				<li><a href="#" class="nav-top-item" id="d"
					onclick="changebg('d')"> 主人作品</a>
					<ul style="display: none;">
						<li><a href="findAlbumsForUploadAction" target="mainFrame"
							id="d1" onclick="changeStatus('d1')">上传新的作品</a></li>
						<li><a href="findAlbumsAction" target="mainFrame" id="d2"
							onclick="changeStatus('d2')">管理相册</a></li>
					</ul></li>
				<li><a href="#" class="nav-top-item" id="b"
					onclick="changebg('b')"> <!-- Add the class "current" to current menu item -->
						主人旅途
				</a>
					<ul style="display: block;">
						<li><a href="adddynamic.jsp" target="mainFrame" id="b1"
							onclick="changeStatus('b1')">发表一个新的动态</a></li>
						<li><a href="findDynamicsAction" target="mainFrame" id="b2"
							onclick="changeStatus('b2')">管理动态</a></li>
						<!-- Add class "current" to sub menu items also -->
					</ul></li>
				<li><a href="#" class="nav-top-item" id="e"
					onclick="changebg('e')">留言板 </a>
					<ul style="display: none;">
						<li><a href="findLeaveMessageAction" target="mainFrame"
							id="e1" onclick="changeStatus('e1')">管理留言</a></li>
					</ul></li>
				<li><a href="#" class="nav-top-item" id="f"
					onclick="changebg('f')"> 全局设置 </a>
					<ul style="display: none;">
						<li><a href="findBasicConfigurationAction" target="mainFrame"
							id="f1" onclick="changeStatus('f1')">基本设置</a></li>
						<li><a href="http://zhanzhang.baidu.com/" target="_blank"
							id="f2" onclick="changeStatus('f2')">网站访问统计</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- End #sidebar -->

</body>
</html>