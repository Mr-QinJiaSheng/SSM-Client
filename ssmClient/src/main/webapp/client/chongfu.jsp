<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<%
	String path = request.getContextPath();
%>
<head>
 
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
<title>错误</title>
 <link rel="stylesheet" href="<%=path%>/layui/layui/css/layui.css">
 <link rel="stylesheet" href="<%=path%>/css/xadmin/error.css">
 <script src="<%=path%>/layui/layui/layui.js" charset="utf-8"></script>
 <script type="text/javascript" src="<%=path%>/js/xadmin/xadmin.js"></script>
 <script src="<%=path%>/script/common.js"></script>
</head>
 
<body>
 
   	<div class="errors"><img alt="" src="<%=path%>/images/xadmin/404.png"></div>
   	<div class="error">
   	  <ul> 
   	  <li><span class="bq">非常抱歉!</span></li>
   	  <li>您添加的客户已存在，添加人《${all}》</li>
   	
   	  </ul>
    </div>
</body>
</html>