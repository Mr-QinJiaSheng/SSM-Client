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
            <div class="new-login-box">
            <form action="<%=path%>/yhemp/logi" method="post" id="loginForm" method="post" autocomplete="off" target="_parent">
            <div class="login-div">
            <div class="left-triangle wxBg toggleLogin"></div>
                    <div class="left-triangle wxBg toggleLogin"></div>
                    <div class="login_logo"><i class="login-ico" ></i></div>
                    <div class="login-brows"><span class="login-name">客户关系管理系统</span></div>
                   
                   
                   
                    <ul id="login" class="login-ul">
                    
                         <li class="login-li">
                            <i class="user"></i>
                            <input  class="login-input" data-val="true" data-val-required="."id="username" maxlength="50" name="empname" type="text" placeholder="请输入用户名..."autocomplete="off"/>
                            <span class="field-validation-valid" data-valmsg-for="empname" data-valmsg-replace="true" ></span>
                        </li>
                        <li class="login-li">
                            <i class="pwd"></i>
                            <input class="login-input" data-val="true" data-val-required="请输入...用户名/密码"  id="password" maxlength="20" name="password" type="password" value=""placeholder="请输入密码..."autocomplete="off"/>
                            <span class="field-validation-valid" data-valmsg-for="password" data-valmsg-replace="true"></span>
                        </li>
                        
                        <li class="login-log"><button class="login-but " name="submit"  type="submit" data-text="登录...."><span>登录</span></button></li>
                   </ul>
                </div>
              </form>
            </div>
      



    <script type="text/javascript" src="<%=path %>/js/login/jquery.js"></script><!-- 验证 -->
    <script type="text/javascript" src="<%=path %>/js/login/jquery.validate.js?v=20181130"></script><!-- 验证 -->
    <script type="text/javascript" src="<%=path %>/js/login/jquery.validate.unobtrusive.js"></script><!-- 登录验证 -->

<script src="<%=path%>/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=path%>/js/back-stage/xadmin3.js"></script>
<script type="text/javascript" src="<%=path%>/js/back-stage/jquery.min.js"></script>
<script>
document.getElementById("username").focus();
</script>

<script>

var DEFAULT_VERSION = "8.0";
var ua = navigator.userAgent.toLowerCase();
var isIE = ua.indexOf("msie") > -1;
var safariVersion;
if (isIE) {
    safariVersion = ua.match(/msie ([\d.]+)/)[1];
}
if (safariVersion*1 <= DEFAULT_VERSION*1) {
 alert("很抱歉您的浏览器版本过低!页面无法兼容!请升级您的浏览器至最新版本!推荐您使用谷歌浏览器");
    window.location.href ="https://www.google.cn/intl/zh-CN/chrome/";
}

</script>
</body>
</html>