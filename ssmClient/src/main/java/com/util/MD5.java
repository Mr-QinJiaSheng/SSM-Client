package com.util;

import java.security.MessageDigest;
/*
 * MD5加密
 */
public class MD5 {
	public static String encrypt(String data) {
		String encrypt = "";
		try {
			// 在程序中选择MD5加密算法
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			//使用MD5加密算法对明文数据进行加密
			byte[] result = messageDigest.digest(data.getBytes());
			//加密后的字节数据数据转换为密文字符串(十六制)
			for(int i = 0;i<result.length;i++){
				encrypt+=Integer.toHexString(result[i] & 0xff);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encrypt.toUpperCase();

	}

}
