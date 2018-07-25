package com.ft.extraday.entity;

public class OrderItem {
	
	private Integer f_item_id;
	private Integer f_order_id;
	private Integer f_SKU_id;
	private Integer f_good_count;
	private Double f_item_sum_price;
	public Integer getF_item_id() {
		return f_item_id;
	}
	public void setF_item_id(Integer f_item_id) {
		this.f_item_id = f_item_id;
	}
	public Integer getF_order_id() {
		return f_order_id;
	}
	public void setF_order_id(Integer f_order_id) {
		this.f_order_id = f_order_id;
	}
	public Integer getF_SKU_id() {
		return f_SKU_id;
	}
	public void setF_SKU_id(Integer f_SKU_id) {
		this.f_SKU_id = f_SKU_id;
	}
	public Integer getF_good_count() {
		return f_good_count;
	}
	public void setF_good_count(Integer f_good_count) {
		this.f_good_count = f_good_count;
	}
	public Double getF_item_sum_price() {
		return f_item_sum_price;
	}
	public void setF_item_sum_price(Double f_item_sum_price) {
		this.f_item_sum_price = f_item_sum_price;
	}
	public OrderItem(Integer f_item_id, Integer f_order_id, Integer f_SKU_id, Integer f_good_count,
			Double f_item_sum_price) {
		super();
		this.f_item_id = f_item_id;
		this.f_order_id = f_order_id;
		this.f_SKU_id = f_SKU_id;
		this.f_good_count = f_good_count;
		this.f_item_sum_price = f_item_sum_price;
	}
	public OrderItem() {
		super();
	}
	@Override
	public String toString() {
		return "OrderItem [f_item_id=" + f_item_id + ", f_order_id=" + f_order_id + ", f_SKU_id=" + f_SKU_id
				+ ", f_good_count=" + f_good_count + ", f_item_sum_price=" + f_item_sum_price + "]";
	}
	
	
	
}
