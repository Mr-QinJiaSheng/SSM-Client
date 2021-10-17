<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
 <c:if test="${name eq null}">
<script>
    window.parent.parent.location.href="<%=path%>/yhemp/logout";
</script>
</c:if>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>新媒体客户管理系统</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="<%=path%>/css/xadmin/xadmin.css">
        <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <h1 class="logo"></h1></div>
            <div class="left_open">
                <a><i title="折叠左侧栏" ></i></a>
            </div>
           
            <ul class="layui-nav right top_menu">
            <li class="layui-nav-item" >
					<a href="javascript:;"> <script type=text/javascript src="<%=path %>/js/clock.js"></script>
                     <script type=text/javascript>showcal();</script></a>
			    </li>
            <li class="layui-nav-item to-index">
                    <a href="<%=path%>/index.jsp">后台主页</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">${name}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a>您好:<i class="color-blue">${relo}</i></a></dd>
                        <dd>
                            <a>在线:<span class="x-red">${num}</span>人</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a id="logout" onclick="logout();" >退出系统</a></li>
            </ul>

        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                <li class="lis">
                    <i class="xit" lay-tips="后台"></i>
                     <cite>新媒体客户管理系统</cite>
                </li>               
                    <li>
                        <a href="javascript:;">
                            <i class="sc-dd" lay-tips="客户管理"></i>
                            <cite>客户信息</cite><i class="lef-ico"></i></a>
                            
                        <ul class="sub-menu">
                            <li><a onclick="xadmin.add_tab('客户信息','<%=path%>/khclient/show',true)"><i class="rig-ico"></i>
                                <span>客户信息</span></a></li>
                            <li><a onclick="xadmin.add_tab('跟进记录','<%=path%>/khhui/show',true)"><i class="rig-ico"></i>
                                <span>跟进记录</span></a>
                            </li>   
                             <li><a onclick="xadmin.add_tab('未跟进记录','<%=path%>/khhui/weishow',true)"><i class="rig-ico"></i>
                                <span>未跟进记录</span></a>
                            </li>   
                                                                
                         </ul>
                       
                    </li>

                    

                    
                    
              
                    <c:if test="${relo eq '管理员' || relo eq '客服主管'}">
                     <li>
                        <a href="javascript:;">
                            <i class="sc-qx" lay-tips="登录信息">&#xeb64;</i>
                            <cite>登录信息</cite>
                            <i class="lef-ico"></i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('登录信息','<%=path%>/log/show',true)">
                                   <i class="rig-ico"></i>
                                    <span>登录信息</span></a>
                            </li>
                             <li>
                                <a onclick="xadmin.add_tab('登录信息','<%=path%>/log/shows',true)">
                                     <i class="rig-ico"></i>
                                    <span>个人操作记录</span></a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;">
                            <i class="sc-qx" lay-tips="权限管理"></i>
                            <cite>权限管理</cite><i class="lef-ico"></i></a>
                        <ul class="sub-menu">
                         <c:if test="${relo eq '管理员'}">
                            <li><a onclick="xadmin.add_tab('角色权限','<%=path%>/yhrole/jshow',true)"><i class="rig-ico"></i>
                                    <span>角色权限</span></a></li>
                            <li><a onclick="xadmin.add_tab('权限管理','<%=path%>/yhrole/grant',true)"><i class="rig-ico"></i>
                                    <span>权限管理</span></a></li>
                         </c:if>
                            <li><a onclick="xadmin.add_tab('人员管理','<%=path%>/yhrole/show',true)"><i class="rig-ico"></i>
                                    <span>人员管理</span></a></li>
                        </ul>
                    </li>
                    </c:if>
                    
                    
                    
                </ul>
            </div>
        </div>
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home ">
                    <i class="home-ico"></i><span class="color-blues">主页</span></li></ul>
                    <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='<%=path %>/home.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->

<script src="<%=path%>/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=path%>/js/xadmin/xadmin.js"></script>
<script type="text/javascript" src="<%=path%>/js/xadmin/jquery.min.js"></script>
<script>
// 是否开启刷新记忆tab功能
var is_remember = false;
</script>
<script>layer.msg('您好---${relo}',{icon: 6}); </script>

<script>
        function  logout() {
                layer.confirm('确定要退出吗？', {
                    btn: ['确认','取消'], //按钮
                    skin: 'layui-layer-blues',
                    }, function(){
                        	window.location.href = '<%=path %>/yhemp/logout';
                    }, function(){
                          layer.msg('已取消', {icon: 2});
                    });
            }
</script>
</body>
</html>