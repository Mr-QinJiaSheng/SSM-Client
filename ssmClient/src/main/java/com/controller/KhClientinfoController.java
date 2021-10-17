package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.KhClientinfoMapper;
import com.dao.KhHuiMapper;
import com.dao.LogsMapper;
import com.entity.KhClientinfo;
import com.entity.KhHui;
import com.entity.Logs;
import com.util.Pagination;

@Controller
@RequestMapping("/khclient")
public class KhClientinfoController extends BaseController{
	@Resource//客户表
	KhClientinfoMapper khclientDao;
	@Resource//客户跟进表
	KhHuiMapper khhuiDao;
	@Resource
	LogsMapper logsDao;
	//客户表显示
	@RequestMapping("/show")
	public String show(Integer index,HttpServletRequest request) {
		int pageNO = 1;
		if(index!=null){
			pageNO = index;
		}
		String names = (String) request.getSession().getAttribute("name");
		String relo = (String) request.getSession().getAttribute("relo");
		Pagination pager = new Pagination();
		Map params = new HashMap();
		params.put("start", (pageNO-1)*40);
		params.put("pagesize", 40);
		if("客服".equals(relo)) {
			params.put("kefuname", names);	
		}
		List all = khclientDao.show(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(khclientDao.getTotal());
		pager.setPath("show.do?");
		request.setAttribute("pager", pager);	
		return "client/cl-show";
	}
	//客户表新建
	@RequestMapping(value = "/add")
	public String add(KhClientinfo data,HttpServletRequest request) {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置时间显示格式
		String str = sdf.format(now);
		String names = (String) request.getSession().getAttribute("name");
		data.setKehuday(str);
		data.setKefuname(names);
		data.setKhstate("未到访");
		Date time = null;
		if ("A:已交房客户".equals(data.getKehulei())) {
			time= new Date(now.getTime() + (long)3 * 24 * 60 * 60 * 1000);//加3天			
		}
		if ("B:3个月内交房客户".equals(data.getKehulei())) {
			time= new Date(now.getTime() + (long)7 * 24 * 60 * 60 * 1000);//加7天			
		}
		if ("C:3-6交房客户".equals(data.getKehulei())) {
			time= new Date(now.getTime() + (long)15 * 24 * 60 * 60 * 1000);//加15天			
		}
		if ("D:6个月以上交房客户".equals(data.getKehulei())) {
			time= new Date(now.getTime() + (long)30 * 24 * 60 * 60 * 1000);//加30天			
		}
		String stc = sdf.format(time);	
		if (data.getKehutel().length()>1) {
			KhClientinfo khClient=khclientDao.tel(data.getKehutel());
			if (khClient!=null) {
				request.setAttribute("all", khClient.getKefuname());
				return "client/chongfu";
			}
		}		
		khclientDao.insertSelective(data);
		KhClientinfo khClientinfo=khclientDao.isdn();
		KhHui khHui=new KhHui();
		khHui.setYuday(stc);
		khHui.setWenti("客户第一次跟进");		
		khHui.setInid(khClientinfo.getId());
		khHui.setScday(str);
		khhuiDao.insertSelective(khHui);
		Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
		return "redirect:/khclient/show?index="+pagerNO;		
	}

	//客户表删除
	@RequestMapping("/{id}/del")
    public String del(@PathVariable("id") int id,HttpServletRequest request) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 时间字符串产生方式
        String uid = format.format(new Date());
        String names = (String) request.getSession().getAttribute("name");
        KhClientinfo khClientinfo=khclientDao.selectByPrimaryKey(id);
		Logs logs =new Logs();
		logs.setDay(uid);
		logs.setLoname(names);
		logs.setLei("删除");
		logs.setBiaoid(khClientinfo.getKuhuname()+"+"+khClientinfo.getKehutel());
		logs.setBiao("客户表及跟进详情");
		logsDao.insertSelective(logs);
		
		khclientDao.deleteByPrimaryKey(id);
		Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
		String like=request.getParameter("like");
		if (like!=null&&like.length()>0) {
			return "redirect:/khclient/like?index="+pagerNO;
		}else {
			return "redirect:/khclient/show?index="+pagerNO;
		}
    }
	//客户表编辑前取数据
	@RequestMapping("/{id}/load")
	public String load(@PathVariable("id") int id,HttpServletRequest request, ModelMap model) {
		KhClientinfo record = (KhClientinfo) khclientDao.selectByPrimaryKey(id);
		model.addAttribute("record", record);
		String like=request.getParameter("like");
		if (like!=null) {
			request.setAttribute("like", like);
		}
		return "client/cl-modify";
	}
	//客户表编辑
	@RequestMapping(value = "/update")
	public String update(KhClientinfo data,HttpServletRequest request) {
		khclientDao.updateByPrimaryKeySelective(data);
		Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
		String like=request.getParameter("like");
		if (like!=null&&like.length()>0) {
			return "redirect:/khclient/like?index="+pagerNO;
		}else {
			return "redirect:/khclient/show?index="+pagerNO;
		}
	}
	//客户表模糊查找
	@RequestMapping("/like")
	public String like(Integer index, KhClientinfo data,HttpServletRequest request) {
		int pageNO = 1;
		if(index!=null){
			pageNO = index;
		}
		Pagination pager = new Pagination();
		Map params = new HashMap();
		String lk=request.getParameter("lk");
		String names = (String) request.getSession().getAttribute("name");
		String relo = (String) request.getSession().getAttribute("relo");
		if (lk!=null&&lk.length()>0) {
			request.getSession().setAttribute("kuhuname",data.getKuhuname());
			request.getSession().setAttribute("kehuaddres",data.getKehuaddres());
			request.getSession().setAttribute("kehutel",data.getKehutel());
			request.getSession().setAttribute("kehulei",data.getKehulei());
			request.getSession().setAttribute("kehugenre",data.getKehugenre());
			
			request.getSession().setAttribute("kaiday",data.getKaiday());
			request.getSession().setAttribute("weixin",data.getWeixin());
			request.getSession().setAttribute("channel",data.getChannel());
			request.getSession().setAttribute("khstate",data.getKhstate());
			request.getSession().setAttribute("kefuname",data.getKefuname());
			request.getSession().setAttribute("kehuday",data.getKehuday());
			request.getSession().setAttribute("qu",data.getQu());
			request.getSession().setAttribute("an",data.getAn());
			request.getSession().setAttribute("jiename",data.getJiename());
		
		}
		String qu= (String) request.getSession().getAttribute("qu");			
		if(qu!=null&&qu.length()>0) {
			params.put("qu", qu);
		}
		String an= (String) request.getSession().getAttribute("an");			
		if(an!=null&&an.length()>0) {
			params.put("an", an);
		}
		String jiename= (String) request.getSession().getAttribute("jiename");			
		if(jiename!=null&&jiename.length()>0) {
			params.put("jiename", jiename);
		}
		
		String kaiday= (String) request.getSession().getAttribute("kaiday");			
		if(kaiday!=null&&kaiday.length()>0) {
			params.put("kaiday", kaiday);
		}
		String weixin= (String) request.getSession().getAttribute("weixin");			
		if(weixin!=null&&weixin.length()>0) {
			params.put("weixin", weixin);
		}
		String channel= (String) request.getSession().getAttribute("channel");			
		if(channel!=null&&channel.length()>0) {
			params.put("channel", channel);
		}
		String khstate= (String) request.getSession().getAttribute("khstate");			
		if(khstate!=null&&khstate.length()>0) {
			params.put("khstate", khstate);
		}
		String kehuday= (String) request.getSession().getAttribute("kehuday");			
		if(kehuday!=null&&kehuday.length()>0) {
			params.put("kehuday", kehuday);
		}
		
		String kuhuname= (String) request.getSession().getAttribute("kuhuname");
		if(kuhuname!=null&&kuhuname.length()>0) {
			params.put("kuhuname", kuhuname);
		}
		String kehuaddres= (String) request.getSession().getAttribute("kehuaddres");			
		if(kehuaddres!=null&&kehuaddres.length()>0) {
			params.put("kehuaddres", kehuaddres);
		}		
		String kehugenre= (String) request.getSession().getAttribute("kehugenre");			
		if(kehugenre!=null&&kehugenre.length()>0) {
			params.put("kehugenre", kehugenre);
		}
		String kehulei= (String) request.getSession().getAttribute("kehulei");			
		if(kehulei!=null&&kehulei.length()>0) {
			params.put("kehulei", kehulei);
		}
		String kehutel= (String) request.getSession().getAttribute("kehutel");			
		if(kehutel!=null&&kehutel.length()>0) {
			params.put("kehutel", kehutel);
		}		
		String kefuname= (String) request.getSession().getAttribute("kefuname");			
		if("客服".equals(relo)) {
			params.put("kefuname", names);	
		}else {
			if(kefuname!=null&&kefuname.length()>0) {
				params.put("kefuname", kefuname);
			}
		}
		params.put("start", (pageNO-1)*40);
		params.put("pagesize",40);
		List all = khclientDao.like(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO",pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(khclientDao.getlikeTotal(params));
		pager.setPath("like?");
		request.setAttribute("pager", pager);
		return "client/cl-showlike";
	}
}
