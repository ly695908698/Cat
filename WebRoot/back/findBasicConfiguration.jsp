<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<title>基本设置页面</title>
<link rel="stylesheet" rev="stylesheet" href="css/style.css"
	type="text/css" media="all" />
<%--验证信息 --%>
<script type="text/javascript"
	src="validate/validateoverallsituationjsp.js"></script>
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

</style>
</head>

<body class="ContentBody" style="background: transparent;">
	<form action="closeWebSiteAction" method="post"
		enctype="multipart/form-data" name="fom" id="fom" target="mainFrame"
		onsubmit="return validateAll();">
		<!-- -------------------全局设置记录的Id------------------- -->
		<input type="hidden" name="basicConfiguration.basicConfigurationId"
			value="<s:property value="basicConfiguration.basicConfigurationId" />" />
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
											<td width="144" align="left"></a></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th class="tablestyle_title">基本设置</th>
				</tr>
				<tr>
					<td class="CPanel">
						<table border="0" cellpadding="0" cellspacing="0"
							style="width:100%">
							<tr>
								<td align="left">当前位置：全局设置 --&gt;&gt;基本设置</td>
							</tr>

							<TR>
								<TD width="100%">
									<fieldset style="height:100%;">
										<legend>基本设置</legend>
										<table border="1" cellpadding="2" cellspacing="0"
											style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;">

											<tr style="border:none;">
												<td nowrap width="13%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>网站的名称:</b>
													<p>网站名称，将显示在网站标题中</p></td>
												<td width="41%"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><input
													name="basicConfiguration.webSiteName" class="text"
													style="width:154px" type="text" size="40"
													value="<s:property value="basicConfiguration.webSiteName"/>"
													id="webSiteName" onblur="clearWebSiteNameMsg();" /> <span
													class="red"> *</span> <span id="pleaseInputWebSiteName"
													style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请输入网站名称！</span>
												</td>
											</tr>
											<tr>
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>网站的URL:</b>
													<p>网站 URL，将作为链接显示在页面底部</p></td>
												<td
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><input
													name="basicConfiguration.webSiteUrl" id="webSiteUrl"
													class="text" style="width:154px"
													value="<s:property value="basicConfiguration.webSiteUrl"/>"
													onblur="clearWebSiteUrlMsg();" /><span class="red">
														*</span> <span id="pleaseInputWebSiteUrl"
													style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请输入网站地址！</span>
												</td>
											</tr>
											<tr>
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>首页文件名:</b>
													<p>设置网站首页的文件名，默认为“index.jsp”</p>
													<p>如果您更改了此设置，那么您需要使用“FTP工具”手动重命名文件名称</p></td>
												<td
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><input
													name="basicConfiguration.indexFileName" id="indexFileName"
													class="text" style="width:154px"
													value="<s:property value="basicConfiguration.indexFileName"/>"
													onblur="clearIndexFileNameMsg();" /><span class="red">
														*</span> <span id="pleaseInputIndexFileName"
													style="background:url(images/error.png) no-repeat left center;color:red; display:none;
	padding-left:20px;font-size:12px;">请输入首页文件名称！</span>
												</td>
											</tr>
											<!-- 是否关闭网站单选按钮 -->
											<tr>
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>是否关闭网站:</b>
													<p>暂时将网站关闭，使网站无法访问</p></td>
												<td
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1">
													<!-- 如果获取网站的状态是打开的，就选择打开按钮 --> <s:if
														test="basicConfiguration.webSiteClose==0">
														<input type="radio" name="basicConfiguration.webSiteClose"
															value="0" checked="checked" />打开<input type="radio"
															name="basicConfiguration.webSiteClose" value="1" />关闭<span
															class="red"> *</span>
													</s:if> <!-- 如果获取网站的状态是关闭的，就选择关闭按钮 --> <s:else>
														<input type="radio" name="basicConfiguration.webSiteClose"
															value="0" />打开<input type="radio"
															name="basicConfiguration.webSiteClose" value="1"
															checked="checked" />关闭<span class="red"> *</span>
													</s:else>
												</td>
											</tr>
											<tr>
												<td nowrap height="120px"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>网站关闭原因:</b>
													<p>网站关闭时出现的提示信息</p></td>
												<td colspan="3"
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><textarea
														id="textarea" name="basicConfiguration.closeWebSiteReason"
														rows="5" cols="80"
														style="resize:none;overflow-x:hidden;overflow-y:hidden;"><s:property
															value="basicConfiguration.closeWebSiteReason" /></textarea></td>
											</tr>
										</table>
										<br />
									</fieldset>
								</TD>
							</TR>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" height="50px"><input
						type="submit" name="Submit" value="保存"
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
						onclick="window.history.go(-1);" /></TD>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
