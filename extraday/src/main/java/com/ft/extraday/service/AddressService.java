package com.ft.extraday.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ft.extraday.dao.AddressDAO;
import com.ft.extraday.entity.Address;

public class AddressService {
	private AddressDAO addressdao=new AddressDAO();
	//显示已有地址
	public List<Map<String, Object>> showAddress(Integer id){
		List<Map<String, Object>> lists = addressdao.queryList(id);
		int size = lists.size();
		for(int i = 0; i<size; i++){
			String parentIdStr = lists.get(i).get("f_region_id").toString();
			Integer parentId = Integer.valueOf(parentIdStr);
			Map<String, Object> addressNames = addressdao.findAddress(parentId);
			lists.get(i).putAll(addressNames);
		}
		System.out.println(lists);
		return lists;
	}
	//添加地址
	public Map<String, Object> addAddress(Integer regionID,Integer id,String recName,String addressDet,String recMobile){
        Map<String, Object>map = new HashMap<String, Object>();
        Integer result = addressdao.addAddress(regionID,id,recName,recMobile,addressDet);
		System.out.println(result);
		map.put("address", result);
		return map;
	}

}
