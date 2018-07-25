package com.ft.extraday.entity;

public class SPUAttr {
	private Integer f_spu_val_id;
	private Integer f_spu_id;
	private Integer f_value_id;
	private String f_detail;
	public Integer getF_spu_val_id() {
		return f_spu_val_id;
	}
	public void setF_spu_val_id(Integer f_spu_val_id) {
		this.f_spu_val_id = f_spu_val_id;
	}
	public Integer getF_spu_id() {
		return f_spu_id;
	}
	public void setF_spu_id(Integer f_spu_id) {
		this.f_spu_id = f_spu_id;
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
	public SPUAttr(Integer f_spu_val_id, Integer f_spu_id, Integer f_value_id, String f_detail) {
		super();
		this.f_spu_val_id = f_spu_val_id;
		this.f_spu_id = f_spu_id;
		this.f_value_id = f_value_id;
		this.f_detail = f_detail;
	}
	public SPUAttr() {
		super();
	}
	@Override
	public String toString() {
		return "SPUAttr [f_spu_val_id=" + f_spu_val_id + ", f_spu_id=" + f_spu_id + ", f_value_id=" + f_value_id
				+ ", f_detail=" + f_detail + "]";
	}
	
	
	
}	
