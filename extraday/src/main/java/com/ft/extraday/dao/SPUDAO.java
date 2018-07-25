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

	
	
}
