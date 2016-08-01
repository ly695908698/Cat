<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<title>更新相册</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<%--验证信息 --%>
<script language="JavaScript" type="text/javascript"
	src="validate/validateupdatealbumjsp.js"></script>
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
	<form action="updateAlbumAction" method="post"
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
					<th class="tablestyle_title">更新相册</th>
				</tr>
				<tr>
					<td class="CPanel">
						<table border="0" cellpadding="0" cellspacing="0"
							style="width:100%">
							<tr>
								<td align="left">当前位置：作品管理 --&gt;&gt;管理相册--&gt;&gt;更新相册</td>
							</tr>

							<TR>
								<TD width="100%">
									<fieldset style="height:100%;">
										<legend>更新相册</legend>
										<table border="1" cellpadding="2" cellspacing="0"
											style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;">
											<tr style="border:none;">
												<td nowrap width="13%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>相册编号:</b>
													<p>相册编号，数据库中保存的编号！</p></td>
												<td width="41%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;">
													<input type="text" name="album.albumId"
													value="<s:property value="album.albumId"/>"
													disabled="disabled" /> <input type="hidden"
													name="album.albumId"
													value="<s:property value="album.albumId"/>" />
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap width="13%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>相册名称:</b>
													<p>相册名称，给相册起一个好听的名字！</p>
													<p>如美景，艺术作品，手绘等。</p></td>
												<td width="41%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;">
													<input name="album.albumName" class="text" type="text"
													size="27" id="albumName" onblur="clearAlbumNameMsg()"
													value="<s:property value="album.albumName"/>" /> <span
													class="red"> *</span><span id="pleaseInputAlbumName"
													style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请输入相册的名称！</span>
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;"><b>相册封面:</b>
													<p>相册封面，设置相册的主题。</p></td>
												<td
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;position:relative;left:-160px;">
													<div class="file-box">
														<input type='text' name="album.albumCover" id='albumCover'
															class='txt'
															value="<s:property value="album.albumCover"/>" /> <input
															type='button' class='btn' value='浏览...'  style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;"/> <input
															type="file" name="upload" class="file" size="28"
															onchange="document.getElementById('albumCover').value=this.value"
															onblur="clearAlbumCoverMsg()" /> <span class="red">
															*</span> <span id="pleaseInputAlbumCover"
															style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请上传！</span>
													</div>
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;"><b>相册上传时间:</b>
													<p>相册上传时间，保存你上传图片的时间。</p></td>
												<td
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;position:relative;left:-160px;"><input
													name="album.albumCreateTime" class="text" type="text"
													style="width:154px"
													value="<s:property value="album.albumCreateTime"/>"
													disabled="disabled" /> <input name="album.albumCreateTime"
													class="text" type="hidden" style="width:154px"
													value="<s:property value="album.albumCreateTime"/>" /></td>
											</tr>
											<tr style="border:none;">
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>相册的状态:</b>
													<p>设置的状态，如果设置为显示，则在前台显示，否则不显示。</p></td>
												<s:if test="album.albumStatus==1">
													<td
														style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;"><select
														name="album.albumStatus">
															<option selected="selected" value="1">显示</option>
															<option value="0">不显示</option>
													</select></td>
												</s:if>
												<s:else>
													<td
														style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;"><select
														name="album.albumStatus">
															<option value="1">显示</option>
															<option value="0" selected="selected">不显示</option>
													</select></td>
												</s:else>
											</tr>
											<tr style="border:none;">
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>相册描述:</b>
													<p>相册描述,用于描述相册。</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;"><textarea
														id="textarea" name="album.albumDescription" rows="5"
														cols="80"><s:property
															value="album.albumDescription" /></textarea></td>
											</tr>
										</table>
										<br />
									</fieldset>
								</TD>
							</TR>
						</TABLE>
					</td>
				</tr>
				<TR>
					<TD colspan="2" align="center" height="50px"><input
						type="submit" name="Submit" value="更新" style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;"/>&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="button" name="Submit2" value="返回" style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;"
						onclick="window.history.go(-1);" /></TD>
				</TR>
			</TABLE>
			</td>
			</tr>
			</table>
		</div>
	</form>
</body>
</html>
