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
<link href="css/portfolio_one.css" rel="stylesheet" type="text/css" />
<link href="css/colour.css" rel="stylesheet" type="text/css" />
<!-- modernizr enables HTML5 elements and feature detects -->
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
</head>

<body style="background: transparent;">
	<div id="main">
		<!-- begin content -->
		<div id="site_content">
			<!-- start gallery HTML containers -->
			<div id="gallery" class="content">
				<div class="slideshow-container">
					<div id="loading" class="loader"></div>
					<div id="slideshow" class="slideshow"></div>
				</div>
			</div>
			<div id="thumb-container">
				<div id="thumbs" class="navigation">
					<h1 style="font-family: 'xin'">主人的照片</h1>
					<a href="findAlbumsToFrontAction" target="iframepage" style="display: block;">&hearts;点击返回相册&hearts;</a>
					<ul class="thumbs noscript">

						<s:iterator value="works" var="work">
							<li><a class="thumb"
								href="back/thumbs/<s:property value="#work.workSrc"/>"> <img
									src="back/thumbs/<s:property value="#work.workSrc"/>" alt="sdf"
									width="75px" width="75px" /></a>
								<div class="caption">
									<div class="image-title portfolio_one">
										作品描述：
										<s:property value="#work.workDescription" />
										<br /> 上传时间：
										<s:date name="#work.workUploadDate"
											format="yyyy-MM-dd HH:mm:ss" />
									</div>
								</div></li>
						</s:iterator>
					</ul>
				</div>
				<div id="controls" class="controls portfolio_one"></div>
				<div id="caption" class="caption-container"></div>
				<div style="clear: both;"></div>
				<!-- end gallery HTML containers -->
			</div>
		</div>
		<!-- end content -->

	</div>
	<!-- javascript at the bottom for fast page loading -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<!-- initialise sooperfish menu -->
	<script type="text/javascript" src="js/jquery.galleriffic.js"></script>
	<script type="text/javascript" src="js/jquery.opacityrollover.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(
				function($) {
					// we only want these styles applied when javascript is enabled
					$('div.navigation').css({
						'width' : '450px',
						'float' : 'left'
					});
					$('div.content').css('display', 'block');
					// initially set opacity on thumbs and add additional styling for hover effect on thumbs
					var onMouseOutOpacity = 0.67;
					$('#thumbs ul.thumbs li').opacityrollover({
						mouseOutOpacity : onMouseOutOpacity,
						mouseOverOpacity : 1.0,
						fadeSpeed : 'fast',
						exemptionSelector : '.selected'
					});
					// initialize advanced galleriffic gallery
					var gallery = $('#thumbs').galleriffic(
							{
								delay : 3500,
								numThumbs : 10,
								preloadAhead : 10,
								enableTopPager : false,
								enableBottomPager : true,
								maxPagesToShow : 7,
								imageContainerSel : '#slideshow',
								controlsContainerSel : '#controls',
								captionContainerSel : '#caption',
								loadingContainerSel : '#loading',
								renderSSControls : true,
								renderNavControls : true,
								playLinkText : '幻灯片播放',
								pauseLinkText : '暂停幻灯片',
								prevLinkText : '&lsaquo; 上一张图片',
								nextLinkText : '下张图片 &rsaquo;',
								nextPageLinkText : '下一页 &rsaquo;',
								prevPageLinkText : '&lsaquo; 上一页',
								enableHistory : false,
								autoStart : true,
								syncTransitions : true,
								defaultTransitionDuration : 900,
								onSlideChange : function(prevIndex, nextIndex) {
									// 'this' refers to the gallery, which is an extension of $('#thumbs')
									this.find('ul.thumbs').children().eq(
											prevIndex).fadeTo('fast',
											onMouseOutOpacity).end().eq(
											nextIndex).fadeTo('fast', 1.0);
								}
							});
				});
	</script>
</body>
</html>
