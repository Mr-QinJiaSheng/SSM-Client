package com.controller;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.KhClientinfoMapper;
import com.dao.KhHuiMapper;
import com.entity.KhClientinfo;
import com.entity.KhHui;
import com.util.Pagination;

@Controller
@RequestMapping("/khhui")
public class KhHuiController {
	@Resource//客户表
	KhClientinfoMapper khclientDao;
	@Resource//客户跟进表
	KhHuiMapper khhuiDao;
	
	//客户跟进表详情
	@RequestMapping("/{id}/xiang")
	public String xiang(@PathVariable("id") int id,ModelMap model) {
		List<KhHui> all=khhuiDao.select(id);
		KhClientinfo record=khclientDao.selectByPrimaryKey(id);
		model.addAttribute("record", record);
		model.addAttribute("all",all);
		return "client/cl-condit";					
	}
	//客户跟进表详情添加
	@RequestMapping("/{id}/add")
	public String add(@PathVariable("id") int id,ModelMap model) {
		KhClientinfo record=khclientDao.selectByPrimaryKey(id);
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置时间显示格式		
		String str = sdf.format(now);
		Date time = null;
		if ("A:已交房客户".equals(record.getKehulei())) {
			time= new Date(now.getTime() + (long)3 * 24 * 60 * 60 * 1000);//加3天			
		}
		if ("B:3个月内交房客户".equals(record.getKehulei())) {
			time= new Date(now.getTime() + (long)7 * 24 * 60 * 60 * 1000);//加7天			
		}
		if ("C:3-6交房客户".equals(record.getKehulei())) {
			time= new Date(now.getTime() + (long)15 * 24 * 60 * 60 * 1000);//加15天			
		}
		if ("D:6个月以上交房客户".equals(record.getKehulei())) {
			time= new Date(now.getTime() + (long)30 * 24 * 60 * 60 * 1000);//加30天			
		}
		String stc = sdf.format(time);			
		KhHui khHui=new KhHui();
		khHui.setScday(str);
		khHui.setInid(id);
		
		khHui.setYuday(stc);
		khhuiDao.insertSelective(khHui);
		List<KhHui> all=khhuiDao.select(id);
		
		model.addAttribute("record", record);
		model.addAttribute("all",all);
		return "client/cl-condit";
	}
	//客户跟进表详情删除
	@RequestMapping("/{id}/del")
	public String del(@PathVariable("id") int id,HttpServletRequest request) {
		String oper=request.getParameter("oper");
		if ("ji".equals(oper)) {
			khhuiDao.deleteByPrimaryKey(id);
			Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
			String like=request.getParameter("like");
			if (like!=null&&like.length()>0) {
				return "redirect:/khhui/like?index="+pagerNO;
			}else {
				return "redirect:/khhui/show?index="+pagerNO;
			}			
		}else if ("wei".equals(oper)) {
			khhuiDao.deleteByPrimaryKey(id);
			Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");			
			return "redirect:/khhui/weishow?index="+pagerNO;
				
		} else {
			KhHui khHui=khhuiDao.selectByPrimaryKey(id);		
			khhuiDao.deleteByPrimaryKey(id);
			List<KhHui> all=khhuiDao.select(khHui.getInid());
			KhClientinfo record=khclientDao.selectByPrimaryKey(khHui.getInid());
			request.setAttribute("record", record);
			request.setAttribute("all",all);
			return "client/cl-condit";					
		}				
	}
	// 跟进修改
	@RequestMapping(value = "/update")
	public String update(HttpServletRequest request,KhHui data) {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置时间显示格式
		String str = sdf.format(now);
		if(data.getJieguo()!=null&&data.getJieguo()!="") {
			if(data.getJieday()==null||"".equals(data.getJieday())) {
				data.setJieday(str);
			}
			if(data.getJiename()==null||"".equals(data.getJiename())) {
				String names = (String) request.getSession().getAttribute("name");
				data.setJiename(names);
			}
		}
		khhuiDao.updateByPrimaryKeySelective(data);
		String oper=request.getParameter("oper");
		if ("ji".equals(oper)) {
			Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");
			String like=request.getParameter("like");
			if (like!=null&&like.length()>0) {
				return "redirect:/khhui/like?index="+pagerNO;
			}else {
				return "redirect:/khhui/show?index="+pagerNO;
			}
			
		}else if ("wei".equals(oper)) {
			Integer pagerNO=(Integer)request.getSession().getAttribute("pageNO");			
			return "redirect:/khhui/weishow?index="+pagerNO;
				
		} else {
			List<KhHui> all=khhuiDao.select(data.getInid());
			KhClientinfo record=khclientDao.selectByPrimaryKey(data.getInid());
			request.setAttribute("record", record);
			request.setAttribute("all", all);		
			return "client/cl-condit";	
		}	
	}
	//客户跟进表显示
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
		List all = khhuiDao.show(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(khhuiDao.getTotal());
		pager.setPath("show.do?");
		request.setAttribute("pager", pager);	
		return "client/gen/show";
	}
	//客户跟进表显示
	@RequestMapping("/weishow")
	public String weishow(Integer index,HttpServletRequest request) {
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
		params.put("jieguo", "jieguo");
		List all = khhuiDao.show(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO", pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(khhuiDao.getTotal());
		pager.setPath("weishow.do?");
		request.setAttribute("pager", pager);
		return "client/gen/weishow";
	}	
	//客户表模糊查找
	@RequestMapping("/like")
	public String like(Integer index, KhHui data,HttpServletRequest request) {
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
			request.getSession().setAttribute("kuhuname",request.getParameter("kuhuname"));
			request.getSession().setAttribute("kehuaddres",request.getParameter("kehuaddres"));
			request.getSession().setAttribute("kehuday",request.getParameter("kehuday"));
			request.getSession().setAttribute("kehugenre",request.getParameter("kehugenre"));
			request.getSession().setAttribute("kehulei",request.getParameter("kehulei"));
			request.getSession().setAttribute("kehutel",request.getParameter("kehutel"));
			request.getSession().setAttribute("kefuname",request.getParameter("kefuname"));
			request.getSession().setAttribute("khstate",request.getParameter("khstate"));	
			request.getSession().setAttribute("jieday",data.getJieday());
			request.getSession().setAttribute("jieguo",data.getJieguo());
			request.getSession().setAttribute("jiename",data.getJiename());
			request.getSession().setAttribute("scday",data.getScday());
			request.getSession().setAttribute("wenti",data.getWenti());
			request.getSession().setAttribute("yuday",data.getYuday());
		}
		String khstate= (String) request.getSession().getAttribute("khstate");
		if(khstate!=null&&khstate.length()>0) {
			params.put("khstate", khstate);
		}
		String jieday= (String) request.getSession().getAttribute("jieday");
		if(jieday!=null&&jieday.length()>0) {
			params.put("jieday", jieday);
		}
		String jieguo= (String) request.getSession().getAttribute("jieguo");
		if(jieguo!=null&&jieguo.length()>0) {
			params.put("jieguo", jieguo);
		}
		String jiename= (String) request.getSession().getAttribute("jiename");
		if(jiename!=null&&jiename.length()>0) {
			params.put("jiename", jiename);
		}
		String scday= (String) request.getSession().getAttribute("scday");
		if(scday!=null&&scday.length()>0) {
			params.put("scday", scday);
		}
		String wenti= (String) request.getSession().getAttribute("wenti");
		if(wenti!=null&&wenti.length()>0) {
			params.put("wenti", wenti);
		}
		String yuday= (String) request.getSession().getAttribute("yuday");
		if(yuday!=null&&yuday.length()>0) {
			params.put("yuday", yuday);
		}
		String kuhuname= (String) request.getSession().getAttribute("kuhuname");
		if(kuhuname!=null&&kuhuname.length()>0) {
			params.put("kuhuname", kuhuname);
		}
		String kehuaddres= (String) request.getSession().getAttribute("kehuaddres");			
		if(kehuaddres!=null&&kehuaddres.length()>0) {
			params.put("kehuaddres", kehuaddres);
		}
		String kehuday= (String) request.getSession().getAttribute("kehuday");			
		if(kehuday!=null&&kehuday.length()>0) {
			params.put("kehuday", kehuday);
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
		List all = khhuiDao.like(params);
		pager.setData(all);
		pager.setIndex(pageNO);
		request.getSession().setAttribute("pageNO",pager.getIndex());
		pager.setPageSize(40);
		pager.setTotal(khhuiDao.getlikeTotal(params));
		pager.setPath("like?");
		request.setAttribute("pager", pager);
		return "client/gen/showlike";
	}	
	//导出跟进记录
    @RequestMapping(value = "/xls")
    @ResponseBody
    public void xls(HttpServletRequest request,HttpServletResponse response) throws Exception {				
		Map params = new HashMap();				
		String scday=request.getParameter("scday");
		if (scday!=null) {
			params.put("scday",scday);
		}
		String kehuday=request.getParameter("kehuday");
		if (kehuday!=null) {
			params.put("kehuday",kehuday);
		}
		List<KhHui> xls=khhuiDao.xls(params);	
	    //excel标题
	    String[] title = {"客户名","区域","地址","电话","类别","房屋情况","开工时间","微信","渠道","状态","客户需求","客户情况备注",
	        		 "记录人","记录时间","房屋面积","装修情况","预计价格","接待人",	        		 
	        		 "跟进生成时间","跟进问题 ","跟进结果  ","跟进时间 ","跟进人","预计时间"};
	        //excel文件名
	    String fileName = "客户跟进详情数据.xls";
	        //sheet名
	        String sheetName = "跟进详情数据";	         
	        String [][] content = new String[xls.size()][];
	        for (int i = 0; i < xls.size(); i++) {
	        	content[i] = new String[title.length];
	        	KhHui book = xls.get(i);
	            content[i][0] = String.valueOf(book.getKhClientinfo().getKuhuname());
	            if (book.getKhClientinfo().getQu()!=null) {
	            	content[i][1] = String.valueOf(book.getKhClientinfo().getQu());
				}

	            if (book.getKhClientinfo().getKehuaddres()!=null) {
	            	content[i][2] = String.valueOf(book.getKhClientinfo().getKehuaddres());
				}
	            if (book.getKhClientinfo().getKehutel()!=null) {
	            	content[i][3] = String.valueOf(book.getKhClientinfo().getKehutel());
				}
	            if (book.getKhClientinfo().getKehulei()!=null) {
	            	content[i][4] = String.valueOf(book.getKhClientinfo().getKehulei());
				}	            
	            if (book.getKhClientinfo().getKehugenre()!=null) {
	            	content[i][5] = String.valueOf(book.getKhClientinfo().getKehugenre());
				}
	            if (book.getKhClientinfo().getKaiday()!=null) {
	            	content[i][6] = String.valueOf(book.getKhClientinfo().getKaiday());
				}	            
	            if (book.getKhClientinfo().getWeixin()!=null) {
	            	content[i][7] = String.valueOf(book.getKhClientinfo().getWeixin());
				}
	            if (book.getKhClientinfo().getChannel()!=null) {
	            	content[i][8] = String.valueOf(book.getKhClientinfo().getChannel());
				}
	            if (book.getKhClientinfo().getKhstate()!=null) {
	            	content[i][9] = String.valueOf(book.getKhClientinfo().getKhstate());
				}
	            if (book.getKhClientinfo().getXu()!=null) {
	            	content[i][10] = String.valueOf(book.getKhClientinfo().getXu());
				}
	            if (book.getKhClientinfo().getKhremark()!=null) {
	            	content[i][11] = String.valueOf(book.getKhClientinfo().getKhremark());
				}
	            if (book.getKhClientinfo().getKefuname()!=null) {
	            	content[i][12] = String.valueOf(book.getKhClientinfo().getKefuname());
				}
	            if (book.getKhClientinfo().getKehuday()!=null) {
	            	content[i][13] = String.valueOf(book.getKhClientinfo().getKehuday());
				}	
	            if (book.getKhClientinfo().getSize()!=null) {
	            	content[i][14] = String.valueOf(book.getKhClientinfo().getSize());
				}
	            if (book.getKhClientinfo().getAn()!=null) {
	            	content[i][15] = String.valueOf(book.getKhClientinfo().getAn());
				}
	            if (book.getKhClientinfo().getYumoney()!=null) {
	            	content[i][16] = String.valueOf(book.getKhClientinfo().getYumoney());
				}
	            if (book.getKhClientinfo().getJiename()!=null) {
	            	content[i][17] = String.valueOf(book.getKhClientinfo().getJiename());
				}
	            if (book.getScday()!=null) {
	            	content[i][18] = String.valueOf(book.getScday());
				}
	            if (book.getWenti()!=null) {
	            	content[i][19] = String.valueOf(book.getWenti());
				}
	            if (book.getJieguo()!=null) {
	            	content[i][20] = String.valueOf(book.getJieguo());
				}
	            if (book.getJieday()!=null) {
	            	content[i][21] = String.valueOf(book.getJieday());
				}
	            if (book.getJiename()!=null) {
	            	content[i][22] = String.valueOf(book.getJiename());
				}
	            if (book.getYuday()!=null) {
	            	content[i][23] = String.valueOf(book.getYuday());
				}
	           
	        }
	         //创建HSSFWorkbook
	        HSSFWorkbook wb = Tools.getHSSFWorkbook(sheetName, title, content, null);
	        //响应到客户端
	        try {
	            this.setResponseHeader(response, fileName);
	            // 创建输出流  
		        OutputStream os = response.getOutputStream();            
	            wb.write(os);
	            os.flush();
	            os.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	}
	//发送响应流方法(excel表下载相关配置不让乱码)
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes("UTF-8"),"UTF-8");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }	
}
