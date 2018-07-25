package com.ft.extraday.controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ft.extraday.util.StringHelper;

public class BaseController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");


		String url=request.getRequestURI();
		
		String controllerHead=url.substring(0, url.lastIndexOf("/"));	
		
		
		controllerHead=controllerHead.substring(controllerHead.lastIndexOf("/")+1);
		
		String doFunction=url.substring(url.lastIndexOf("/")+1,url.lastIndexOf("."));
		
		String controllerName=StringHelper.upperCase(controllerHead)+"Controller";
		
		try {
			
			Class clazz=Class.forName("com.ft.extraday.controller."+controllerName);
			System.out.println(clazz);
			Object obj=clazz.newInstance();
			Method method=clazz.getDeclaredMethod(doFunction,HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(obj,request,response);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}	
	}
	
	
	
}
