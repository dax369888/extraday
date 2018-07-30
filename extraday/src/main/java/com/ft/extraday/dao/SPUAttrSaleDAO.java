package com.ft.extraday.dao;

import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.SPUSaleAttr;

public class SPUAttrSaleDAO extends BaseDAO<SPUSaleAttr>{

	//根据spu获得销售属性
	
	public List<Map<String, Object>> getAttrById(Integer spu_id){
		
		String sql="select * from t_spu_attr_sale,t_attribute where f_spu_id=? " + 
				"AND t_spu_attr_sale.f_attr_id=t_attribute.f_attr_id";
		Object[] objects=new Object[] {spu_id};
		return super.queryList(sql, objects);
	}
	//根据spu和销售属性获得对应的销售属性值的集合
	public List<Map<String, Object>> getValue(Integer spu_id,Integer attr_id){
		String sql="select DISTINCT tpas.f_attr_id,tkv.f_value_id,t_vaule.f_value_name,t_attribute.f_attr_name FROM t_spu_attr_sale tpas,t_sku tk,t_sku_val tkv,t_vaule,t_attribute" + 
				" WHERE tpas.f_spu_id=?" + 
				" AND tpas.f_attr_id=?" + 
				" AND	tpas.f_spu_id=tk.f_spu_id" + 
				" AND tk.f_sku_id=tkv.f_sku_id" + 
				" AND tkv.f_value_id=t_vaule.f_value_id" + 
				" AND t_attribute.f_attr_id=t_vaule.f_attr_id" + 
				" AND tpas.f_attr_id=t_attribute.f_attr_id";
		
		Object[] objects=new Object[] {spu_id,attr_id};
		
		return super.queryList(sql, objects);
		
		
	}
	public List<Map<String, Object>> getAttrBy(Integer cid) {
		
		String sql="select t_c_att.f_attr_id,f_attr_name,f_category_id FROM t_c_att,t_attribute WHERE t_c_att.f_attr_id=t_attribute.f_attr_id and t_c_att.f_category_id=?";
		Object[] objects=new Object[] {cid};
		return super.queryList(sql, objects);
		
		
	}
	public List<Map<String, Object>> getValueByCid(Integer cid, Integer attrId, String string) {
		String sql="select DISTINCT t_attribute.*,t_vaule.f_value_name,t_vaule.f_value_id FROM t_c_att,t_spu,t_spu_val,t_vaule,t_attribute,t_sku,t_sku_val" 
				+" WHERE t_c_att.f_category_id=? AND t_c_att.f_attr_id=?"
				+" AND t_c_att.f_category_id=t_spu.f_category_id"
				+" AND t_vaule.f_attr_id=t_c_att.f_attr_id"
				+" AND t_vaule.f_attr_id=t_attribute.f_attr_id"
				+" AND ((t_spu.f_id=t_spu_val.f_spu_id"
				+" and t_spu_val.f_value_id=t_vaule.f_value_id)"
				+" OR (t_spu.f_id=t_sku.f_spu_id"
				+" AND t_sku.f_sku_id=t_sku_val.f_sku_id"
				+" AND t_sku_val.f_value_id=t_vaule.f_value_id))"
				+" and (f_good_detail LIKE CONCAT('%',?,'%') OR f_sku_name LIKE CONCAT('%',?,'%'))";
		Object[] objects=new Object[] {cid,attrId,string,string};
		return super.queryList(sql, objects);
	}
	
}
