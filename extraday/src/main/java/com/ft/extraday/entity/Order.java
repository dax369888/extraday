package com.ft.extraday.entity;

import java.util.Date;

public class Order {
	
	private Integer f_order_id;
	private Double f_sum_price;
	private Integer f_order_status;
	private Integer f_user_id;
	private Date f_create_time;
	private Integer f_address_id;
	private String f_order_code;
	public Integer getF_order_id() {
		return f_order_id;
	}
	public void setF_order_id(Integer f_order_id) {
		this.f_order_id = f_order_id;
	}
	public Double getF_sum_price() {
		return f_sum_price;
	}
	public void setF_sum_price(Double f_sum_price) {
		this.f_sum_price = f_sum_price;
	}
	public Integer getF_order_status() {
		return f_order_status;
	}
	public void setF_order_status(Integer f_order_status) {
		this.f_order_status = f_order_status;
	}
	public Integer getF_user_id() {
		return f_user_id;
	}
	public void setF_user_id(Integer f_user_id) {
		this.f_user_id = f_user_id;
	}
	public Date getF_create_time() {
		return f_create_time;
	}
	public void setF_create_time(Date f_create_time) {
		this.f_create_time = f_create_time;
	}
	public Integer getF_address_id() {
		return f_address_id;
	}
	public void setF_address_id(Integer f_address_id) {
		this.f_address_id = f_address_id;
	}
	public String getF_order_code() {
		return f_order_code;
	}
	public void setF_order_code(String f_order_code) {
		this.f_order_code = f_order_code;
	}
	public Order(Integer f_order_id, Double f_sum_price, Integer f_order_status, Integer f_user_id, Date f_create_time,
			Integer f_address_id, String f_order_code) {
		super();
		this.f_order_id = f_order_id;
		this.f_sum_price = f_sum_price;
		this.f_order_status = f_order_status;
		this.f_user_id = f_user_id;
		this.f_create_time = f_create_time;
		this.f_address_id = f_address_id;
		this.f_order_code = f_order_code;
	}
	public Order() {
		super();
	}
	@Override
	public String toString() {
		return "Order [f_order_id=" + f_order_id + ", f_sum_price=" + f_sum_price + ", f_order_status=" + f_order_status
				+ ", f_user_id=" + f_user_id + ", f_create_time=" + f_create_time + ", f_address_id=" + f_address_id
				+ ", f_order_code=" + f_order_code + "]";
	}
	
	
	
	
}
