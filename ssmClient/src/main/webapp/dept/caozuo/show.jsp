<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit"/>
<meta name="force-rendering" content="webkit"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
<title>一新项目</title>
<link rel="stylesheet" href="<%=path%>/css/xadmin/page.css" />
<link rel="stylesheet" href="<%=path%>/css/xadmin/datasheet.css" />
</head>
<body>
<div class="article">      
    <div class="title" id="showNotice">
    	<h2>登录管理&nbsp;--&gt;&nbsp;个人操作记录显示</h2>
    </div>
    
  <%--  <div class="query">
      <form action="<%=path%>/log/like?lk=lk" name="frm"  method="post">
        <span class="span-cx">请输入对应条件查询：</span>
        <input type="text" placeholder="请输入登录人..."  name="account" value="${account}"autocomplete="off">
        <input type="text" placeholder="登录时间..."  name="onlineTime" value="${onlineTime}">
        <input type="text"  placeholder="下线时间..."  name="exitTime" value="${exitTime}"/>
        <button class="tabe_btn " name="submit"  type="submit">查询</button>
      </form> 
   </div> --%>
  </div> 

   <table id="tb_1" class="yxtable">
    <thead>
      <tr>
        <th scope="col" class="wdh80">姓名</th>
        <th scope="col" class="wdh80">操作时间</th>
        <th scope="col" class="wdh80">类别</th> 
		<th scope="col" class="wdh80">表 </th> 
		<th scope="col" class="wdh80">信息 </th>    
      </tr>
     </thead>
     <tbody>
      <c:forEach var="data" items="${pager.data}">
	    <tr class="mouse high">
	       <td >${data.loname}</td>
	       <td >${data.day}</td>
	       <td >${data.lei}</td>
	       <td >${data.biao}</td>
		   <td >${data.biaoid}</td>
	     </tr>
     </c:forEach>
      </tbody>   
    </table>
    <div class="pager">${pager.pageDisplay}</div>
<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/layui/layui.js"></script>
<script src="<%=path%>/js/xadmin/xadmin.js"></script>
<script src="<%=path%>/js/xadmin/campaign.js"></script>
</body>
</html>
