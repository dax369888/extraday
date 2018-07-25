package com.ft.extraday.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.Address;


public class AddressDAO extends BaseDAO<Address>{
	//初始化查询是否已存在地址
	public List<Map<String, Object>> queryList(Integer id){
		String sql="select * from t_address where f_user_id=?";
		System.out.println(sql);
		System.out.println("22222222222222222222222222");
		Object[] objects=new Object[]{id};
		System.out.println(objects.length);
		List<Map<String, Object>> list=super.queryList(sql,objects);
		return list;
	}	
	
	//增加用户地址
		public Integer addAddress(Integer regionID,Integer id,String recName,String addressDet,String recMobile){
			String sql = "insert into t_address(f_is_def,f_region_id,f_user_id,f_rec_name,f_address_det,f_rec_mobile) values(0,?,?,?,?,?)";
//			Object[] objects = new Object[]{id};
			System.out.println(sql);
			Object[] objects = new Object[]{regionID,id,recName,addressDet,recMobile};
		     Integer result = super.update(sql, objects);
			 return result;
			 
		} 
		/**
		 * 循环查询地址
		 */
		public Map<String,Object> findAddress(Integer addressId){
			Map<String,Object> address = new HashMap<String, Object>();
			String sql = "select * from t_area where id = ?";
			Integer index = 3;
			do {
				Object[] objs = new Object[]{addressId};
				List<Map<String, Object>> lists = super.queryList(sql, objs);
				String parent_id = lists.get(0).get("area_parent_id").toString();
				addressId = Integer.valueOf(parent_id);
				address.put(index.toString(), lists.get(0).get("area_name"));
				index--;
			} while (addressId!=0);
			return address;
		}
		public static void main(String[] args) {
			AddressDAO ad = new AddressDAO();
			System.out.println(ad.findAddress(360321));
		}
}
