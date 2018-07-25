package com.ft.extraday.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alipay.api.domain.Data;
import com.ft.extraday.entity.Users;
import com.ft.extraday.service.UserService;
import com.ft.extraday.util.MobileMessageCheck;
import com.ft.extraday.util.MobileMessageSend;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;

public class UserController {
	UserService userService = new UserService();
	//登陆方法
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		System.out.println(username);
		String password = request.getParameter("pswd");
		System.out.println(password);
		Map<String, Object> map = userService.login(username, password);
		Users user=(Users) map.get("user");
		if(user!=null){
			request.getSession().setAttribute("user", map.get("user"));
		}
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);		
		//			if (map.get("user") != null) {
		//				request.getSession().setAttribute("user", map.get("user")); 
		//				response.sendRedirect("/extraday/index.jsp");
		//			} else {
		//				request.getSession().setAttribute("msg", map.get("msg"));
		//				response.sendRedirect("/extraday/login.jsp");
		//			}
	}

	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username=request.getParameter("mobile");
		String password=request.getParameter("pswd");
		Map<String, Object> map=userService.register(username, password);
		request.getSession().setAttribute("user", map.get("user"));
		String json = JSON.toJSONString(map);
		System.out.println(json);
		response.getWriter().write(json);
	}

	//检测方法
	public void checkUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		boolean valid = userService.isValid(username);
		Map<String, Object> map = new HashMap<String, Object>();
		if (valid) {
			map.put("msg", 1);
			//			1代表"账号可用"
		} else {
			map.put("msg", 0);
			//			0代表"账号不可用"
		}

		String json = JSON.toJSONString(map);
		response.getWriter().write(json);
	}

	public void sendMsg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String msgStatus=MobileMessageSend.sendMsg(username);

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("msgStatus", msgStatus);		
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);

	}

	public void checkMsg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String code=request.getParameter("code");

		String msgOk=MobileMessageCheck.checkMsg(username, code);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("msgOk", msgOk);

		String json = JSON.toJSONString(map);
		response.getWriter().write(json);		
	}
	
	//退出方法
	public void logout(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.getSession().removeAttribute("user");
		response.sendRedirect("/extraday/login.jsp");
	}
	
	//获取客户信息
	public void getInfo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String username=request.getParameter("users");
		UserService service=new UserService();		
		Map<String, Object> map=new HashMap<String, Object>();
		map=service.getInfo(username);
		//request.getSession().setAttribute("info", map);//map是service层里面方法的返回值，是map集合
		//把Map集合转为字符串
		response.getWriter().write(JSON.toJSONString(map));	
		
		System.out.println(JSON.toJSONString(map));
		System.out.println(1);
	}
	
	//编辑资料
	public void addInfo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, NumberFormatException, ParseException {
		
		String userId=request.getParameter("users");		
		String name=request.getParameter("username");
		String sex=request.getParameter("userSex");
		String year=request.getParameter("userYear");
		String month=request.getParameter("userMonth");
		String day=request.getParameter("userDay");
		String email=request.getParameter("userEmail");
		UserService service=new UserService();
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(name);
		System.out.println(sex);
		String string =year+"-"+month+"-"+day;
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(sdf.parse(string));
		System.out.println(new Date());
		Integer res=service.addInfo(Integer.valueOf(userId),name,Integer.valueOf(sex),sdf.parse(string),email);
		response.getWriter().write(JSON.toJSONString(res));		
		System.out.println(JSON.toJSONString(res));
	}
}
