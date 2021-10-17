<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<title>新媒体客户管理系统</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/login/login.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/layui/css/layui.css">
</head>
<body>
<div class="login-bj"></div> 
<script type="text/javascript">
onload=function(){
setInterval(go,500);
};
var x=3;
function go(){
x--;
if(x>0){
document.getElementById("sp").innerHTML=x; 
}else{
location.href='<%=path%>/login.jsp';
}
}
</script>
<script src="<%=path%>/layui/layui.js" charset="utf-8"></script>
<script>
layui.use('layer',function(){
var layer = layui.layer;
    layer.ready(function(){
      layer.msg('<span class="login-error">抱歉 !</span><br><span class="login-errors">您输入的用户名或密码错误!<br>请检查重新登录 </span>',{
    	  anim: 6,
    	  time: 1500,
    	  icon: 2});
    });  
 
});
</script>

</body>
</html>