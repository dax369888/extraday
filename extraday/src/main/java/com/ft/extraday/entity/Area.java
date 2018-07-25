package com.ft.extraday.entity;

import java.sql.Date;

public class Area {
	private Integer id;
	private String area_name;
	private String area_code;
	private String area_short;
	private String area_is_hot;
	private Integer area_sequence;
	private Integer area_parent_id;
	private Date init_date;
	private String init_addr;

	
	public Area() {
		super();
	}
	public Area(Integer id, String area_name, String area_code,
			String area_short, String area_is_hot, Integer area_sequence,
			Integer area_parent_id, Date init_date, String init_addr) {
		super();
		this.id = id;
		this.area_name = area_name;
		this.area_code = area_code;
		this.area_short = area_short;
		this.area_is_hot = area_is_hot;
		this.area_sequence = area_sequence;
		this.area_parent_id = area_parent_id;
		this.init_date = init_date;
		this.init_addr = init_addr;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getArea_short() {
		return area_short;
	}
	public void setArea_short(String area_short) {
		this.area_short = area_short;
	}
	public String getArea_is_hot() {
		return area_is_hot;
	}
	public void setArea_is_hot(String area_is_hot) {
		this.area_is_hot = area_is_hot;
	}
	public Integer getArea_sequence() {
		return area_sequence;
	}
	public void setArea_sequence(Integer area_sequence) {
		this.area_sequence = area_sequence;
	}
	public Integer getArea_parent_id() {
		return area_parent_id;
	}
	public void setArea_parent_id(Integer area_parent_id) {
		this.area_parent_id = area_parent_id;
	}
	public Date getInit_date() {
		return init_date;
	}
	public void setInit_date(Date init_date) {
		this.init_date = init_date;
	}
	public String getInit_addr() {
		return init_addr;
	}
	public void setInit_addr(String init_addr) {
		this.init_addr = init_addr;
	}
	@Override
	public String toString() {
		return "Area [id=" + id + ", area_name=" + area_name + ", area_code="
				+ area_code + ", area_short=" + area_short + ", area_is_hot="
				+ area_is_hot + ", area_sequence=" + area_sequence
				+ ", area_parent_id=" + area_parent_id + ", init_date="
				+ init_date + ", init_addr=" + init_addr + "]";
	}
	
	

}
