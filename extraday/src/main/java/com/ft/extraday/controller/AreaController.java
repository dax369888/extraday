package com.ft.extraday.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.ft.extraday.service.AreaService;

public class AreaController {
	private AreaService areaService = new AreaService();
	//显示省市区
	public void showProvince(HttpServletRequest request,HttpServletResponse response) throws IOException{
	Map<String, Object> map0 = new HashMap<String, Object>();
		
		String areaParentID = request.getParameter("areaParentID");

		Map<String, Object> map = new HashMap<String, Object>();
		map= areaService.showProvince(Integer.valueOf(areaParentID));
		map0.put("a",map);
		System.out.println(JSON.toJSONString(map));
		response.getWriter().write(JSON.toJSONString(map));
//		System.out.println(JSON.toJSONString(map));
	}

}
