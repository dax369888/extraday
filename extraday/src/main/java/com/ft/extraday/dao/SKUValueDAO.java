package com.ft.extraday.dao;

import java.util.List;

import com.ft.extraday.entity.SKUAttr;

public class SKUValueDAO extends BaseDAO<SKUAttr>{

	public List<SKUAttr> selectSku(Integer spu_id, Object[] skus) {
		
		String sql="select DISTINCT t_sku_val.f_sku_id FROM t_sku_val,t_sku" + 
				" where t_sku.f_spu_id=?" + 
				" and t_sku_val.f_sku_id=t_sku.f_sku_id";
		Object[] objects=new Object[skus.length+1]; 
		objects[0]=spu_id;
		
		for (int i = 0; i < skus.length; i++) {
			if (i==skus.length-1) {
				sql+=" AND t_sku_val.f_sku_id IN (select f_sku_id FROM t_sku_val where f_value_id=?))";				
			}
			else {
				sql+=" AND t_sku_val.f_sku_id IN (select f_sku_id FROM t_sku_val where f_value_id=?";
			}
			objects[i+1]=skus[i];
		}
		System.out.println(sql);
		
		
		return super.queryList(sql, objects, SKUAttr.class);
	}
	
	
	
}
