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
import com.alipay.api.domain.Category;
import com.ft.extraday.entity.SKU;
import com.ft.extraday.entity.SPUImg;
import com.ft.extraday.entity.Spu;
import com.ft.extraday.entity.Users;
import com.ft.extraday.service.GoodService;
import com.ft.extraday.util.PageUtil;

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
	

	public void getGoodsBySku(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		
		Integer sku_id=Integer.valueOf(request.getParameter("sku_id"));
		Integer spu_id=goodService.getSpuIdBySku(sku_id);
		response.getWriter().write(JSON.toJSONString(spu_id));
		
	
	}
	
	
	//需要与getSpuCom整合，有大量冗余
	public void searchByStr(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map=new HashMap<String, Object>();
		//接收搜索的字符串
		String string=request.getParameter("search");
		Integer index=Integer.valueOf(request.getParameter("index"));
		String cidStr=request.getParameter("cid");
		System.out.println(string);
		
		PageUtil pageUtil;
		Integer cid=null;
		if (cidStr=="") {
			pageUtil=goodService.getSpuByString(string,index,5);
			cid=Integer.valueOf(pageUtil.list.get(0).get("f_category_id").toString());			
		}else {
			cid=Integer.valueOf(cidStr);
			pageUtil=goodService.getSpuByCid(cid,index,5);
		}
		System.out.println(cid);
		List<Object> list=new ArrayList<Object>();
		for (int i = 0; i < pageUtil.list.size(); i++) {
			list.add(pageUtil.list.get(i).get("f_id"));
			}
		System.out.println(list);
		Map<String, Object> attrList=goodService.getAttrById(cid,string,list);
		
		map.put("attrList", attrList);
		
		map.put("pageUtil", pageUtil);
		//得到物品的种类
	/*	Integer cid=Integer.valueOf(pageUtil.list.get(0).get("f_category_id").toString());
		System.out.println(cid);
		*/
		
		System.out.println(JSON.toJSONString(map));
		response.getWriter().write(JSON.toJSONString(map));
		
	}
	
	public void getSpuCom(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map=new HashMap<String, Object>();
		Integer cid=Integer.valueOf(request.getParameter("cid"));
		String str=request.getParameter("str");
		Integer index=Integer.valueOf(request.getParameter("index"));
		Object[] valueID=request.getParameterValues("valueID");
		
		PageUtil pageUtil=goodService.getSpuBase(cid,str,valueID,index,5);
		map.put("pageUtil", pageUtil);
		
		List<Object> list=new ArrayList<Object>();
		for (int i = 0; i < pageUtil.list.size(); i++) {
			list.add(pageUtil.list.get(i).get("f_id"));
			}
		System.out.println(list);
		Map<String, Object> attrList=goodService.getAttrById(cid,str,list);
		map.put("attrList", attrList);
	
		System.out.println(JSON.toJSONString(map));
		response.getWriter().write(JSON.toJSONString(map));
		
		
	}
}
