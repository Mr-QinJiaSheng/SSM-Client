<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/css/xadmin/page.css" />
<link rel="stylesheet" href="<%=path%>/css/xadmin/datasheet.css" />
<title>成品家具添加</title>
</head>
<body>
<div class="article">  
<div class="title ue-clear">
    	<h2>角色管理&nbsp;-->&nbsp;角色添加</h2>
        <a class="more"></a>
    </div>
    
    <div class="adds">
    <form action="<%=path%>/yhrole/add" method="post"  name="form"οnkeypress="javascript:return NoSubmit(event);" onclick="return check()" target="_parent">
    <div class="add-s">
    <div class="bot-rk">
    <ul>
    <li><span>姓名:</span><input class="inp" type="text" name="empname" required   placeholder="请输入姓名" autocomplete="off"></li>
    <li><span>密码:</span><input class="inp"id="psw" type="password" name="password" required autocomplete="off"></li>
    <li><span>确认密码:</span><input class="inp"id="psw_ag" type="password" name="again" required autocomplete="off"></li>
    <li><span>电话:</span><input class="inp" type="text" name="tel"  placeholder="请输入电话"></li>
    <li><span>职位:</span><select name="roleid" class="inp"><option value="" class="option" disabled selected>--请选择--</option><c:forEach var="roles" items="${role}"><option value="${roles.id}">${roles.rolename}</option></c:forEach></select></li>
    <li><input type="reset" value="重置" class="buttoms-rk"></li>
    <li><input  type="submit" value="提交" class="buttom-rk"></li>
    </ul>
    </div>
    </div> 
    </form>
    </div>
</div>
    
<script type="text/javascript" src="<%=path %>/js/xadmin/jquery.js"></script>
<script>
        $(function(){
            $("#psw_ag").blur(function(){
                if($("#psw").val()!=$("#psw_ag").val()){
                    alert("两次输入的密码不一致");
                }
            })
        })

    </script>
</body>
</html>
