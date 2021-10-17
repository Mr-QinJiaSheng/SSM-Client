package com.util;

import java.io.Reader;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	static SqlSession sqlSession;
	static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("config.xml");
		    factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSession getSqlSession() {
		try {
              if(factory!=null) {
            	  sqlSession = factory.openSession(true);
              }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSession;
	}
	
	public static void closeSqlSession(SqlSession sqlSession) {
		try {
			if(sqlSession!=null) {
				sqlSession.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
