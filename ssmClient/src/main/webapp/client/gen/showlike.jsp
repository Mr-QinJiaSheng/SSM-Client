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
     <h2>客户跟进记录</h2>
      <a id="xlsdowns" onclick="xlsdowns();"  class="xls-downs"title="导出订单编号xls表"></a>
</div>
  <div class="query">
    <form action="<%=path%>/khhui/like?lk==like" name="frm"  method="post">
        <span class="span-cx">请输入对应条件查询：</span>
        <input type="text"  placeholder="客户名"  name="kuhuname" value="${kuhuname}">
        <input type="text"  placeholder="电话"  name="kehutel" value="${kehutel}">
        <input type="text"  placeholder="地址"  name="kehuaddres" value="${kehuaddres}"/>
        <input type="text"  placeholder="类别"  name="kehulei" value="${kehulei}"/>
        <input type="text"  placeholder="房屋情况"  name="kehugenre" value="${kehugenre}"/>
        <input type="text"  placeholder="记录人"  name="kefuname" value="${kefuname}"/>
        <input type="text"  placeholder="记录时间"  name="kehuday" value="${kehuday}"/>
        
        <input type="text"  placeholder="跟进问题"  name="wenti" value="${wenti}"/>
        <input type="text"  placeholder="跟进结果"  name="jieguo" value="${jieguo}"/>
        <input type="text"  placeholder="跟进时间"  name="jieday" value="${jieday}"/>
        <input type="text"  placeholder="跟进负责人"  name="jiename" value="${jiename}"/>
        <input type="text"  placeholder="生成时间"  name="scday" value="${scday}"/>
        <input type="text"  placeholder="预计跟进时间"  name="yuday" value="${yuday}"/>
        <button class="tabe_btn " name="submit"  type="submit">查询</button>
      </form> 
   </div>  
</div>
    <table id="tb_1" class="yxtable">
    <thead>
      <tr>
        <th scope="col" class="wdh60">客户名</th>
        <th scope="col" class="wdh80">电话</th>
        <th scope="col" class="wdh120">地址</th>
        <th scope="col" class="wdh100">类别</th>
        <th scope="col" class="wdh60">房屋情况</th>
        <th scope="col" class="wdh60">记录人</th>
        <th scope="col" class="wdh80">客户状态</th>
        <th scope="row" class="wdh80">生成时间</th>
		<th scope="row" class="wdh80">跟进问题</th>
		<th scope="row" class="wdh80">跟进结果</th>
		<th scope="row" class="wdh80">跟进时间</th>
		<th scope="row" class="wdh60">跟进人</th>
		<th scope="row" class="wdh80">预计时间</th>
        <th scope="col" class="wdh80">操作</th>
      </tr>
     </thead>
     <tbody>
      <c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>   
      <c:forEach var="data" items="${pager.data}">
        <form action="<%=path%>/khhui/update?oper=ji&like=like" name="crm"  method="post" >
        
	      <tr class="mouse">
	       <input type="hidden" name="id" value="${data.id}"/>
	       <input type="hidden" name="jiename" value="${data.jiename}"/>
	<input type="hidden" name="jieday" value="${data.jieday}"/>   
	      	       <fmt:parseDate value="${data.yuday}" pattern="yyyy-MM-dd" var="yuday"/>
	       <c:choose> 	     
		    <c:when test="${(data.jieguo==null||'' eq data.jieguo) &&((yuday.time-nowDate)/86400000)<=2}">
		    <td class="color-red">${data.khClientinfo.kuhuname}</td>
	        <td class="color-red">${data.khClientinfo.kehutel}</td>
	        <td class="color-red">${data.khClientinfo.kehuaddres}</td>
	        <td id="size12">${data.khClientinfo.kehulei}</td>
	        <td class="color-red">${data.khClientinfo.kehugenre}</td>
	        <td class="color-red">${data.khClientinfo.kefuname}</td>
	        <td class="color-red">${data.khClientinfo.khstate}</td>	        
	        <td class="color-red">${data.scday}</td>
	        <td class="color-red"><input name="wenti"class="h-inp" value="${data.wenti}"/></td>
	        <td class="color-red"><input name="jieguo"class="h-inp" value="${data.jieguo}"/></td>
	        <td class="color-red">${data.jieday}</td>
	        <td class="color-red">${data.jiename}</td>
	        <td class="color-red">${data.yuday}</td>
		   </c:when>
		   <c:otherwise>
		   <td >${data.khClientinfo.kuhuname}</td>
	        <td >${data.khClientinfo.kehutel}</td>
	        <td >${data.khClientinfo.kehuaddres}</td>
	        <td id="size12">${data.khClientinfo.kehulei}</td>
	        <td >${data.khClientinfo.kehugenre}</td>
	        <td >${data.khClientinfo.kefuname}</td>
	        <td >${data.khClientinfo.khstate}</td>	        
	        <td>${data.scday}</td>
	        <td><input name="wenti"class="h-inp" value="${data.wenti}"/></td>
	        <td><input name="jieguo"class="h-inp" value="${data.jieguo}"/></td>
	        <td>${data.jieday}</td>
	        <td>${data.jiename}</td>
	        <td>${data.yuday}</td>      
		   </c:otherwise>
		   </c:choose>
	        <td ><input type="submit" class="tabe_btn" value="确认">
	        <a href="<%=path %>/khhui/${data.id}/del?oper=ji&like=like" onclick="return del()" title="删除" class="ico-del"></a></td>
	      </tr>
	      </form>
     </c:forEach>
    </tbody>
    </table>
    <div class="pager">${pager.pageDisplay}</div>

<script src="<%=path%>/js/common.js"></script>
<script src="<%=path%>/layui/layui.js"></script>
<script src="<%=path%>/js/xadmin/xadmin.js"></script>
<script src="<%=path%>/js/xadmin/campaign.js"></script>
<script>
        function xlsdowns() {
         layer.open({
             type: 1,
             title: "导出客户跟进记录xls表",
             closeBtn: false,
             skin: 'layui-layer-blues',
             area: '300px',
             shade: 0.5,
             closeBtn: 2,
             offset: '180px',
             id: 'LAY_layuipro', //设定一个id，防止重复弹出
             moveType: 1, //拖拽模式，0或者1
              content: '<div class="xls-popup"><div class="pop-content"><p class="pop-ts">请输入时间:</p ><div class="pop-text"><form action="<%=path%>/khhui/xls" name="fm"  method="post"><input name="kehuday" class="pop-time" placeholder="记录时间"/><input name="scday"class="pop-time pop-m" placeholder="跟进生成时间"/><button onFocus="this.blur()" class="pop-down" title="导出跟进记录xls表"></button></form></div></div></div>',
             cancel: function(){
              layer.msg('已取消下载', {icon: 2,offset: '180px'});
              }
            });
            }
        
</script>
</body>
</html>