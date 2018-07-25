package com.ft.extraday.entity;

public class Cart {
	private Integer f_cart_id;
	private Integer f_sku_id;
	private Integer f_user_id;
	private Integer f_status;
	private Integer f_count;
	public Integer getF_status() {
		return f_status;
	}
	public void setF_status(Integer f_status) {
		this.f_status = f_status;
	}

	public Integer getF_cart_id() {
		return f_cart_id;
	}
	public void setF_cart_id(Integer f_cart_id) {
		this.f_cart_id = f_cart_id;
	}
	public Integer getF_sku_id() {
		return f_sku_id;
	}
	public void setF_sku_id(Integer f_sku_id) {
		this.f_sku_id = f_sku_id;
	}
	public Integer getF_user_id() {
		return f_user_id;
	}
	public void setF_user_id(Integer f_user_id) {
		this.f_user_id = f_user_id;
	}
	
	public Integer getF_count() {
		return f_count;
	}
	public void setF_count(Integer f_count) {
		this.f_count = f_count;
	}
	public Cart(Integer f_cart_id, Integer f_sku_id, Integer f_user_id, Integer f_status, Integer f_count) {
		super();
		this.f_cart_id = f_cart_id;
		this.f_sku_id = f_sku_id;
		this.f_user_id = f_user_id;
		this.f_status = f_status;
		this.f_count = f_count;
	}
	public Cart() {
		super();
	}
	@Override
	public String toString() {
		return "Cart [f_cart_id=" + f_cart_id + ", f_sku_id=" + f_sku_id + ", f_user_id=" + f_user_id + ", f_status="
				+ f_status + ", f_count=" + f_count + "]";
	}
	
	
	
	
}
