package com.ft.extraday.dao;

import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.SPUSaleAttr;
import com.ft.extraday.entity.Spu;

public class SPUDAO extends BaseDAO<Spu>{

	public List<Spu> queryList(){
		String sql="select * from t_spu where f_show_index=?";
		System.out.println(sql);
		Object[] objects=new Object[]{1};
		System.out.println(objects.length);
		List<Spu> list=super.queryList(sql,objects,Spu.class);
		return list;
	}

	public Spu selectById(Integer spu_id) {
		String sql="select * from t_spu where f_id=?";
		Object[] objects=new Object[] {spu_id};
		return super.queryList(sql, objects, Spu.class).get(0);
	}

	public List<Map<String, Object>> getSpuByString(String string, Integer index, Integer pageSize) {
	
		String sql="select DISTINCT t_spu.* FROM t_spu,t_sku WHERE t_sku.f_spu_id=t_spu.f_id AND (f_good_detail LIKE CONCAT('%',?,'%') OR f_sku_name LIKE CONCAT('%',?,'%'))";		
		sql+=" limit "+(index-1)*pageSize+","+pageSize;
		Object[] objects=new Object[] {string,string};
		return super.queryList(sql, objects);
		
		
	}

	public Integer getSpuByStringCount(String string) {
		String sql="select count(*) sum from (select DISTINCT t_spu.* FROM t_spu,t_sku WHERE t_sku.f_spu_id=t_spu.f_id AND (f_good_detail LIKE CONCAT('%',?,'%') OR f_sku_name LIKE CONCAT('%',?,'%'))) spus";		
		Object[] objects=new Object[] {string,string};
		return Integer.valueOf((super.queryList(sql, objects)).get(0).get("sum").toString());
		
	}

	public List<Map<String, Object>> getSpuByCid(Integer cid, Integer index, Integer pageSize) {
		String sql="select * from t_spu,t_category where t_category.f_category_id=? and t_category.f_category_id=t_spu.f_category_id"; 
		sql+=" limit "+(index-1)*pageSize+","+pageSize;
		Object[] objects=new Object[] {cid};
		return super.queryList(sql, objects);
	}
	
	
	public Integer getSpuByCidCount(Integer cid) {
		String sql="select count(*) sum from t_spu,t_category where t_category.f_category_id=? and t_category.f_category_id=t_spu.f_category_id"; 
		Object[] objects=new Object[] {cid};
		return Integer.valueOf((super.queryList(sql, objects)).get(0).get("sum").toString());
		
	}
	

	
	
}
