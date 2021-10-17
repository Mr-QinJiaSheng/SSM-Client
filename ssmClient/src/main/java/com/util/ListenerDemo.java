package com.util;

//监视器
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Controller;

import com.dao.LogMapper;
import com.entity.Log;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class ListenerDemo implements HttpSessionListener,HttpSessionAttributeListener {

	BaseDAO dao=new BaseDAO();
	static int num=0;
	 SimpleDateFormat sia=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public void sessionCreated(HttpSessionEvent arg0) {
		num++;
	}
	public void sessionDestroyed(HttpSessionEvent arg0) {
		num--;
	}
	//将num数据输出
	public static int getOnlineNum(){		
		return num;
	}

	//添加会话是调用
	public void attributeAdded(HttpSessionBindingEvent event) {
		HttpSession session=event.getSession();
		String data=(String)event.getSession().getAttribute("name");
		String relo=(String)event.getSession().getAttribute("relo");
        String id=event.getSession().getId();//取回话id
        Date curDate=new Date();
        if(data==event.getValue()&&data!=null){   
        	dao.operate("insert into log values(null,?,?,?,?,?)",
     				new Object[]{data,sia.format(curDate),null,session.getId(),relo});       	
        }
	}

	//删除会话是调用
	public void attributeRemoved(HttpSessionBindingEvent event) {
        //等同取值
		HttpSession session=event.getSession();
		Object data=event.getValue();		
		Date curDate=new Date();
		dao.operate("update log set exittime=? where sessionid=?",new Object[]{sia.format(curDate),session.getId()});
	}
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
				
	}

}
