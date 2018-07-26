package com.ft.extraday.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ft.extraday.dao.CartDAO;
import com.ft.extraday.dao.OrderDAO;
import com.ft.extraday.dao.OrderItemDAO;
import com.ft.extraday.dao.SKUDAO;
import com.ft.extraday.entity.Order;
import com.ft.extraday.entity.OrderItem;
import com.ft.extraday.util.PageUtil;

public class OrderService {
		private SKUDAO skudao=new SKUDAO();
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

	public PageUtil selectByOstatus(Integer uid, Integer ostatus, Integer index, Integer pageSize) {
		
	//第一步：根据uid,ostatus从order表和地址表中拿到相关信息
	List<Map<String, Object>> orderList=orderDAO.selectByOstatus(uid,ostatus,index,pageSize);
	Integer count=orderDAO.getCount(uid,ostatus);
	//第二步：根据order_id从Order_item表中拿到订单的相关商品信息
	for (int i = 0; i < orderList.size(); i++) {
		
		Integer order_id=(Integer)(orderList.get(i).get("f_order_id"));
		List<Map<String, Object>> listSku=new ArrayList<Map<String,Object>>();
		listSku=orderItemDAO.selectByOid(order_id);
		orderList.get(i).put("list", listSku);
	}
	PageUtil pageUtil=new PageUtil(index,pageSize,count);
	pageUtil.setList(orderList);
	return pageUtil;
		
	}

	public void alterInventoryById(Integer sku_id, Integer good_count) {
		skudao.updateInventory(sku_id,good_count);
		
	}

}
