package com.ft.extraday.util;

public class StringHelper {
	
	
	//����ĸ��д����
	public static String upperCase(String str) {
		
		char[] ch=str.toCharArray();
		
		if (ch[0] >= 'a' && ch[0] <= 'z') {
	        ch[0] = (char) (ch[0] - 32);
	    }
		
		return new String(ch);
		
	}
	
}
