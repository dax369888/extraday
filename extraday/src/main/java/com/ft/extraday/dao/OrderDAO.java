package com.ft.extraday.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ft.extraday.entity.Order;

public class OrderDAO extends BaseDAO<Order>{

	public Integer insertOrderByNewOrder(Integer user_id, Double sum_price, Integer address_id, String order_code) {
		String sql="INSERT INTO t_order(f_user_id,f_sum_price,f_address_id,f_order_code,f_order_status,f_create_time) VALUES(?,?,?,?,?,?)";
		Object[] objects =new Object[]{user_id,sum_price,address_id,order_code,1,new Date()};
		
		return super.update(sql, objects);
	}

	public Order selectByOrderCode(String order_code) {
		String sql="select * from t_order where f_order_code=?";
		Object[] objects=new Object[] {order_code};
		
		return super.queryList(sql, objects, Order.class).get(0);
	}

	public Integer updateByid(Integer oid) {
		
		String sql="update t_order set f_order_status=2 where f_order_id=?";
		Object[] objects=new Object[] {oid};
		return update(sql, objects);
		
	}

	public List<Map<String, Object>> selectByOstatus(Integer uid, Integer ostatus, Integer index, Integer pageSize) {
		String sql="select t_order.*,t_address.f_rec_name from t_order,t_address where t_order.f_user_id=? and t_order.f_address_id=t_address.f_addr_id";
		int size=1;
		if (ostatus!=-1) {
			sql+=" and f_order_status=?";
			size++;
		}
		sql+=" limit "+(index-1)*pageSize+","+pageSize;
		Object[] objects=new Object[size];
		objects[0]=uid;
		if (ostatus!=-1) {
			objects[1]=ostatus;
		}
		System.out.println(sql);
		return super.queryList(sql, objects);
	}

	public Integer getCount(Integer uid, Integer ostatus) {

		String sql="select count(1) sum from t_order,t_address where t_order.f_user_id=? and t_order.f_address_id=t_address.f_addr_id";
		int size=1;
		if (ostatus!=-1) {
			sql+=" and f_order_status=?";
			size++;
		}
		Object[] objects=new Object[size];
		objects[0]=uid;
		if (ostatus!=-1) {
			objects[1]=ostatus;
		}
		System.out.println(sql);
		return Integer.valueOf(super.queryList(sql, objects).get(0).get("sum").toString());
		
	}

	
	
	
}



