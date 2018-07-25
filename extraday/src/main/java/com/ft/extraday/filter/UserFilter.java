package com.ft.extraday.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserFilter implements Filter {

	
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		System.out.println(url);
		if (url.indexOf("Prodeng")>0) {
			System.out.println("鏀捐");
			arg2.doFilter(request, response);
			return;
		}
		Object obj = session.getAttribute("user");
		if (obj == null) {
			response.sendRedirect("/oa/Prodeng.jsp");
		}else{
			arg2.doFilter(request, response);
		}
		
		
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("杩囨护鍣ㄥ垵濮嬪寲");
		
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
