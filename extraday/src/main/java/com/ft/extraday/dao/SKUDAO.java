package com.ft.extraday.dao;

import com.ft.extraday.entity.SKU;

public class SKUDAO extends BaseDAO<SKU>{

	public SKU selectById(Integer sku_id) {
		String sql="select * from t_sku where f_sku_id=?";
		Object[] objects=new Object[] {sku_id};
		return queryList(sql, objects, SKU.class).get(0);
		
	}
	
}
