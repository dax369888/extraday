package com.ft.extraday.dao;

import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.Cart;
import com.ft.extraday.entity.SKU;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class CartDAO extends BaseDAO<Cart>{

	public Integer insertCart(Integer sku_id,Integer uid,Integer count) {
		
		String sql="insert into t_cart(f_sku_id,f_user_id,f_count) values(?,?,?)";
		Object[] objects=new Object[] {sku_id,uid,count};
		return super.update(sql, objects);
		
	}
	
	public List<Cart> query(Integer sku_id,Integer uid){
		
		String sql="select * from t_cart where f_sku_id=? and f_user_id=?";
		Object[] objects=new Object[] {sku_id,uid};
		return super.queryList(sql, objects, Cart.class);
		
		
	}

	public Integer updateCart(Integer sku_id, Integer uid, Integer count) {
		// TODO Auto-generated method stub
		
		String sql="update t_cart set f_count=f_count+? where f_sku_id=? and f_user_id=?";
		Object[] objects=new Object[] {count,sku_id,uid};
		return super.update(sql, objects);
	}

	public List<Map<String, Object>> selectByUid(Integer uid) {
		
		String sql="select * from t_cart,t_sku where t_cart.f_sku_id=t_sku.f_sku_id AND t_cart.f_user_id=?";
		Object[] objects=new Object[]{uid};
		return super.queryList(sql, objects);
	}
	
	/*public Integer updateF_status(Integer uid,Integer sku_id) {
		String sql="update t_cart set f_status=2 where f_sku_id=? and f_user_id=?";
		Object[] objects=new Object[]{sku_id,uid};
		return super.update(sql, objects);
	}*/
	public List<Map<String, Object>> selectBy(Integer uid,Integer sku_id){
		String sql="select * from t_cart,t_sku where t_cart.f_sku_id=t_sku.f_sku_id AND t_cart.f_user_id=? and t_cart.f_sku_id=?";
		Object[] objects=new Object[] {uid,sku_id};
		return super.queryList(sql, objects);
	}

	public void deleteItem(Integer sku_id, Integer user_id) {
		
		String sql="delete from t_cart where f_sku_id=? and f_user_id=?";
		Object[] objects=new Object[] {sku_id,user_id};
		super.update(sql, objects);
		
		
	}
	
	
}
