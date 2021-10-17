package com.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import com.dao.YhEmployeeMapper;
import com.dao.YhRoleMapper;
import com.dao.YhRootMapper;
import com.entity.YhEmployee;
import com.entity.YhRole;
import com.util.ListenerDemo;
import com.util.MD5;
import com.util.Pagination;

@Controller
@RequestMapping("/yhemp")
public class YhEmployeeController {
	@Resource
	YhEmployeeMapper yhempDao;
	@Resource
	YhRoleMapper roleDao;
	@Resource
	YhRootMapper rootDao;

	
    //登录
	@RequestMapping("/logi")
	public String login(HttpServletRequest request,YhEmployee data ,ModelMap model) {			
    	if(data.getEmpname()!=null) {
    		data.setPassword(MD5.encrypt(data.getPassword()));
    		YhEmployee all = yhempDao.login(data);
    		if(all!=null) {			
    			//取职位
    			YhRole relo=roleDao.selectByPrimaryKey(all.getRoleid());   			
    			//登录人
    			request.getSession().setAttribute("name",data.getEmpname());
                request.getSession().setAttribute("relo",relo.getRolename());
               
                //取登录人权限
                List rights =yhempDao.rights(all.getEmpname());
                request.getSession().setAttribute("rights",rights); 
                ListenerDemo demo=new ListenerDemo(); 
                request.getSession().setAttribute("num",demo.getOnlineNum()); 
                return "index";        
    		}else {
    			return "login";	
    		}
    	}else {
    		return "login";
    	}  					
	}
	
	
	 //注销用户
	@RequestMapping(value = "/logout")
   public String logout(HttpServletRequest request){
  	   request.getSession().invalidate();
  	   return "login";
  }
	
	//注册用户
	@RequestMapping(value = "/reg")
	public String reg(HttpServletRequest request,YhEmployee data) {		
		String again=(String)request.getParameter("again");
		if(data.getPassword().length()>0){
		    if(again.equals(data.getPassword())){
				data.setPassword(MD5.encrypt(data.getPassword()));
				data.setRoleid(4);
				YhEmployee all = yhempDao.reg(data.getEmpname());
				if(all!=null) {
					return "reg";
				}else {
				    yhempDao.insert(data);
					return "login";
				}				
			}
		}
		return "reg";
	}

}
