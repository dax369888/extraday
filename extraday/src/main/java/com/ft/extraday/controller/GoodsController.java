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
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPObject;
import com.ft.extraday.entity.SKU;
import com.ft.extraday.entity.SPUImg;
import com.ft.extraday.entity.Spu;
import com.ft.extraday.entity.Users;
import com.ft.extraday.service.GoodService;

public class GoodsController {
	
	private GoodService goodService =new GoodService();
	
	public void showIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			Map<String, Object> map	=goodService.showSpu();
			System.out.println(map);
			request.getSession().setAttribute("index", map);		
			response.getWriter().write(JSON.toJSONString(map));		
	}

	public void getSpuDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		Integer spu_id=Integer.valueOf(request.getParameter("spu_id"));	
		Map<String, Object> map=new HashMap<String, Object>();
		//根据spu_id获得spu信息
		Spu spu=goodService.getSpuById(spu_id);
		map.put("spu",spu);
		//根据spu_id获得attr信息
		Map<String, List> listAttr=goodService.getAttrById(spu_id);
		map.put("attr", listAttr);
		//根据spu_id获得spuImg
		
		List<SPUImg> listImg=new ArrayList<SPUImg>();
		listImg=goodService.getImgById(spu_id);
		map.put("img", listImg);
/*		System.out.println(JSON.toJSONString(map));
*/		response.getWriter().write(JSON.toJSONString(map));
	}
	public void addCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		Integer user_id=((Users)request.getSession().getAttribute("user")).getF_user_id();
		Integer sku=Integer.valueOf(request.getParameter("sku"));
		Integer count=Integer.valueOf(request.getParameter("count"));
		Integer result=goodService.addCart(user_id,count,sku);
		System.out.println(result);
		response.getWriter().write(JSON.toJSONString(result));
	}
	
	public void getSku(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		Object[] skus=request.getParameterValues("skus");
		Integer spu_id=Integer.valueOf(request.getParameter("spu_id"));
		SKU	sku=goodService.getSku(spu_id,skus);
		System.out.println(JSON.toJSONString(sku));
		response.getWriter().write(JSON.toJSONString(sku));
	}
	
	public void getCartGoods(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer uid=((Users)request.getSession().getAttribute("user")).getF_user_id();
		
		List<Map<String, Object>> list=goodService.getCartByUid(uid);
		System.out.println(JSON.toJSONString(list));
		response.getWriter().write(JSON.toJSONString(list));
		
	}
	
	public void pay(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		
		String[] skus=request.getParameterValues("sku");
		System.out.println(skus);
		Integer uid=((Users)request.getSession().getAttribute("user")).getF_user_id();
		List<Map<String, Object>> list=goodService.getPayList(uid, skus);
		//待支付信息放入session供以后创建订单使用
		request.getSession().setAttribute("payList", list);
		System.out.println(list);
		response.getWriter().write(JSON.toJSONString("1"));
		
		
	}
	
	
	
	
}
