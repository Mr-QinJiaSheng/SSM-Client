<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>

<html>
<head>
<title>一新项目</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/css/xadmin/page.css" />
<link rel="stylesheet" href="<%=path%>/css/xadmin/datasheet.css" />
</head>
<body>
<div class="article">      
    <div class="title ue-clear"id="showNotice" >
    	<h2>客户信息 &nbsp;--->&nbsp;编辑</h2>
    	<i class="more"></i>
</div> 
</div>

<div class="adds">
<form action="<%=path%>/khclient/update" name="frm"  method="post" target="_parent" >
      <input type="hidden" name="id"  value="${record.id}" />
       <input type="hidden" name="like"  value="${like}" />
      <div class="add-s">
      
      <ul class="li">
      <li><span>客户名:</span><input type="text" name="kuhuname" value="${record.kuhuname}"class="inp"></li>
      <li><span>电话:</span><input type="text" name="kehutel"value="${record.kehutel}" class="inp"></li>
      <li><span>区域:</span><input type="text" name="qu" value="${record.qu}" class="inp"></li>
      <li><span>地址:</span><input type="text" name="kehuaddres" value="${record.kehuaddres}" class="inp"></li>
      <li><span>类别:</span>
         <select name="kehulei" class="inp">
           <option > </option>
             <option ${"A:已交房客户" eq record.kehulei?"selected":""} >A:已交房客户</option>
             <option ${"B:3个月内交房客户" eq record.kehulei?"selected":""}>B:3个月内交房客户</option>
             <option ${"C:3-6交房客户" eq record.kehulei?"selected":""} >C:3-6交房客户</option>
             <option ${"D:6个月以上交房客户" eq record.kehulei?"selected":""} >D:6个月以上交房客户</option>     
          </select>
      </li>
      <li><span id="size13">房屋情况:</span>
       <select name="kehugenre" class="inp">
           <option > </option>
             <option ${"精装" eq record.kehugenre?"selected":""}>精装</option>
             <option ${"毛坯" eq record.kehugenre?"selected":""}>毛坯</option>
                
          </select>
    </li>
     <li><span>装修情况:</span>
       <select name="an" class="inp">
		<option></option>
		<option ${"全包" eq record.an?"selected":""}>全包</option>
		<option ${"半包" eq record.an?"selected":""}>半包</option>
		<option ${"自装" eq record.an?"selected":""}>自装</option>
		
		</select>
		</li>
     <li><span>开工时间:</span><input type="text" name="kaiday"value="${record.kaiday}" class="inp"></li>
   <li><span>微信:</span>
      <select name="weixin" class="inp">
           <option > </option>
             <option ${"是" eq record.weixin?"selected":""}>是</option>
             <option ${"否" eq record.weixin?"selected":""}>否</option>               
          </select>    
    </li>
    <li><span>渠道:</span>
      <select name="channel" class="inp">
           <option > </option>
             <option ${"抖音" eq record.channel?"selected":""}>抖音</option>
             <option ${"淘宝" eq record.channel?"selected":""}>淘宝</option>  
             <option ${"官网" eq record.channel?"selected":""}>官网</option>
             <option ${"400电话" eq record.channel?"selected":""}>400电话</option>
             <option ${"大众点评" eq record.channel?"selected":""}>大众点评</option>
             <option ${"美团" eq record.channel?"selected":""}>美团</option>        
             <option ${"公众号" eq record.channel?"selected":""}>公众号</option>
             <option ${"小红书" eq record.channel?"selected":""}>小红书</option>            
             <option ${"京东" eq record.channel?"selected":""}>京东</option>
             <option ${"百度" eq record.channel?"selected":""}>百度</option>
             <option ${"其他" eq record.channel?"selected":""}>其他</option>                                  
          </select>    
    </li>
    <li><span>状态:</span>
      <select name="khstate" class="inp">
           <option > </option>
             <option ${"丢失" eq record.khstate?"selected":""}>丢失</option>
             <option ${"未到访" eq record.khstate?"selected":""}>未到访</option>  
             <option ${"到访" eq record.khstate?"selected":""}>到访</option> 
             <option ${"免量" eq record.khstate?"selected":""}>免量</option> 
             <option ${"订单" eq record.khstate?"selected":""}>订单</option>                                           
          </select>    
    </li>
      <li><span>客户需求:</span><input type="text" name="xu"value="${record.xu}" class="inp"></li>
      <li><span>客户备注:</span><input type="text" name="khremark"value="${record.khremark}" class="inp"></li>
      <li><span>房屋面积:</span><input type="text" name="size" value="${record.size}" class="inp"></li>
      <li><span>预计价格:</span><input type="text" name="yumoney" value="${record.yumoney}" class="inp"></li>
      <li><span>接待人:</span><input type="text" name="jiename" value="${record.jiename}" class="inp"></li>
      <li></li>
      </ul><ul class="lis">
       <li><input type="submit" value="提交" class="buttom-rk"></li>
      <li><input type="reset" value="重置" class="buttoms-rk"></li>
     
      </ul>

      </div>
  </form>
  </div>
</body>
</html>