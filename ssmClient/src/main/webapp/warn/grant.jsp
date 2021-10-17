<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />
	</head>
	<body leftmargin="2" topmargin="9" background='<%=path%>/images/allbg.gif'>
		<form action="<%=path%>/yhrole/grant_save" name="formAdd" method="post">
			<table width="98%" align="center" border="0" cellpadding="4"
				cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				<tr bgcolor="#EEF4EA">
					<td colspan="3" background="<%=path%>/images/wbg.gif" class='title'>
						<span>授权</span>
					</td>
				</tr>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						角色：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<select name="role">
						  <c:forEach var="roles" items="${role}">
						     <option value="${roles.id}">${roles.rolename}</option>						  
						  </c:forEach>					
						</select>
					</td>
				</tr>								
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">					 
					<td width="25%" bgcolor="#FFFFFF" align="right">
						权限：
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
					   <c:forEach var="use" items="${root}">
					       	<div align="left">
					         <input type="checkbox" name="right" value="${use.id}"/>
					         ${use.rootname}
				       </div>
					    </c:forEach>						
					</td>													
				</tr>	
				<div align="left">
					         <input type="checkbox" name="right" value="${use.id}"/>
					         ${use.rootname}
				       </div>
				<tr align='center' bgcolor="#FFFFFF"
					onMouseMove="javascript:this.bgColor='red';"
					onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td width="25%" bgcolor="#FFFFFF" align="right">
						&nbsp;
					</td>
					<td width="75%" bgcolor="#FFFFFF" align="left">
						<input type="submit" value="提交" />
						&nbsp;
						<input type="reset" value="重置" />
						&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
