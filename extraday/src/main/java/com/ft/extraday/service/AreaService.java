package com.ft.extraday.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ft.extraday.dao.AreaDAO;
import com.ft.extraday.entity.Area;

public class AreaService {
	private AreaDAO areadao = new AreaDAO();
   //省市区下拉框
	public Map<String, Object> showProvince(Integer areaParentID){
		Map<String,Object>map = new HashMap<String, Object>();
		List<Area> lists = areadao.showProvince(areaParentID);
		System.out.println(lists);
		for (int i = 0; i < lists.size(); i++) {
			map.put(String.valueOf(lists.get(i).getId()),lists.get(i).getArea_name());
		}
		System.out.println(map);
		return map;
	}
	
	//根据区id获得省市区的方法
	
	public Map<String, Object> getAreaById(Integer cid){
		//返回值是省市区对应的Map。
		Map<String, Object> map=new HashMap<String, Object>();
		
		
		
		String PCC="";
		//先获得区的名字
		String country=areadao.selectNameById(cid);
		//表自联获得市的名字
		Map<String, Object> mapBase=areadao.selectById(cid);
		String city=(String)mapBase.get("area_name");
		//再根据市的Id获得省的名字
		mapBase=areadao.selectById((Integer)mapBase.get("id"));
		String province=(String)mapBase.get("area_name");
		
		PCC=province+"-"+city+"-"+"-"+country;
		//返回区和省市区的键值映射对
		map.put(String.valueOf(cid), PCC);
		System.out.println(PCC);
		return map;
		
	}
	

}
