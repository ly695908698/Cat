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
<base href="<%=basePath%>">

<title>鱼香是只猫</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="鱼香是只猫,贺洁个人设计工作室">
<meta http-equiv="description" content="个人设计工作室">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<style type="text/css">
img {
	border: none;
	-webkit-box-shadow: 3px 3px 7px #777;
	-moz-box-shadow: 3px 3px 7px #777;
}

.wrap {
	margin: 10px;
	width: 273px;
	height: 190px;
	float: left;
}

.photo a {
	position: absolute;
	display: block;
	/* 	border: 1px solid #999; */
	padding: 2px;
}

.photo {
	width: 273px;
	/* height: 190px; */
}

.photo a:hover {
	/* 	border: 1px solid #fff; */
	text-decoration: none
}

.photo a span {
	display: none;
	cursor: hand;
	text-align: center;
	font: bold 25px/50px 楷体;
}

.photo a:hover span {
	width: 273px;
	margin: 0 2px;
	background: #000;
	display: block;
	position: absolute;
	bottom: 0;
	left: 0;
	color: #fff;
	filter: alpha(opacity = 10);
	moz-opacity: 0.6;
	opacity: 0.6;
}

.content {
	height: 450px;
	position: relative;
	left: 30px;
}
</style>
</head>

<body>
	<div id="site_content" class="content">
		<s:if test="albumsList!=null&&(!albumsList.isEmpty())">
			<s:iterator value="albumsList" var="albums">
				<div class='wrap'>
					<div class='photo'>
						<a
							href="findWorksByAlbumIdToFrontAction?albumId=<s:property value="#albums.albumId"/>">
							<img src="back/thumbs/<s:property value="#albums.albumCover"/>"
							width='273' height='190' /> <span><s:property
									value="#albums.albumName" /></span>
						</a>
					</div>
				</div>
			</s:iterator>
		</s:if>
		<s:else>
			<h1>I'm so sorry to tall you, there is no albums。。。。。</h1>
			<h1>Please wait the website owner upload。。。。。</h1>
		</s:else>
	</div>
	<div style="clear: both;width: 900px;"></div>
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
				"bdSelectMiniList" : [ "qzone", "tsina", "tqq", "renren",
						"weixin" ]
			}
		};
		with (document)
			0[(getElementsByTagName('head')[0] || body)
					.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
					+ ~(-new Date() / 36e5)];
	</script>
</body>
</html>
