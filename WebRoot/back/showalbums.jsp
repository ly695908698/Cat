<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>查询所有的相册</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.tabfont01 {
	font-family: "����";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}

.font051 {
	font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}

.font201 {
	font-family: "����";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

.button {
	font-family: "����";
	font-size: 14px;
	height: 37px;
}

html {
	overflow-x: auto;
	overflow-y: auto;
	border: 0;
}
-->
</style>

<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
	
</script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	//跳转到添加菜单的页面
	function link() {
		window.location = "addalbum.jsp";
	}
	//删除单个的菜单的事件
	function del(albumId) {
		if (confirm("确认删除菜单吗？")) {
			location.href = "deleteAlbumAction?albumId=" + albumId;
		}
	}
</script>
</head>


<body>
	<form name="fom" id="fom" method="post" action="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="background-color:white;">

			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="62"
								style="background: url('resources/images/bg.gif');">

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
				<th class="tablestyle_title">查看所有的相册</th>
			</tr>
			<tr>
				<td style="padding-left:10px;padding-top:10px;">当前位置：作品管理
					--&gt;&gt;管理相册</td>
			</tr>
			<tr>
				<td><table width="95%" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td height="40"><input name="Submit2" type="button"
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
								value="添加相册" onclick="link();" /></td>
						</tr>
						<tr>
							<td height="40" class="font42">
								<table width="80%" border="0" cellpadding="4" cellspacing="1"
									bgcolor="#464646" class="newfont03">
									<tr class="CTitle">
										<td height="22" colspan="8" align="center"
											style="font-size:16px">相册详细信息列表</td>
									</tr>
									<tr bgcolor="#EEEEEE">
										<td width="5%">相册编号</td>
										<td width="5%">相册封面</td>
										<td width="5%">相册名称</td>
										<td width="5%">相册创建时间</td>
										<td width="5%">相册状态</td>
										<td width="5%">相册描述</td>
										<td width="5%">操作</td>
									</tr>
									<%--如果相册有信息显示，没有信息不显示 --%>
									<s:if test="albumsList.isEmpty()||albumsList.isEmpty()">
										<tr bgcolor="#ffffff">
											<td colspan="8" align="center">没有相册信息!!!</td>
										</tr>
									</s:if>
									<s:else>
										<s:iterator value="albumsList" var="album">
											<tr bgcolor="#FFFFFF">
												<td><a href="listmokuaimingxi.htm" onclick=""></a> <s:property
														value="#album.albumId" /></td>

												<td><img
													src="thumbs/<s:property value="#album.albumCover"/>" alt=""
													width="50px" height="50px" /></td>
												<td><s:property value="#album.albumName" /></td>
												<td><s:date name="#album.albumCreateTime"
														format="yyyy:MM:dd HH:mm:ss" /></td>
												<td><s:if test="#album.albumStatus==1">
																		显示
														</s:if> <s:else>
																	   不显示
														</s:else></td>
												<td><s:if
														test='#album.albumDescription==null||#album.albumDescription==""'>
															无描述信息
														</s:if> <s:else>
														<s:property value="#album.albumDescription" />
													</s:else></td>
												<td><a
													href="findAlbumByIdAction?albumId=<s:property value="#album.albumId"/>">修改</a>
													<a
													href="javascript:del(<s:property value="#album.albumId"/>)">删除</a>
													<a
													href="findWorksByAlbumIdAction?albumId=<s:property value="#album.albumId"/>">查看</a>
												</td>
											</tr>
										</s:iterator>
									</s:else>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
	<!-- 分页 -->
	<div style="margin-left:500px;">
		共 <span class="right-text09"><s:property value="pageAll" /> </span>
		页| 第 <span class="right-text09"><s:property value="pageNow" />
		</span> 页 [ <a href="findAlbumsAction?pageNow=1" class="right-font08">首页</a>
		| <a
			href="findAlbumsAction?pageNow=<s:property value="pageNow-1==0?1:pageNow-1"/>"
			class="right-font08">上一页</a> |
		<s:if test="pageNow+1<=pageAll">
			<a href="findAlbumsAction?pageNow=<s:property value="pageNow+1"/>"
				class="right-font08">下一页</a>
		</s:if>
		<s:else>
			<a href="findAlbumsAction?pageNow=<s:property value="pageAll"/>"
				class="right-font08">下一页</a>
		</s:else>
		| <a href="findAlbumsAction?pageNow=<s:property value="pageAll"/>"
			class="right-font08">末页</a>]
	</div>
</body>
</html>
