package com.ft.extraday.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.alibaba.fastjson.JSON;
import com.ft.extraday.entity.Address;
import com.ft.extraday.entity.Users;
import com.ft.extraday.service.AddressService;

public class AddressController {
	private AddressService addressService = new AddressService();
	//显示客户地址
	public void showAddress(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println(map);
		String userid = request.getParameter("useId");
//		Address address = new Address();
//		address.setF_user_id(userid);
		List<Map<String, Object>> list = addressService.showAddress(Integer.valueOf(userid));
		/*Map<String, Object> map=new HashMap<String, Object>();
	map.put("address",list);*/
		
//		request.getSession().setAttribute("address", map);
		//转为json格式
		System.out.println(JSON.toJSONString(list));
		response.getWriter().write(JSON.toJSONString(list));
	}
	//添加地址
	public void addAddress(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(map);
		
		String addressDet = request.getParameter("addressDet");
		String recName = request.getParameter("recName");
		String recMobile = request.getParameter("recMobile");
		String regionID = request.getParameter("townID");
		String id = request.getParameter("userId");
		System.out.println(id);
		System.out.println(recName);
		System.out.println(addressDet);
		System.out.println(recMobile);
		System.out.println(regionID);
		
		//id,addressDet,recName,recMobile,regionID
		map  = addressService.addAddress(Integer.valueOf(regionID),Integer.valueOf(id),recName,recMobile,addressDet);
		System.out.println(map);
		//转为json格式
		response.getWriter().write(JSON.toJSONString(map));
	}

}
