package com.ft.extraday.dao;

import com.ft.extraday.entity.SKU;

public class SKUDAO extends BaseDAO<SKU>{

	public SKU selectById(Integer sku_id) {
		String sql="select * from t_sku where f_sku_id=?";
		Object[] objects=new Object[] {sku_id};
		return queryList(sql, objects, SKU.class).get(0);
		
	}

	public void updateInventory(Integer sku_id, Integer good_count) {
		
		String sql="update t_sku set f_inventory=f_inventory-? where f_sku_id=?";
		Object[] objects=new Object[] {good_count,sku_id};
		super.update(sql, objects);
		
	}
	
}
