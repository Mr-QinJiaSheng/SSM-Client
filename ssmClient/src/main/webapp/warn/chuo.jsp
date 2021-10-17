<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="<%=path%>/script/common.js"></script>
</head>
<body>
<div class="button_bar">

	<button class="common_button" onClick="back();"><h2>返回</h2></button>  
</div>
<h1>该订单已有商品已发货无法退回，如有需要请联系管理员</h1>
</body>
</html>