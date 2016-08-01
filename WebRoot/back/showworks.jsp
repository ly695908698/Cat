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
<title>查询所有的作品</title>
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
</head>
<SCRIPT language=JavaScript>
	//跳转到添加菜单的页面
	function link() {
		window.location = "findAlbumsForUploadAction";
	}
	//删除所有的菜单的事件
	function delAll() {
		//通过调用getSelectCheckboxValues方法来获取所有的要删除的菜单，是一个数组
		menuIds = getSelectCheckboxValues();
		if (confirm("确认删除所有的菜单吗？")) {
			//判断要选择删除的菜单项的个数是不是为空
			if (menuIds != null && menuIds != "") {
				location.href = "deleteAllMenusAction?menuIds=" + menuIds;
			} else {
				alert("请至少选择一行！");
			}
		}
	}
	//删除单个的菜单的事件
	function del(workId, albumId) {
		if (confirm("确认删除相片吗？")) {
			location.href = "deleteWorksAction?workId=" + workId + "&&albumId="
					+ albumId;
		}
	}
</SCRIPT>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="background-color: white;">

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
			<th class="tablestyle_title">相册中作品详细信息列表</th>
		</tr>
		<tr>
			<td><table id="subtree1" style="DISPLAY: " width="100%"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="left" style="padding-left:10px;padding-top:10px;">当前位置：作品管理
							--&gt;&gt;管理相册--&gt;&gt;查看相册下面的作品</td>
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
										value="添加作品" onclick="link();" /></td>
								</tr>
								<tr>
									<td height="40" class="font42">
										<table width="80%" border="0" cellpadding="4" cellspacing="1"
											bgcolor="#464646" class="newfont03">
											<tr class="CTitle">
												<td height="22" colspan="10" align="center"
													style="font-size:16px">相册中作品详细信息列表</td>
											</tr>
											<tr bgcolor="#EEEEEE">
												<td width="5%">作品编号</td>
												<td width="5%">作品预览</td>
												<td width="5%">作品名称</td>
												<td width="5%">作品创建时间</td>
												<td width="5%">作品被赞次数</td>
												<td width="5%">作品类型</td>
												<td width="5%">作品描述</td>
												<td width="5%">操作</td>
											</tr>
											<%--如果相册有照片信息显示，没有信息不显示 --%>
											<s:if test="works.isEmpty()||works==null">
												<tr bgcolor="#ffffff">
													<td colspan="10" align="center">没有照片信息!!!</td>
												</tr>
											</s:if>
											<s:else>
												<s:iterator value="works" var="work">
													<tr bgcolor="#FFFFFF">
														<td><a href="listmokuaimingxi.htm" onclick=""></a> <s:property
																value="#work.workId" /></td>
														<td><img
															src="thumbs/<s:property value="#work.workSrc"/>" alt=""
															width="50px" height="50px" /></td>
														<td><s:property value="#work.workName" /></td>
														<td><s:property value="#work.workUploadDate" /></td>
														<td><s:property value="#work.workPraiseCount" /></td>
														<td><s:property value="#work.workType" /></td>
														<td><s:if
																test='#work.workDescription==null||#work.workDescription==""'>
															无描述信息
														</s:if> <s:else>
																<s:property value="#work.workDescription" />
															</s:else></td>
														<td><a
															href="findWorksByIdForUpdateAction?workId=<s:property value="#work.workId"/>&&albumId=<s:property value="albumId"/>">修改</a>
															<a
															href="javascript:del(<s:property value="#work.workId"/>,<s:property value="albumId"/>)">删除</a>
														</td>
													</tr>
												</s:iterator>
											</s:else>
										</table>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>

	<!-- 分页 -->
	<div style="margin-left:500px;">
		共 <span class="right-text09"><s:property value="pageAll" /> </span>
		页| 第 <span class="right-text09"><s:property value="pageNow" />
		</span> 页 [ <a href="findWorksByAlbumIdAction?pageNow=1&&albumId=<s:property value="albumId"/>" class="right-font08">首页</a> |
		<a
			href="findWorksByAlbumIdAction?pageNow=<s:property value="pageNow-1==0?1:pageNow-1"/>&&albumId=<s:property value="albumId"/>"
			class="right-font08">上一页</a> |
		<s:if test="pageNow+1<=pageAll">
			<a href="findWorksByAlbumIdAction?pageNow=<s:property value="pageNow+1"/>&&albumId=<s:property value="albumId"/>"
				class="right-font08">下一页</a>
		</s:if>
		<s:else>
			<a href="findWorksByAlbumIdAction?pageNow=<s:property value="pageAll"/>&&albumId=<s:property value="albumId"/>"
				class="right-font08">下一页</a>
		</s:else>
		| <a href="findWorksByAlbumIdAction?pageNow=<s:property value="pageAll"/>&&albumId=<s:property value="albumId"/>"
			class="right-font08">末页</a>]
	</div>

</body>
</html>
