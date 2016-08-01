<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加动态信息</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<%--验证信息 --%>
<script language="JavaScript" type="text/javascript"
	src="validate/validateadddynamicjsp.js"></script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}

-->
input {
	vertical-align: middle;
	margin: 0;
	padding: 0;
	padding: 1px;
	border-radius: 4px;
	border: 1px solid #CDCDCD;
}

.file-box {
	position: relative;
	width: 340px
}

.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 180px;
}

.btn {
	background-color: #FFF;
	border: 1px solid #CDCDCD;
	height: 24px;
	width: 70px;
}

.file {
	position: absolute;
	top: 0;
	right: 80px;
	height: 24px;
	filter: alpha(opacity : 0);
	opacity: 0;
	width: 260px
}
</style>
</head>

<body class="ContentBody">
	<form action="addDynamicAction" method="post"
		enctype="multipart/form-data" name="fom" target="mainFrame"
		onsubmit="return validateAll();">
		<div class="MainDiv">
			<table width="103%" border="0" cellpadding="0" cellspacing="0"
				style="position:relative;left:-15px;top:-15px;background-color:#ffffff">
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="resources/images/bg.gif">

									<table width="98%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="144" align="left"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th class="tablestyle_title">发表动态</th>
				</tr>
				<tr>
					<td class="CPanel">
						<table border="0" cellpadding="0" cellspacing="0"
							style="width:100%">
							<tr>
								<td align="left">当前位置：动态管理 --&gt;&gt发表动态</td>
							</tr>

							<TR>
								<TD width="100%">
									<fieldset style="height:100%;">
										<legend>发表动态</legend>
										<table border="1" cellpadding="2" cellspacing="0"
											style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;">

											<tr style="border:none;">
												<td nowrap
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;"><b>动态照片:</b>
													<p>动态照片，上传动态照片。</p></td>
												<td
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;position:relative;left:-160px;">

													<div class="file-box">
														<input type='text' name='textfield' class='txt'
															id="albumCover" /> <input type='button' class='btn'
															value='浏览...'
															style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;" />
														<input type="file" name="upload" class="file" size="28"
															onchange="document.getElementById('albumCover').value=this.value"
															onblur="clearAlbumCoverMsg()" /> <span class="red">
															*</span><span id="pleaseInputAlbumCover"
															style="background:url(images/error.png) no-repeat left center;color:red; display:none; padding-left:20px;font-size:12px;">请上传！</span>
													</div>
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap width="13%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>动态标题:</b>
													<p>动态标题，给动态起一个标题！</p></td>
												<td width="41%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;"><input
													name="dynamic.dynamicTitle" class="text" type="text" size="27"
													style="height:20px;" id="albumName"
													onblur="clearAlbumNameMsg()" /> <span class="red">
														*</span><span id="pleaseInputAlbumName"
													style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请输入动态标题！</span>
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>动态内容:</b>
													<p>动态内容,说点什么吧？</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;"><textarea
														id="textarea" name="dynamic.dynamicContent" rows="5"
														cols="80"></textarea></td>
											</tr>
										</table>
										<br />
									</fieldset>
								</TD>
							</TR>
						</TABLE>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" height="50px"><input
						type="submit" name="Submit" value="发表动态"
						style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;" />&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="button" name="Submit2" value="返回"
						style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;"
						onclick="window.history.go(-1);" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
