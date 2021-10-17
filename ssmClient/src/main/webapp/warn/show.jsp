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
    	<h2>人员管理&nbsp;--&gt;&nbsp;人员显示</h2>
    	<a href="<%=path%>/yhrole/jadd" class="add" title="添加"></a>
    </div>
</div>
    <table id="tb_1" class="yxtable">
    <thead>
      <tr>
        <th scope="col" class="wdh50">编号</th>
        <th scope="col" class="wdh100">角色名称</th>      
        <th scope="col" class="wdh50">操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="datas" items="${all}">
	      <tr class="mouse">
	        <td >${datas.id}</td>
	        <td >${datas.rolename}</td>
	        <td ><a onclick="xadmin.open('编辑','<%=path%>/yhrole/${datas.id}/jload',380,300)" class="ico-edit"title="编辑"></a>
	           <a href="<%=path%>/yhrole/${datas.id}/jdel" onclick="return del()" class="ico-del" title="删除"></a></td>
	      </tr>
     </c:forEach>
     </tbody>
    </table>
    <div class="pagers"></div>
    <div class="pager">${pager.pageDisplay}</div>
    
    
    
<script src="<%=path%>/layui/layui.js" charset="utf-8"></script>
<script src="<%=path%>/js/xadmin/common.js"></script> 
<script src="<%=path%>/js/xadmin/xadmin.js"></script> 
<script type="text/javascript" src="<%=path %>/js/xadmin/campaign.js"></script>
</body>
</html>