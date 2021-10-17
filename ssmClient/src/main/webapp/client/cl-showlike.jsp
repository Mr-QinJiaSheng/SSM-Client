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
     <h2>数据字典管理</h2>
     <a onclick="xadmin.open('新建','<%=path%>/client/cl-add.jsp',400,550)" title="新建"><i class="add"></i></a>
</div>
  <div class="query">
  <form action="<%=path%>/khclient/like?lk==like" name="frm"  method="post">
     
        <input type="text"  placeholder="客户姓名"  name="kuhuname" value="${kuhuname}">
        <input type="text"  placeholder="电话"  name="kehutel" value="${kehutel}">
        <input type="text"  placeholder="区域"  name="qu" value="${qu}"/>
        <input type="text"  placeholder="地址"  name="kehuaddres" value="${kehuaddres}"/>
        <input type="text"  placeholder="类别"  name="kehulei" value="${kehulei}"/>
        <input type="text"  placeholder="房屋情况"  name="kehugenre" value="${kehugenre}"/>
        <input type="text"  placeholder="装修情况"  name="an" value="${an}"/>
        
          <input type="text"  placeholder="开工时间"  name="kaiday" value="${kaiday}"/>
        <input type="text"  placeholder="微信"  name="weixin" value="${weixin}"/>
        <input type="text"  placeholder="渠道"  name="channel" value="${channel}"/>
        <input type="text"  placeholder="状态"  name="khstate" value="${khstate}"/>
        <input type="text"  placeholder="接待人"  name="jiename" value="${jiename}"/>
        <input type="text"  placeholder="记录人"  name="kefuname" value="${kefuname}"/>
        <input type="text"  placeholder="记录时间"  name="kehuday" value="${kehuday}"/>
        <button class="tabe_btn " name="submit"  type="submit">查询</button>
      </form> 
   </div>  
</div>
    <table id="tb_1" class="yxtable">
    <thead>
      <tr>
         <th scope="col" class="wdh60">客户姓名</th>
        <th scope="col" class="wdh90">电话</th>
        <th scope="col" class="wdh90">区域</th>
        <th scope="col" class="wdh120">地址</th>      
        <th scope="col" class="wdh140">类别</th>
        <th scope="col" class="wdh60">房屋情况</th>
        <th scope="col" class="wdh100">开工时间</th>
        <th scope="col" class="wdh50">微信</th>
        <th scope="col" class="wdh80">渠道</th>
        <th scope="col" class="wdh60">状态</th>
        <th scope="col" class="wdh100">客户需求</th>
        <th scope="col" class="wdh100">客户情况备注</th>
        <th scope="col" class="wdh100">房屋面积</th>
        <th scope="col" class="wdh100">装修情况</th>
        <th scope="col" class="wdh100">预计价格</th>
        <th scope="col" class="wdh100">接待人</th>       
        <th scope="col" class="wdh80">记录人</th>
        <th scope="col" class="wdh100">记录时间</th>
        <th scope="col" class="wdh120">操作</th>
      </tr>
     </thead>
     <tbody>
      <c:forEach var="data" items="${pager.data}">
    <%--   <input type="hidden" name="id" value="${data.id}"/> --%>
     <c:choose>   	    
         <c:when test="${data.khstate eq '丢失'}">
         <tr class="mouse">
	        <td class="color-grays">${data.kuhuname}</td>
	        <td class="color-grays">${data.kehutel}</td>
	        <td class="color-grays">${data.qu}</td>
	        <td class="color-grays">${data.kehuaddres}</td>
	        <td id="size12">${data.kehulei}</td>
	        <td class="color-grays">${data.kehugenre}</td>
	        <td class="color-grays">${data.kaiday}</td>
	        <td class="color-grays">${data.weixin}</td>
	        <td class="color-grays">${data.channel}</td>
	        <td class="color-grays">${data.khstate}</td>
	        <td class="color-grays">${data.xu}</td>
	        <td class="color-grays">${data.khremark}</td>
	        
	        <td class="color-grays">${data.size}</td>	        
	        <td class="color-grays">${data.an}</td>
	        <td class="color-grays">${data.yumoney}</td>
	        <td class="color-grays">${data.jiename}</td>
	        
	        <td class="color-grays">${data.kefuname}</td>
	        <td class="color-grays">${data.kehuday}</td>
	        <td ><a onclick="xadmin.open('编辑','<%=path %>/khclient/${data.id}/load?like=like',700,500)"  title="编辑" class="ico-edit"></a>
	             <a href="<%=path %>/khhui/${data.id}/xiang?like=like"  title="跟进记录"><i class="ico-schedule"></i></a>
	             <a href="<%=path %>/khclient/${data.id}/del?like=like" onclick="return del()" title="删除" class="ico-del"></a>
	        </td>    
	      </tr>
         </c:when>
         <c:when test="${data.khstate eq '订单'}">
          <tr class="mouse">
	        <td class="color-gree">${data.kuhuname}</td>
	        <td class="color-gree">${data.kehutel}</td>
	        <td class="color-gree">${data.qu}</td>
	        <td class="color-gree">${data.kehuaddres}</td>
	        <td id="size12">${data.kehulei}</td>
	        <td class="color-gree">${data.kehugenre}</td>
	        <td class="color-gree">${data.kaiday}</td>
	        <td class="color-gree">${data.weixin}</td>
	        <td class="color-gree">${data.channel}</td>
	        <td class="color-gree">${data.khstate}</td>
	        <td class="color-gree">${data.xu}</td>
	        <td class="color-gree">${data.khremark}</td>
	        <td class="color-gree">${data.size}</td>	        
	        <td class="color-gree">${data.an}</td>
	        <td class="color-gree">${data.yumoney}</td>
	        <td class="color-gree">${data.jiename}</td>
	        <td class="color-gree">${data.kefuname}</td>
	        <td class="color-gree">${data.kehuday}</td>
	        <td ><a onclick="xadmin.open('编辑','<%=path %>/khclient/${data.id}/load?like=like',700,500)"  title="编辑" class="ico-edit"></a>
	             <a href="<%=path %>/khhui/${data.id}/xiang?like=like"  title="跟进记录"><i class="ico-schedule"></i></a>	             
	        </td>    
	      </tr>
         </c:when>
       
         <c:otherwise> 
         <tr class="mouse">
	        <td >${data.kuhuname}</td>
	        <td >${data.kehutel}</td>
	        <td >${data.qu}</td>
	        <td >${data.kehuaddres}</td>
	        <td id="size12">${data.kehulei}</td>
	        <td >${data.kehugenre}</td>
	        <td >${data.kaiday}</td>
	        <td >${data.weixin}</td>
	        <td >${data.channel}</td>
	        <td >${data.khstate}</td>
	        <td >${data.xu}</td>
	        <td >${data.khremark}</td>
	        <td >${data.size}</td>	        
	        <td >${data.an}</td>
	        <td >${data.yumoney}</td>
	        <td >${data.jiename}</td>
	        <td >${data.kefuname}</td>
	        <td >${data.kehuday}</td>
	        <td ><a onclick="xadmin.open('编辑','<%=path %>/khclient/${data.id}/load?like=like',700,500)"  title="编辑" class="ico-edit"></a>
	             <a href="<%=path %>/khhui/${data.id}/xiang?like=like"  title="跟进记录"><i class="ico-schedule"></i></a>
	             <a href="<%=path %>/khclient/${data.id}/del?like=like" onclick="return del()" title="删除" class="ico-del"></a>
	         </td>    
	      </tr>  
         </c:otherwise>
     </c:choose>
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