package com.controller;

import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.LogMapper;
import com.dao.LogsMapper;
import com.entity.Log;
import com.util.Pagination;

@Controller
@RequestMapping("/log")
public class LogController extends BaseController{
	@Resource
	LogMapper logDao;
	@Resource
	LogsMapper logsDao;
	
	//登录信息显示
	@RequestMapping("/show")
	public String show(Integer index,HttpServletRequest request,ModelMap model) {
		int pageNO = 1;
		if(index!=null){
			pageNO = index;
		}
		Pagination pager = new Pagination();
		Map params = new HashMap();
		params.put("start", (pageNO-1)*40);
		params.put("pagesize", 40);
		List all = logDao.show(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(logDao.getTotal());
		pager.setPath("show.do?");
		request.setAttribute("pager", pager);	
		return "dept/denlu/show";
	}
	//登录信息模糊查找
	@RequestMapping("/like")
	public String like(Integer index, Log data,HttpServletRequest request) {
		int pageNO = 1;
		if(index!=null){
			pageNO = index;
		}
		Pagination pager = new Pagination();
		Map params = new HashMap();
		String lk=request.getParameter("lk");
		String account="";
		String onlineTime="";
		String exitTime="";
		if (lk!=null&&lk.length()>0) {
			request.getSession().setAttribute("account",data.getAccount());
			request.getSession().setAttribute("onlineTime",data.getOnlineTime());
			request.getSession().setAttribute("exitTime",data.getExitTime());
		}
		account=(String) request.getSession().getAttribute("account");
		onlineTime=(String) request.getSession().getAttribute("onlineTime");
		exitTime=(String) request.getSession().getAttribute("exitTime");		
		if(account!=null&&account.length()>0) {
			params.put("account",account);
		}	
		if(onlineTime!=null&&onlineTime.length()>0) {
			params.put("onlineTime",onlineTime);
		}
		if(exitTime!=null&&exitTime.length()>0) {
			params.put("exitTime",exitTime);
		}
        params.put("start", (pageNO-1)*40);
		params.put("pagesize", 40);
		List all = logDao.like(params);
		pager.setData(all);		
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(logDao.getlikeTotal(params));
		pager.setPath("like.do?");
		request.setAttribute("pager", pager);		
		return "dept/denlu/show";
	}
	//个人操作记录显示
	@RequestMapping("/shows")
	public String shows(Integer index,HttpServletRequest request,ModelMap model) {
		int pageNO = 1;
		if(index!=null){
			pageNO = index;
		}
		Pagination pager = new Pagination();
		Map params = new HashMap();
		params.put("start", (pageNO-1)*40);
		params.put("pagesize", 40);
		List all = logsDao.show(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(logsDao.getTotal());
		pager.setPath("shows.do?");
		request.setAttribute("pager", pager);
		return "dept/caozuo/show";
	}
}