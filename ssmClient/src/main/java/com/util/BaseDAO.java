package com.util;

import java.sql.*;

import java.util.*;
import com.util.DBManager;

public class BaseDAO {
	Connection con;
	PreparedStatement pst;
	//封装增,删,改的操作
	public void operate(String sql,Object[] params) {
		try {
			con = DBManager.getCon();
			pst = con.prepareStatement(sql);
			if(params!=null){
				for(int i = 0;i<params.length;i++){
					pst.setObject(i+1, params[i]);
				}
			}
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.closeCon(con);
		}
	}
	
	//对查询操作的封装
	public List find(String sql,Object[] params){
		List all = new ArrayList();
		try {
			con = DBManager.getCon();
			pst = con.prepareStatement(sql);
			if(params!=null){
				for(int i = 0;i<params.length;i++){
					pst.setObject(i+1, params[i]);
				}
			}
			ResultSet rst = pst.executeQuery();
			int num = rst.getMetaData().getColumnCount();
			//将表的每一行数据装进数组,再把数组装进集合
			while(rst.next()){
				Object[] data = new Object[num];
				for(int i = 0;i<num;i++){
					data[i] = rst.getObject(i+1);
				}
				all.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.closeCon(con);
		}
		return all;
	}
	
	
	//对返回单条的查询操作的封装
	public Object[] findSingle(String sql,Object[] params){
		Object[] data = null;
		try {
			con = DBManager.getCon();
			pst = con.prepareStatement(sql);
			if(params!=null){
				for(int i = 0;i<params.length;i++){
					pst.setObject(i+1, params[i]);
				}
			}
			ResultSet rst = pst.executeQuery();
			int num = rst.getMetaData().getColumnCount();
			//将表的每一行数据装进数组,再把数组装进集合
			if(rst.next()){
				data = new Object[num];
				for(int i = 0;i<num;i++){
					data[i] = rst.getObject(i+1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.closeCon(con);
		}
		return data;
	}
}
