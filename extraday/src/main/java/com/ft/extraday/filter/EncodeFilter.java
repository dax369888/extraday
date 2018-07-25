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
import javax.servlet.jsp.jstl.core.Config;

import org.omg.CORBA.Request;

public class EncodeFilter implements Filter{
	//设定编码格式
	private String encoding=null;
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		  HttpServletRequest request = (HttpServletRequest)req;
		  HttpServletResponse response = (HttpServletResponse)resp;
		
		if (encoding!=null) {
			System.out.println("a1");
			request.setCharacterEncoding(encoding);
			response.setContentType("text/html;charset="+encoding);
			response.setContentType("application/json;charset="+encoding);
			
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		encoding=config.getInitParameter("encoding");
		
		
	}
	
	
	
	
}
