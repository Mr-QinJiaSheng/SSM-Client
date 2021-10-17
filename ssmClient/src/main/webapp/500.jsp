<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<%
	String path = request.getContextPath();
%>
<head>
 
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>500-抱歉!功能暂不可用</title>
 <link rel="stylesheet" href="<%=path%>/layui/layui/css/layui.css">
 <link rel="stylesheet" href="<%=path%>/css/xadmin/error.css">
 <script src="<%=path%>/layui/layui/layui.js" charset="utf-8"></script>
 <script type="text/javascript" src="<%=path%>/js/xadmin/xadmin.js"></script>
 <script src="<%=path%>/script/common.js"></script>
</head>
 
<body>
 
   	<div class="errors"><img  src="<%=path%>/images/xadmin/500.png"></div>
   	<div class="error">
   	  <ul> 
   	  <li><span class="bq">非常抱歉!</span></li>
   	  <li>数据访问错误<span class="bq">500</span></li>
   	  <li>请点击浏览器反击返回上一级或者关闭当前页面</li>
   	  <li>联系<span class="help">管理员</span></li>
   	 
   	  </ul>
    </div>
</body>
</html>