package com.ft.extraday.entity;

public class SKUAttr {
	private Integer f_sku_val_id;
	private Integer f_sku_id;
	private Integer f_value_id;
	private String f_detail;
	
	public Integer getF_sku_val_id() {
		return f_sku_val_id;
	}
	public void setF_sku_val_id(Integer f_sku_val_id) {
		this.f_sku_val_id = f_sku_val_id;
	}
	public Integer getF_sku_id() {
		return f_sku_id;
	}
	public void setF_sku_id(Integer f_sku_id) {
		this.f_sku_id = f_sku_id;
	}
	public Integer getF_value_id() {
		return f_value_id;
	}
	public void setF_value_id(Integer f_value_id) {
		this.f_value_id = f_value_id;
	}
	public String getF_detail() {
		return f_detail;
	}
	public void setF_detail(String f_detail) {
		this.f_detail = f_detail;
	}
	public SKUAttr(Integer f_sku_val_id, Integer f_sku_id, Integer f_value_id, String f_detail) {
		super();
		this.f_sku_val_id = f_sku_val_id;
		this.f_sku_id = f_sku_id;
		this.f_value_id = f_value_id;
		this.f_detail = f_detail;
	}
	public SKUAttr() {
		super();
	}
	@Override
	public String toString() {
		return "SKUAttr [f_sku_val_id=" + f_sku_val_id + ", f_sku_id=" + f_sku_id + ", f_value_id=" + f_value_id
				+ ", f_detail=" + f_detail + "]";
	}
	
	
}
