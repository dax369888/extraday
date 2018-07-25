package com.ft.extraday.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ft.extraday.util.DBHelper;
import com.ft.extraday.util.StringHelper;

public class BaseDAO<T> {

	public Connection con;
	public PreparedStatement pstm;
	public ResultSet rs;

	// 单表查询
	public List<T> queryList(String sql, Object[] objs, Class<T> clazz) {
		if (con == null) {
			con = DBHelper.getCon();
		}
		List<T> list = new ArrayList<T>();
		try {
			pstm = con.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pstm.setObject(i + 1, objs[i]);
			}
			rs = pstm.executeQuery();
			//获取列信息
			ResultSetMetaData rSetMetaData = rs.getMetaData();
			//获取列数
			int columns = rSetMetaData.getColumnCount();
			System.out.println(columns);
			
			while (rs.next()) {
				//利用反射填充实体类的set方法
				Object obj = clazz.newInstance();

				for (int i = 0; i < columns; i++) {
					System.out.println(i);
					//获得列名（属性名）
					String columnName = rSetMetaData.getColumnName(i + 1);
					//获取属性信息
					Field field = clazz.getDeclaredField(columnName);
					//设置要调用的方法名和参数类型
					Method method = clazz.getDeclaredMethod("set" + StringHelper.upperCase(columnName),
							field.getType());
					//调用方法
					method.invoke(obj, rs.getObject(i + 1));

				}

				list.add((T) obj);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DBHelper.closeAll(rs, pstm, null);
		}

		return list;

	}

	// 更新
	public Integer update(String sql, Object[] objs) {

		if (con == null) {
			con = DBHelper.getCon();
		}
		int result = 0;
		try {
			pstm = con.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pstm.setObject(i + 1, objs[i]);
			}
			System.out.println(pstm);
			result = pstm.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DBHelper.closeAll(rs, pstm, null);
		}

		return result;
	}

	// 多表查询
	public List<Map<String, Object>> queryList(String sql, Object[] objs) {

		if (con == null) {
			con = DBHelper.getCon();
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			pstm = con.prepareStatement(sql);

			for (int i = 0; i < objs.length; i++) {
				pstm.setObject(i + 1, objs[i]);
			}
			rs = pstm.executeQuery();

			ResultSetMetaData metaData = rs.getMetaData();

			int colmns = metaData.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 1; i <= colmns; i++) {

					String columnName = metaData.getColumnName(i);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeAll(rs, pstm, null);
		}
		return list;

	}

}
