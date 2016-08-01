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
<title>回复留言信息</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<%--验证信息 --%>
<script language="JavaScript" type="text/javascript"
	src="validate/validateadduserdetailsjsp.js"></script>
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
	padding: 5px;
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
<script language="JavaScript" type="text/javascript"
	src="validate/validateadduserdetailsjsp.js"></script>
<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create(
				'textarea[name="leaveMessageReply.leaveMessageReplyContent"]',
				{
					resizeType : 0,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [ 'fontname', 'fontsize', '|', 'forecolor',
							'hilitecolor', 'bold', 'italic', 'underline',
							'removeformat', '|', 'emoticons' ]
				});
	});
</script>
</head>

<body class="ContentBody" style="background: transparent;">
	<form action="addLeaveMessageReplyAction" method="post"
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
					<th class="tablestyle_title">回复留言信息</th>
				</tr>
				<tr>
					<td class="CPanel">
						<table border="0" cellpadding="0" cellspacing="0"
							style="width:100%">
							<tr>
								<td align="left">当前位置：留言信息管理 --&gt;&gt;回复留言信息</td>
							</tr>

							<TR>
								<TD width="100%">
									<fieldset style="height:100%;">
										<legend>回复留言信息</legend>
										<table border="1" cellpadding="2" cellspacing="0"
											style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;">

											<tr style="border:none;">
												<td nowrap
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;"><b>回复者名称:</b>
													<p>回复者名称，回复留言的人。</p><p>不填写默认为主人留言。</p></td>
												<td
													style="width:100%;border-top:none;border-left:none;border-right:none;border-bottom:none;position:relative;left:-160px;">
													<input type="text"
													name="leaveMessageReply.leaveMessageReplyName"
													value="<s:property value="leaveMessageReply.leaveMessageReplyName"/>" />
													<input type="hidden"
													name="leaveMessageReply.leaveMessage.leaveMessageId"
													value="<s:property value="leaveMessageId"/>" /> <input
													type="hidden" name="leaveMessageId"
													value="<s:property value="leaveMessageId"/>" />
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>回复的日期:</b>
													<p>回复的日期，回复留言的日期。</p></td>
												<td
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;">
													<input type="text" disabled="disabled"
													value="<s:date name="leaveMessageReply.leaveMessageReplyDate"  format="yyyy-MM-dd HH:mm:ss" />" />
													<input type="hidden"
													name="leaveMessageReply.leaveMessageReplyId"
													value="<s:property value="leaveMessageReply.leaveMessageReplyId"/>" />
												</td>
											</tr>
											<tr style="border:none;">
												<td nowrap
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1"><b>回复留言:</b>
													<p>回复留言，回复的留言信息。</p></td>
												<td
													style="border-top:none;border-left:none;border-right:none;border-bottom-color:#BBDCF1;position:relative;left:-160px;">
													<textarea rows="5" cols="80"
														name="leaveMessageReply.leaveMessageReplyContent"><s:property
															value="leaveMessageReply.leaveMessageReplyContent" /></textarea>
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
				<tr>
					<td colspan="2" align="center" height="50px"><input
						type="submit" name="Submit" value="回复/更新"
						style="font-family: Verdana, Arial, sans-serif;
						-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
background: #459300 url('resources/images/bg-button-green.gif') top left repeat-x !important;
border: 1px solid #459300 !important;
padding: 4px 7px 4px 7px !important;
color: #fff !important;
font-size: 11px !important;
cursor: pointer;" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
