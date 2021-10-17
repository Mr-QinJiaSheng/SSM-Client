package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.YhEmployeeMapper;
import com.dao.YhRoleMapper;
import com.dao.YhRolerootMapper;
import com.dao.YhRootMapper;
import com.entity.YhEmployee;
import com.entity.YhRole;
import com.entity.YhRoleroot;
import com.util.MD5;
import com.util.Pagination;

@Controller
@RequestMapping("/yhrole")
public class YhroleController extends BaseController{
	@Resource//角色表
	YhRoleMapper roleDao;
	@Resource//权限地址表
	YhRootMapper rootDao;
	@Resource//中间表
	YhRolerootMapper rolerootDao;
	@Resource//登录人员表
	YhEmployeeMapper yhempDao;
	
	 //权限管理前取数据
	@RequestMapping(value = "/grant")
	public String grant(ModelMap model){
	   List role=roleDao.show();
	   List root=rootDao.show();
	   model.addAttribute("role", role);
       model.addAttribute("root",root);
	   return "warn/grant";
	}
	 //权限管理
	@RequestMapping(value = "/grant_save")
	public String grant_save(HttpServletRequest request,YhRoleroot data){
	   String[] rights=request.getParameterValues("right");
	   int roleId =Integer.parseInt(request.getParameter("role"));
	   rolerootDao.del(roleId);
	   for(String righ:rights){
	  		data.setRoleid(roleId);
	  		int a=Integer.parseInt(righ);
	  		data.setRootid(a);
	  		rolerootDao.insert(data);
	   }
	   return "warn/sesser";
	}
	// 显示
	@RequestMapping(value = "/jshow")
	public String jshow(ModelMap model) {
		List all = roleDao.show();
		model.addAttribute("all", all);
		return "warn/show";
	}
	// 删除角色
	@RequestMapping(value = "/{id}/jdel")
	public String jdel(@PathVariable("id") int id) {
		roleDao.deleteByPrimaryKey(id);
		return "redirect:/yhrole/jshow";
	}
	// 修改前取数据
	@RequestMapping("/{id}/jload")
	public String jloadById(@PathVariable("id") int id, ModelMap model) {
		YhRole data = roleDao.selectByPrimaryKey(id);
		model.addAttribute("data", data);
		return "warn/modify";
	}
	// 修改数据
	@RequestMapping(value = "/jupdate")
	public String jupdate(YhRole data) {
		roleDao.updateByPrimaryKey(data);
		return "redirect:/yhrole/jshow";
	}
	// 添加前取数据
	@RequestMapping("/jadd")
	public String jadd(ModelMap model) {
		List all= rootDao.show();
		model.addAttribute("all",all);
		return "warn/add";
	}
    //添加角色并添加权限
	@RequestMapping(value = "/jaddload")
	public String jaddload(HttpServletRequest request,YhRoleroot put,YhRole                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  data){
	   String[] rights=request.getParameterValues("right");
       roleDao.insertSelective(data);
       //求最大id
	   int obj= roleDao.findSingle();
	   for(String righ:rights){		
		    put.setRoleid(obj);
	  		int a=Integer.parseInt(righ);
	  		put.setRootid(a);
	  		rolerootDao.insert(put);  		 	
	   }	   
	   return "redirect:/yhrole/jshow";
	}
	
	    //人员管理显示
		@RequestMapping("/show")
		public String show(Integer index,HttpServletRequest request, ModelMap model) {
			int pageNO = 1;
			if(index!=null){
				pageNO = index;
			}
			Pagination pager = new Pagination();
			Map params = new HashMap();
			params.put("start", (pageNO-1)*20);
			params.put("pagesize", 20);
			String relo = (String) request.getSession().getAttribute("relo");
			if("客服主管".equals(relo)) {
				params.put("roleName", "roleName");	
			}
			List all=yhempDao.find(params);
			pager.setData(all);
			pager.setIndex(pageNO);
			request.getSession().setAttribute("pageNO", pager.getIndex());
			pager.setPageSize(20);
			pager.setTotal(yhempDao.getTotal(params));
			pager.setPath("show.do?");
			request.setAttribute("pager", pager);
		    return "dept/show";
		}
		// 人员前编辑取数据
		@RequestMapping("/{id}/loads")
		public String loads(@PathVariable("id") int id,HttpServletRequest request, ModelMap model) {
			YhEmployee record = yhempDao.select(id);
			List role=roleDao.show();
			model.addAttribute("record", record);
			model.addAttribute("role", role);
			String like=request.getParameter("like");
			if (like!=null) {
				request.setAttribute("like", like);
			}
			return "dept/modify";
		}

		//人员编辑
		@RequestMapping(value = "/updates")
		public String updates(HttpServletRequest request,YhEmployee data) {
			String pass= request.getParameter("pass");
			if (pass!=null&&pass.length()>0) {
				data.setPassword(MD5.encrypt(pass));
			}			
			yhempDao.updateByPrimaryKeySelective(data);
			Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
			String like=request.getParameter("like");
			if (like!=null&&like.length()>0) {
				return "redirect:/yhrole/like?index="+pagerNO;
			}else {
				return "redirect:/yhrole/show?index="+pagerNO;
			}
		}
		//人员删除
		@RequestMapping("/{id}/del")
		public String del(@PathVariable("id") int id,HttpServletRequest request) {
			yhempDao.deleteByPrimaryKey(id);
			Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
			String like=request.getParameter("like");
			if (like!=null&&like.length()>0) {
				return "redirect:/yhrole/like?index="+pagerNO;
			}else {
				return "redirect:/yhrole/show?index="+pagerNO;
			}
		}	
		//人员添加前取数据
		@RequestMapping(value = "/doadd")
		public String doadd(ModelMap model){
		   List role=roleDao.show();
		   List root=rootDao.show();
		   model.addAttribute("role", role);
	       model.addAttribute("root",root);
		   return "dept/add";
		}
		//人员添加
		@RequestMapping(value = "/add")
		public String add(YhEmployee data,ModelMap model) {
			data.setPassword(MD5.encrypt(data.getPassword()));
			yhempDao.insertSelective(data);
			return "redirect:/yhrole/show";		
		}
    //人员模糊查询
	@RequestMapping(value = "/like")
	public String like(Integer index,YhEmployee data,ModelMap model,HttpServletRequest request){
		int pageNO = 1;
		if(index!=null){
			pageNO = index;
		}
		Pagination pager = new Pagination();
		Map params = new HashMap();
		String lk=request.getParameter("lk");
		String empname="";	
		String rolename="";
		String tel="";

		if (lk!=null&&lk.length()>0) {
			request.getSession().setAttribute("empname", data.getEmpname());
			request.getSession().setAttribute("rolename", request.getParameter("rolename"));				
			request.getSession().setAttribute("tel", data.getTel());			
		}	
		String relo = (String) request.getSession().getAttribute("relo");
		if("客服主管".equals(relo)) {
			params.put("roleName", "roleName");	
		}
		empname = (String) request.getSession().getAttribute("empname");	
		rolename = (String) request.getSession().getAttribute("rolename");
		tel = (String) request.getSession().getAttribute("tel");
		if(empname!=null&&empname.length()>0) {
			params.put("empname", empname);
		}
		if(rolename!=null&&rolename.length()>0) {
		    params.put("rolename", rolename);
		}
		if(tel!=null&&tel.length()>0) {
		    params.put("tel", tel);
		}
		params.put("start", (pageNO-1)*20);
		params.put("pagesize", 20);
		List all = yhempDao.like(params);
		pager.setData(all);		
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(20);
		pager.setTotal(yhempDao.getlikeTotal(params));
		pager.setPath("like.do?");
		model.addAttribute("pager", pager);
		return "dept/likeshow";
	}
}
