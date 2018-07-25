package com.ft.extraday.dao;

import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.Area;

public class AreaDAO extends BaseDAO<Area>{
	//初始化下拉框省、市、县
		public List<Area>  showProvince(Integer areaParentID){
		String sql = "select area_name,id from t_area where area_parent_id=?";
		System.out.println(sql);
		Object[] objects = new Object[]{areaParentID};
		System.out.println(objects.length);
		List<Area> list = super.queryList(sql, objects,Area.class);
		
		return list;

		}
		
		
		public Map<String, Object> selectById(Integer id){
			String sql="select p.id,p.area_name FROM t_area c,t_area " + 
					"WHERE c.area_parent_id=p.id " + 
					"AND c.id=?";
			Object[] objects=new Object[] {id};
			return super.queryList(sql, objects).get(0);
			
			
			
		}


		public String selectNameById(Integer cid) {
			// TODO Auto-generated method stub
			String sql="select area_name from t_area where id=?";
			Object[] objects=new Object[] {cid};
			return super.queryList(sql, objects, Area.class).get(0).getArea_name();
			
		}
		
		
		

}
