package com.ft.extraday.dao;

import java.util.List;

import com.ft.extraday.entity.SPUImg;

public class SPUImgDAO extends BaseDAO<SPUImg>{

	public List<SPUImg> selectImgById(Integer spu_id) {
		String sql="select * from t_goods_pic where f_good_spu_id=?";
		Object[] objects=new Object[] {spu_id};
		return super.queryList(sql, objects, SPUImg.class);
	}

	
	
}
