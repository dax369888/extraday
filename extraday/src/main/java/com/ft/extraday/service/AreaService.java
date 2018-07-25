package com.ft.extraday.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ft.extraday.dao.AreaDAO;
import com.ft.extraday.entity.Area;

public class AreaService {
	private AreaDAO areadao = new AreaDAO();
   //ʡ����������
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
	
	//������id���ʡ�����ķ���
	
	public Map<String, Object> getAreaById(Integer cid){
		//����ֵ��ʡ������Ӧ��Map��
		Map<String, Object> map=new HashMap<String, Object>();
		
		
		
		String PCC="";
		//�Ȼ����������
		String country=areadao.selectNameById(cid);
		//����������е�����
		Map<String, Object> mapBase=areadao.selectById(cid);
		String city=(String)mapBase.get("area_name");
		//�ٸ����е�Id���ʡ������
		mapBase=areadao.selectById((Integer)mapBase.get("id"));
		String province=(String)mapBase.get("area_name");
		
		PCC=province+"-"+city+"-"+"-"+country;
		//��������ʡ�����ļ�ֵӳ���
		map.put(String.valueOf(cid), PCC);
		System.out.println(PCC);
		return map;
		
	}
	

}
