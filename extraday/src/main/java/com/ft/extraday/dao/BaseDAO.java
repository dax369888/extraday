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

	// �����ѯ
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
			//��ȡ����Ϣ
			ResultSetMetaData rSetMetaData = rs.getMetaData();
			//��ȡ����
			int columns = rSetMetaData.getColumnCount();
			System.out.println(columns);
			
			while (rs.next()) {
				//���÷������ʵ�����set����
				Object obj = clazz.newInstance();

				for (int i = 0; i < columns; i++) {
					System.out.println(i);
					//�����������������
					String columnName = rSetMetaData.getColumnName(i + 1);
					//��ȡ������Ϣ
					Field field = clazz.getDeclaredField(columnName);
					//����Ҫ���õķ������Ͳ�������
					Method method = clazz.getDeclaredMethod("set" + StringHelper.upperCase(columnName),
							field.getType());
					//���÷���
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

	// ����
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

	// ����ѯ
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
