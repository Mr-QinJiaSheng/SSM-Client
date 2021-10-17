<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>人员管理</title>
<link rel="stylesheet" href="<%=path%>/css/xadmin/page.css" />
<link rel="stylesheet" href="<%=path%>/css/xadmin/datasheet.css" />
</head>
<body>
<div class="article">      
<div class="title ue-clear">
    	<h2>人员管理&nbsp;--&gt;&nbsp;人员信息编辑</h2>
		<a class="more"></a>
    </div>
    
    <div class="adds">
    <form action="<%=path%>/yhrole/updates" name="frm" method="post" target="_parent">
    <input type="hidden"  name="id"  value="${record.id }"/>
    <input type="hidden"  name="like"  value="${like}"/>
    <div class="add-s">
    <div class="bot-rk">
    <ul>
    <li><span>姓名:</span><input class="inp" type="text" name="empname" value="${record.empname}" ></li>
    <li><span>职位:</span><select class="inp" name="roleid"><c:forEach var="roles" items="${role}"><option  ${roles.id eq record.roleid?'selected':''}  value="${roles.id}">${roles.rolename}</option></c:forEach></select></li>
    <li><span>电话:</span><input class="inp" type="text" name="tel" value="${record.tel}" ></li>
    <li><span>密码:</span><input class="inp"type="text" name="pass" value="" ></li>
    <li><input type="reset" value="重置" class="buttoms-rk"></li>
    <li><input type="submit" value="提交" class="buttom-rk"></li>
    </ul>
    </div>
    </div> 
    </form>
    </div>
    
    
    
    
  </div>  
</body>
</html>