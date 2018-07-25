package com.ft.extraday.util;

public class StringHelper {
	
	
	//首字母大写方法
	public static String upperCase(String str) {
		
		char[] ch=str.toCharArray();
		
		if (ch[0] >= 'a' && ch[0] <= 'z') {
	        ch[0] = (char) (ch[0] - 32);
	    }
		
		return new String(ch);
		
	}
	
}
