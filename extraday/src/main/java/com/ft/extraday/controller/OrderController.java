package com.ft.extraday.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.ft.extraday.entity.Order;
import com.ft.extraday.entity.OrderItem;
import com.ft.extraday.entity.Users;
import com.ft.extraday.service.OrderService;
import com.ft.extraday.util.PageUtil;

public class OrderController {
	private OrderService orderService=new OrderService();
	
	
	public void createOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//创建订单
		Integer user_id=((Users)request.getSession().getAttribute("user")).getF_user_id();
		Double sum_price=Double.valueOf(request.getParameter("sum_price"));
		Integer address_id=Integer.valueOf(request.getParameter("address_id"));
		String order_code=request.getParameter("order_code");
		Order order=orderService.createOrder(user_id,sum_price,address_id,order_code);
		
		//将前面session中存取的payList的值放进orderItem中
		
		List<Map<String, Object>> list=(List<Map<String, Object>>)request.getSession().getAttribute("payList");
		System.out.println(list);
		//从上面生成 的订单中拿到订单号
		Integer order_id=order.getF_order_id();
		
		for (int i = 0; i < list.size(); i++) {
			OrderItem orderItem=new OrderItem();
			//sku_id,good_count,item_sum_price，从session中取出 		
			Integer sku_id=(Integer)(list.get(i).get("f_sku_id"));
			Integer good_count=(Integer)(list.get(i).get("f_count"));
			Double price=(Double)(list.get(i).get("f_price"));
			Double item_sum_price=good_count*price;
			orderItem.setF_good_count(good_count);
			orderItem.setF_item_sum_price(item_sum_price);
			orderItem.setF_order_id(order_id);
			orderItem.setF_SKU_id(sku_id);
			
			
			Integer res1=orderService.initOrder(orderItem);
			//加入订单之后减少库存	
				
				orderService.alterInventoryById(sku_id,good_count);
				orderService.deleteCartItemBy(sku_id,user_id);
		
			
			
		}
		//生成订单后清除购物车中的session
		request.getSession().removeAttribute("payList");
		
		System.out.println(JSON.toJSONString(order));
		response.getWriter().write(JSON.toJSONString(order));
		
	}
	
	public void paySuccess(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//支付成功
		
		Integer oid=Integer.valueOf(request.getParameter("oid"));
		Integer result=orderService.payOrder(oid);
		response.getWriter().write(JSON.toJSONString(result));
		
	}
	
	public void getOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		Integer uid=Integer.valueOf(request.getParameter("userID"));
			
		System.out.println(uid);
		String indexStr=request.getParameter("index");
		Integer index=Integer.valueOf(indexStr);
		
		System.out.println(index);
		Integer ostatus=Integer.valueOf(request.getParameter("ostatus"));
		PageUtil orders=orderService.selectByOstatus(uid,ostatus,index,3);
		System.out.println(orders);
		response.getWriter().write(JSON.toJSONString(orders));
		
		
	
	}
	
	
	
	
}
