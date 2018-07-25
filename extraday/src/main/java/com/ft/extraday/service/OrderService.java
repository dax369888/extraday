package com.ft.extraday.service;

import java.util.List;
import java.util.Map;

import com.ft.extraday.dao.CartDAO;
import com.ft.extraday.dao.OrderDAO;
import com.ft.extraday.dao.OrderItemDAO;
import com.ft.extraday.entity.Order;
import com.ft.extraday.entity.OrderItem;

public class OrderService {

		private OrderDAO orderDAO=new OrderDAO();
		private OrderItemDAO orderItemDAO=new OrderItemDAO();
		private CartDAO cartDAO=new CartDAO();
	public Order createOrder(Integer user_id, Double sum_price, Integer address_id, String order_code) {
		Order newOrder;
		Integer result=orderDAO.insertOrderByNewOrder(user_id,sum_price,address_id,order_code);
		if (result>0) {
			
			newOrder=orderDAO.selectByOrderCode(order_code);
			return newOrder;
			
		}
		return null;
		
	}

	public Integer initOrder(OrderItem orderItem) {
		
		return orderItemDAO.insert(orderItem);
		
		
		
	}

	public Integer payOrder(Integer oid) {
		return orderDAO.updateByid(oid);
		
	}

	public void deleteCartItemBy(Integer sku_id, Integer user_id) {
		cartDAO.deleteItem(sku_id,user_id);
		
	}

	public List<Map<String, Object>> selectByOstatus(Integer uid, Integer ostatus) {
		
	return orderDAO.selectByOstatus(uid,ostatus);
		
		
	}

}
