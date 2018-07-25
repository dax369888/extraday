package com.ft.extraday.dao;

import com.ft.extraday.entity.OrderItem;

public class OrderItemDAO extends BaseDAO<OrderItem>{

	public Integer insert(OrderItem orderItem) {
		String sql="insert into t_order_item(f_order_id,f_SKU_id,f_good_count,f_item_sum_price) values(?,?,?,?)";
		Object[] objects=new Object[] {orderItem.getF_order_id(),orderItem.getF_SKU_id(),orderItem.getF_good_count(),orderItem.getF_item_sum_price()};
		return super.update(sql, objects);
		
	}

}
