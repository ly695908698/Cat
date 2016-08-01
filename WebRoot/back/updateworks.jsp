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
<title>鱼香是只猫后台管理</title>
<link rel="stylesheet" rev="stylesheet" href="css/style.css"
	type="text/css" media="all" />
<script type="text/javascript" language="JavaScript"
	src="validate/validateupldateworksjsp.js"></script>
<script language="JavaScript" type="text/javascript">
	function check() {
		document.getElementById("aa").style.display = "";
	}
</script>
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
	padding: 0
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
	<!-- 表单上传文件的编码格式 -->
	<form action="updateWorksAction" method="post"
		enctype="multipart/form-data" name="form"
		onsubmit="return validateAll();">
		<div class="MainDiv">
			<table width="103%" border="0" cellpadding="0" cellspacing="0"
				style="position:relative;left:-15px;top:-15px;background-color:#ffffff">
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="62" background="images/nav04.gif">
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
					<th class="tablestyle_title">更新作品</th>
				</tr>
				<tr>
					<td class="CPanel">

						<table border="0" cellpadding="0" cellspacing="0"
							style="width:100%">
							<tr>
								<td align="left">当前位置：作品管理 --&gt;&gt;更新作品</td>
							</tr>
							<TR>
								<TD width="100%">
									<fieldset style="height:100%;">
										<legend>更新作品</legend>
										<table border="1" cellpadding="2" cellspacing="0"
											style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;">

											<tr style="border:none;">
												<td nowrap width="13%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>作品名称:</b>
													<p>作品名称，给你的作品取个好听的名字吧！</p></td>
												<td width="41%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><input
													name="works.workName" class="text" style="width:154px"
													type="text" size="40"
													value="<s:property value='works.workName'/>" id="workName"
													onblur="clearWorkNameMsg();" /> <span class="red">
														*</span> <span id="pleaseInputWorkName"
													style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请输入作品名称！</span>
													<input type="hidden" name="albumId"
													value="<s:property value="albumId"/>" /> <input
													name="works.workId" class="text" style="width:154px"
													type="hidden" size="40"
													value="<s:property value='works.workId'/>" /></td>
											</tr>
											<tr>
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>选择作品:</b>
													<p>选择作品，从电脑中选择你要上传的图片。</p></td>
												<td
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1">
													<div class="file-box">
														<input type='text' name='works.workSrc' id="workSrc"
															class='txt' value="<s:property value='works.workSrc'/>" />
														<input type='button' class='btn' value='浏览...' /> <input
															type="file" name="upload" class="file" id="fileField"
															onblur="clearWorkSrcMsg()" size="28"
															onchange="document.getElementById('workSrc').value=this.value" />
														<span class="red"> *</span><span id="pleaseInputWorkSrc"
															style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请上传！</span>
													</div>
												</td>
											</tr>
											<tr>
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>作品所属相册:</b>
													<p>作品所属相册，为你上传的作品选择一个相册。</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1">
													<select name="works.album.albumId">
														<s:iterator value="albumsList" var="album">
															<%--如果作品没有上传 --%>
															<option value="<s:property value="#album.albumId"/>"><s:property
																	value="#album.albumName" /></option>
														</s:iterator>
												</select>
												</td>
											</tr>
											<tr>
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>作品描述:</b>
													<p>作品描述，为你上传的作品添加一个详细的描述吧。</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><textarea
														id="textarea" name="works.workDescription" rows="5"
														cols="80"
														style="resize:none;overflow-x:hidden;overflow-y:hidden;"><s:property
															value="works.workDescription" /></textarea></td>
											</tr>
											<tr>
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>上传作品格式:</b>
													<p>上传作品格式，显示你刚才上传图片的格式。</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1">

													<s:if test='works==null'>暂无上传作品格式。</s:if> <s:else>
														<input type="hidden" name="works.workType"
															value="<s:property value='works.workType' />" />
														<s:property value='works.workType' />
													</s:else>
												</td>
											</tr>
											<tr>
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>作品上传时间:</b>
													<p>作品上传时间，显示你刚才上传的图片的时间。</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1">

													<s:if test='works==null'>暂无上传时间。</s:if> <s:else>
														<input type="hidden" name="works.workUploadDate"
															value="<s:property value='works.workUploadDate' />" />
														<s:property value='works.workUploadDate' />
													</s:else>
												</td>
											</tr>
											<tr>
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>作品预览:</b>
													<p>作品预览，显示你刚才上传的图片。</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1">

													<s:if test='works==null'>暂无预览。</s:if> <s:else>
														<img src="thumbs/<s:property value='works.workSrc'/>"
															alt="" width="100px" height="100px" />
													</s:else>
												</td>
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
						type="submit" name="Submit" value="更新作品" class="button" /> <input
						type="button" name="Submit2" value="返回" class="button"
						onclick="window.history.go(-1);" /></TD>
				</TR>
			</TABLE>
		</div>
	</form>
</body>
</html>
