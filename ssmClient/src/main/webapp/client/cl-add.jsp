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
<title>客户关系管理系统</title>
<link rel="stylesheet" href="<%=path%>/css/xadmin/page.css" />
</head>
<body>
<div class="article">
<div class="title" id="showNotice">
     <h2>客户信息-->添加</h2>
</div>
</div>
<div class="adds">
<form action="<%=path%>/khclient/add" name="frm"  method="post" target="_parent" >
      <div class="add-s">
     
      <ul class="li">
      <li><span>客户名:</span><input type="text" name="kuhuname" class="inp"></li>
      <li><span>电话:</span><input type="text" name="kehutel" class="inp"></li>
      <li><span>区域:</span><input type="text" name="qu" class="inp"></li>
      <li><span>地址:</span><input type="text" name="kehuaddres" class="inp"></li>
      <li><span>类别:</span>
      <select name="kehulei" class="inp">
		<option>D:6个月以上交房客户</option>
		<option>C:3-6交房客户</option>
		<option>B:3个月内交房客户</option>
		<option>A:已交房客户</option>
		</select>
     </li>
      <li><span>房屋情况:</span>
       <select name="kehugenre" class="inp">
		<option>精装</option>
		<option>毛坯</option>
		</select>
		</li>
		 <li><span>装修情况:</span>
       <select name="an" class="inp">
		<option>全包</option>
		<option>半包</option>
		<option>自装</option>
		</select>
		</li>
	  <li><span>开工时间:</span><input type="text" name="kaiday" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="inp"></li>
      <li><span>微信:</span>
       <select name="weixin" class="inp">
       <option>否</option>
		<option>是</option>
		
		</select></li>
	<li><span>渠道来源:</span>
       <select name="channel" class="inp">
		<option>抖音</option>
		<option>淘宝</option>
		<option>官网</option>
		<option>400电话</option>
		<option>大众点评</option>
		<option>美团</option>
		<option>公众号</option>
		<option>小红书</option>
		<option>京东</option>
		<option>百度</option>
		<option>其他</option>
	</select></li>	
      <li><span>客户需求:</span><input type="text" name="xu" class="inp"></li>
      <li><span>客户情况:</span><input type="text" name="khremark" class="inp"></li>
      <li><span>房屋面积:</span><input type="text" name="size" class="inp"></li>
      <li><span>预计价格:</span><input type="text" name="yumoney" class="inp"></li>
      <li><span>接待人:</span><input type="text" name="jiename" class="inp"></li>
       <li></li>
      </ul><ul class="lis">
       <li><input type="submit" value="提交" class="buttom-rk"></li>
      <li><input type="reset" value="重置" class="buttoms-rk"></li>
      
     
      
      </ul>
    
      </div>
  </form>
  </div>
  <script type="text/javascript" src="<%=path%>/script/My97DatePicker/WdatePicker.js"></script> 
</body>
</html>