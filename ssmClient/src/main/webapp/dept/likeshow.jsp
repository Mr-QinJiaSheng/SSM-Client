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
    	<a href="<%=path%>/yhrole/show" class="return" title="返回上一级"></a>
    	<a onclick="xadmin.open('添加','<%=path%>/yhrole/doadd',380,350)"><i class="add"></i></a>
    </div>
</div>
   <div class="query">
      <form action="<%=path%>/yhrole/like?lk==like" name="frm"  method="post">
        <span class="span-cx">请输入对应条件查询：</span>
        <input type="text" placeholder="请输入姓名"  name="empname" value="${empname}"autocomplete="off">
        <input type="text" placeholder="职位"  name="rolename" value="${rolename}">
        <input type="text"  placeholder="电话号码"  name="tel" value="${tel}"/>
        <button class="tabe_btn " name="submit"  type="submit">查询</button>
      </form> 
   </div>
   
   
    <table id="tb_1"class="yxtable">
     <thead>
       <tr>
          <th scope="col" class="wdh100">姓名</th>
          <th scope="col" class="wdh100">职位</th> 
		  <th scope="col" class="wdh100">电话号码 </th>     
          <th scope="col" class="wdh50">操作</th>
      </tr>
     </thead>
     <tbody>
      <c:forEach var="data" items="${pager.data}">
	      <tr class="mouse high">
	        <td>${data.empname}</td>
	        <td>${data.yhrole.rolename}</td>
			<td>${data.tel}</td>
	        <td>
	           <a onclick="xadmin.open('编辑','<%=path%>/yhrole/${data.id}/loads?like==loads',380,350)" class="ico-edit" title="编辑"></a>
	           <a href="<%=path%>/yhrole/${data.id}/del?like==del"onclick="return del()" class="ico-del" title="删除"></a></td>
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
