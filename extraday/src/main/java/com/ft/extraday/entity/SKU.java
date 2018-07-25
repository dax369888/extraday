package com.ft.extraday.entity;

public class SKU {
	private Integer f_sku_id;
	private String f_sku_name;
	private String f_sku_code;
	private Double f_price;
	private Integer f_inventory;
	private Integer f_spu_id;
	public Integer getF_sku_id() {
		return f_sku_id;
	}
	public void setF_sku_id(Integer f_sku_id) {
		this.f_sku_id = f_sku_id;
	}
	public String getF_sku_name() {
		return f_sku_name;
	}
	public void setF_sku_name(String f_sku_name) {
		this.f_sku_name = f_sku_name;
	}
	public String getF_sku_code() {
		return f_sku_code;
	}
	public void setF_sku_code(String f_sku_code) {
		this.f_sku_code = f_sku_code;
	}
	public Double getF_price() {
		return f_price;
	}
	public void setF_price(Double f_price) {
		this.f_price = f_price;
	}
	public Integer getF_inventory() {
		return f_inventory;
	}
	public void setF_inventory(Integer f_inventory) {
		this.f_inventory = f_inventory;
	}
	public Integer getF_spu_id() {
		return f_spu_id;
	}
	public void setF_spu_id(Integer f_spu_id) {
		this.f_spu_id = f_spu_id;
	}
	public SKU(Integer f_sku_id, String f_sku_name, String f_sku_code, Double f_price, Integer f_inventory,
			Integer f_spu_id) {
		super();
		this.f_sku_id = f_sku_id;
		this.f_sku_name = f_sku_name;
		this.f_sku_code = f_sku_code;
		this.f_price = f_price;
		this.f_inventory = f_inventory;
		this.f_spu_id = f_spu_id;
	}
	public SKU() {
		super();
	}
	@Override
	public String toString() {
		return "SKU [f_sku_id=" + f_sku_id + ", f_sku_name=" + f_sku_name + ", f_sku_code=" + f_sku_code + ", f_price="
				+ f_price + ", f_inventory=" + f_inventory + ", f_spu_id=" + f_spu_id + "]";
	}
	
	
}
