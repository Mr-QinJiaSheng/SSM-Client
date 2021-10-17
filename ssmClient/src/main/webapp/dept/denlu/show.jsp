<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>一新项目</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/css.css" type="text/css" rel="stylesheet" />
<link href="<%=path%>/css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="<%=path%>/images/main/favicon.ico" />
<script src="<%=path%>/script/common.js"></script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(<%=path%>/images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(<%=path%>/images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:14px; background:url(<%=path%>/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:14px; line-height:40px;}
#main-tab td a{ font-size:14px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
</head>
<body>
<div class="page_title">登录管理 &gt; 登录显示</div>

<!--main_top-->
<form action="<%=path%>/log/like" name="frm"  method="post">
<table class="query_form_table">
	<tr>
		<th>登录人</th>
		<td><input  name="account" size="20" /></td>
		<th>登录时间</th>
		<td><input name="exitTime" size="20" />		
		<th>下线时间</th>
		<td><input name="onlineTime" size="20" />
		</td>
	</tr>
	<input type="submit" value="查询">	
</table>
</form>
<br/>

<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td align="left" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">姓名&nbsp;</th>
        <th align="center" valign="middle" class="borderright">职位&nbsp;</th>
        <th align="center" valign="middle" class="borderright">登录时间&nbsp;</th> 
		<th align="center" valign="middle" class="borderright">下线时间 &nbsp;</th>     
        
    
      </tr>
      <c:forEach var="data" items="${pager.data}">
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="center" valign="middle" class="borderright borderbottom">${data.account}&nbsp;</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${data.position}&nbsp;</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${data.onlineTime}&nbsp;</td>
			<td align="center" valign="middle" class="borderright borderbottom">${data.exitTime}&nbsp;</td>
	       
	      </tr>
     </c:forEach>
<tr bgcolor="#E7E7E7">
			<th height="14" colspan="18" background="<%=path%>/images/tbg.gif" align="center">
			  ${pager.pageDisplay}	
		    </th>
		</tr>
    </table></td>
    </tr>

</table>
</body>
</html>
