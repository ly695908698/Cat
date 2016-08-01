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
<title>查询所有的留言</title>
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
	//选中所有的菜单项目
	function selectAll() {
		var obj = document.fom.elements;
		for (var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				obj[i].checked = true;
			}
		}
	}
	//全不选中所有的菜单的项目
	function unselectAll() {
		var obj = document.fom.elements;
		for (var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}

	//删除所有的菜单的事件
	function delAll() {
		//通过调用getSelectCheckboxValues方法来获取所有的要删除的菜单，是一个数组
		menuIds = getSelectCheckboxValues();
		if (confirm("确认删除所有的留言信息吗？删除后留言下面的回复也会删除！")) {
			//判断要选择删除的菜单项的个数是不是为空
			if (menuIds != null && menuIds != "") {
				location.href = "deleteAllLeaveMessageAction?menuIds="
						+ menuIds;
			} else {
				alert("请至少选择一行！");
			}
		}
	}
	//删除单个的菜单的事件
	function del(leaveMessageId) {
		if (confirm("确认删除留言吗？删除后留言下面的回复也会删除！")) {
			location.href = "deleteLeaveMessageAction?leaveMessageId="
					+ leaveMessageId;
		}
	}
	//选中id,组成的字符串
	function getSelectCheckboxValues() {
		//获取名称为delid的checkbox,形成数组
		var objArray = document.getElementsByName('delid');
		//定义返回结果
		var result = '';
		for (var i = 0; i < objArray.length; i++) {
			//如果名称为ck的checkbox被选中了，就进行id拼接
			if (objArray[i].checked == true) {
				result += objArray[i].value + ",";
			}
		}
		//返回拼接结果,之所以截取到 result.length-1，因为result结果最后一个字符是,
		return result.substring(0, result.length - 1);
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
				<th class="tablestyle_title">查看所有的留言</th>
			</tr>
			<tr>
				<td style="padding-left:10px;padding-top:10px;">当前位置：留言管理
					--&gt;&gt;查询所有留言</td>
			</tr>
			<tr>
				<td><table width="95%" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td height="40"><span class="newfont07">选择：<a
									href="#" class="right-font08" onclick="selectAll();">全选</a>-<a
									href="#" class="right-font08" onclick="unselectAll();">反选</a>
							</span> <a href="#" class="right-font08" onclick="delAll();">删除所选留言</a>
							</td>
						</tr>
						<tr>
							<td height="40" class="font42">
								<table width="80%" border="0" cellpadding="4" cellspacing="1"
									bgcolor="#464646" class="newfont03">
									<tr class="CTitle">
										<td height="22" colspan="6" align="center"
											style="font-size:16px">留言详细信息列表</td>
									</tr>
									<tr bgcolor="#EEEEEE">
										<td width="4%" align="center" height="10">选择</td>
										<td width="5%">楼层</td>
										<td width="5%">留言者</td>
										<td width="5%">留言的日期</td>
									<!-- 	<td width="5%">留言内容</td> -->
										<td width="5%">操作</td>
									</tr>
									<%--如果相册有信息显示，没有信息不显示 --%>
									<s:if test="leaveMessages.isEmpty()||leaveMessages==null">
										<tr bgcolor="#ffffff">
											<td colspan="8" align="center">没有留言信息!!!</td>
										</tr>
									</s:if>
									<s:else>
										<s:iterator value="leaveMessages" var="leaveMessage" status="st">
											<tr bgcolor="#FFFFFF">
												<td height="5px"><input type="checkbox" name="delid"
													value="<s:property
																value="#leaveMessage.leaveMessageId" />" />
												</td>
												<td><a href="listmokuaimingxi.htm" onclick=""></a>${floor-st.index}楼</td>

												<td><s:property value="#leaveMessage.leaveMessageName" /></td>
												<td><s:date format="yyyy-MM-dd HH:mm:ss"
														name="#leaveMessage.leaveMessageDate" /></td>
												<%-- <td><s:property
														value="#leaveMessage.leaveMessageContent" escape="false" /></td>--%>
												<td> <a
													href="javascript:del(<s:property value="#leaveMessage.leaveMessageId"/>)">删除</a>
													<a
													href="findLeaveMessageReplyByLeaveMessageIdAction?leaveMessageId=<s:property value="#leaveMessage.leaveMessageId"/>">回复</a>
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
		</span> 页 [ <a href="findLeaveMessageAction?pageNow=1" class="right-font08">首页</a>
		| <a
			href="findLeaveMessageAction?pageNow=<s:property value="pageNow-1==0?1:pageNow-1"/>"
			class="right-font08">上一页</a> |
		<s:if test="pageNow+1<=pageAll">
			<a
				href="findLeaveMessageAction?pageNow=<s:property value="pageNow+1"/>"
				class="right-font08">下一页</a>
		</s:if>
		<s:else>
			<a
				href="findLeaveMessageAction?pageNow=<s:property value="pageAll"/>"
				class="right-font08">下一页</a>
		</s:else>
		| <a
			href="findLeaveMessageAction?pageNow=<s:property value="pageAll"/>"
			class="right-font08">末页</a>]
	</div>
</body>
</html>
