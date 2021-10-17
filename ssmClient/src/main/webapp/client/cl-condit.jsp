<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>

<html>
<head>
<title>订单计划 </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/css/xadmin/datasheet.css" />
<link rel="stylesheet" href="<%=path%>/css/xadmin/page.css" />
</head>
<body>
<div class="article">      
    <div class="title ue-clear">
    	<h2>客户信息管理  &nbsp;--->&nbsp;跟进计划</h2>
    	<a href="<%=path%>/khhui/${record.id}/add" class="add" title="计划添加"></a>
    	
    	<i class="more"></i>
</div>
</div>
<div class="scedit" >
  <ul class="li">
  <li class="wdh-49"><span>客户姓名:</span><b>${record.kuhuname}</b></li>
  <li class="wdh-49"><span>客户电话:</span><b>${record.kehutel}</b></li>
  <li class="wdh-49"><span>客户等级:</span><b>${record.kehulei}</b></li>
  <li class="wdh-49"><span>情况:</span><b>${record.kehugenre}</b></li>
  </ul >
  </div>


<table id="tb_1" class="yxtable">
   <thead>
	<tr>
		<th scope="row" class="wdh60">生成时间</th>
		<th scope="row" class="wdh50">跟进问题</th>
		<th scope="row" class="wdh100">跟进结果</th>
		<th scope="row" class="wdh50">跟进时间</th>
		<th scope="row" class="wdh50">跟进负责人</th>
		<th scope="row" class="wdh50">预计跟进时间</th>
		<th scope="row" class="wdh50">操作</th>
	</tr>
  </thead>
  <tbody>
	<c:forEach var="data" items="${all}">
<form action="<%=path%>/khhui/update" name="crm"  method="post" >

	<tr class="mouse">	
	<input type="hidden" name="id" value="${data.id}"/>
	<input type="hidden" name="jiename" value="${data.jiename}"/>
	<input type="hidden" name="jieday" value="${data.jieday}"/>
	<input type="hidden" name="inid" value="${data.inid}"/>
	<td>${data.scday}</td>
	<td><input name="wenti"class="h-inp" value="${data.wenti}"/></td>
	<td><input name="jieguo"class="h-inp" value="${data.jieguo}"/></td>
	<td>${data.jieday}</td>
	<td>${data.jiename}</td>
	<td>${data.yuday}</td>
	<td><input type="submit" class="tabe_btn" value="确认">
	 <a href="<%=path %>/khhui/${data.id}/del" onclick="return del()" title="删除" class="ico-del"></a></td>
	</tr>
</form>
	</c:forEach>
	</tbody>
	</table>

</body>
</html>