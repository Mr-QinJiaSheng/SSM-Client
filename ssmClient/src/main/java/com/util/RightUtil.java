package com.util;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.entity.YhEmployee;


public class RightUtil implements HandlerInterceptor {

	//@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	//@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
          throws Exception {
	}
/*当请求被拦截后自动调用该方法
 * false: 不能请求业务逻辑控制器
 * true:可以调用业务逻辑控制器（放行请求）
 * 权限：有权访问则返回true,否则返回false
*/	//@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {		
		boolean flag=false;
	   //取到当前访问的业务逻辑控制器及方法
	    HandlerMethod handler=(HandlerMethod)obj;
	    //获取访问的控制器的类名
	    String controllerName=handler.getBean().getClass().getSimpleName();
	    //获取访问的控制器的方法名
	    String methodName=handler.getMethod().getName();
	    String operate=controllerName+"/"+methodName;
	   if("YhEmployeeController".equals(controllerName)){
		   flag = true;
	   }else{
		   String user = (String)request.getSession().getAttribute("name");
			if (user == null) {
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				flag=false; 
			} else {
				flag = check(request,operate);
				if(flag==false){
					request.getRequestDispatcher("/warn/top.jsp").forward(request, response);
				}
			}
	   }
	    return flag;
   }	    
	  
   //检查权限
	public boolean check(HttpServletRequest request,String operate) {
		boolean flag = false;
		List<String> rights =  (List) request.getSession().getAttribute("rights");
		for (String right : rights) {
			if (right.equalsIgnoreCase(operate)) {
				flag = true;
				break;
			}
		}
		return flag;
	}
   
}
