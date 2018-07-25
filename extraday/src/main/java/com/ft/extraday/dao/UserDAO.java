package com.ft.extraday.dao;

import java.util.Date;
import java.util.List;

import com.ft.extraday.entity.Users;

public class UserDAO extends BaseDAO<Users>{
	//登陆
	public Users getUsersByName(String username) {
		
		String sql="select * from t_user where f_user_mobile=?";
		Object[] objects=new Object[] {username};
		List<Users> users=super.queryList(sql, objects, Users.class);
		System.out.println(users);
		if (users==null||users.size()==0) {
			return null;
		}else {
			Users user=users.get(0);
			return user;
		}
	}	
	
	//注册--添加用户
	public Integer insertUser(String username,String password) {
		Integer result;
		
		String sql="insert into t_user(f_user_mobile,f_password) values(?,?)";
		/*	+ "f_growth_value,f_user_level,f_register_time,f_update_time,f_last_login_time)"
		+ "values(?,?,?,?,?,?,?)";*/
		
		System.out.println(sql);
		Object[] objects=new Object[]{username,password};
		result=super.update(sql, objects);
		return result;	
	}
	//编辑数据---->数据
	
	public Integer addInfo(Integer id,String username,Integer sex,Date birthday,String email){
		Integer result;
		
		String sql="update t_user set f_username=?,f_sex=?,f_birthday=?,f_email=? where f_user_id=?";
		
		Object[] objects=new Object[]{username,sex,birthday,email,id};
		System.out.println(username);
		result=super.update(sql, objects);
		return result;
		
	}
}
