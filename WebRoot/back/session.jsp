<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme() + "://"
   + request.getServerName() + ":" + request.getServerPort()
   + path + "/";
%>
<%--session过期时跳出iframe的过渡页面 --%>
<html>
 <head>
  <script type="text/javascript">
   window.top.location.href="<%=basePath%>back/login.jsp";
  </script>
 </head>
</html>