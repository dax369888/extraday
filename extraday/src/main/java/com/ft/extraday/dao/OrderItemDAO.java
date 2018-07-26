package com.ft.extraday.dao;

import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.OrderItem;

public class OrderItemDAO extends BaseDAO<OrderItem>{

	public Integer insert(OrderItem orderItem) {
		String sql="insert into t_order_item(f_order_id,f_SKU_id,f_good_count,f_item_sum_price) values(?,?,?,?)";
		Object[] objects=new Object[] {orderItem.getF_order_id(),orderItem.getF_SKU_id(),orderItem.getF_good_count(),orderItem.getF_item_sum_price()};
		return super.update(sql, objects);
		
	}

	public List<Map<String, Object>> selectByOid(Integer order_id) {
		
		String sql="select t_sku.f_sku_name,t_order_item.* FROM t_sku,t_order_item WHERE f_order_id=? AND t_sku.f_sku_id=t_order_item.f_SKU_id";
		Object[] objects=new Object[] {order_id};
		return super.queryList(sql, objects);
	}

}
