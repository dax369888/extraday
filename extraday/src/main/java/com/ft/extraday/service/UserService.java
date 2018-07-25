package com.ft.extraday.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.ft.extraday.dao.UserDAO;
import com.ft.extraday.entity.Users;
import com.ft.extraday.util.MD5Value;


public class UserService {	
	private UserDAO userDAO =new UserDAO();
	
	public Map<String, Object> login(String username,String password) {
		Map<String, Object> map=new HashMap<String, Object>();
		Users user=userDAO.getUsersByName(username);
		System.out.println(user);
		if (user!=null) {
			if (user.getF_password().equals(MD5Value.getMD5(password))){
				map.put("user", user);
			}
			else {
				map.put("msg", "�˺Ż��������");
			}			
		}else {
			map.put("msg", "�˺Ż��������");
		}		
		//System.err.println("2");
		return map;
	}
	
	public boolean isValid(String username) {
		boolean valid=true;	
		Users user=userDAO.getUsersByName(username);
		if (user!=null) {
			valid=false;
		}
		return valid;	
	}
	
	
	public Map<String, Object> register(String username,String password){
		Map<String, Object> map=new HashMap<String, Object>();
		password=MD5Value.getMD5(password);
		Integer result=userDAO.insertUser(username, password);
		System.out.println(result);
		//ֱ����ת����ҳ
		if (result>0) {
			Users user=userDAO.getUsersByName(username);
			System.out.println(user);
			map.put("user", user);
		}
		return map;
	}
	//һ��ʼ�ĸ�������ȥ���ݿ���
	public  Map<String, Object>  getInfo(String username){
		Map<String, Object> map=new HashMap<String, Object>();
		Users user =userDAO.getUsersByName(username);	
		System.out.println(user);
		map.put("user", user);
		System.out.println(map);
		return map;
	}
	
	//�༭--->�����û�����
	public Integer  addInfo(Integer id,String username,Integer sex, Date birthday,String email){
		Map<String, Object> map=new HashMap<String, Object>();
		System.out.println(birthday);
		Integer result =userDAO.addInfo(id,username, sex, birthday, email);
		return result;
		
	}
}
