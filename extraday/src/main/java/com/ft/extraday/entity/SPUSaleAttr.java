package com.ft.extraday.entity;

public class SPUSaleAttr {
	private Integer f_spu_attr_sale_id;
	private Integer f_spu_id;
	private Integer f_attr_id;
	public Integer getF_spu_attr_sale_id() {
		return f_spu_attr_sale_id;
	}
	public void setF_spu_attr_sale_id(Integer f_spu_attr_sale_id) {
		this.f_spu_attr_sale_id = f_spu_attr_sale_id;
	}
	public Integer getF_spu_id() {
		return f_spu_id;
	}
	public void setF_spu_id(Integer f_spu_id) {
		this.f_spu_id = f_spu_id;
	}
	public Integer getF_attr_id() {
		return f_attr_id;
	}
	public void setF_attr_id(Integer f_attr_id) {
		this.f_attr_id = f_attr_id;
	}
	public SPUSaleAttr(Integer f_spu_attr_sale_id, Integer f_spu_id, Integer f_attr_id) {
		super();
		this.f_spu_attr_sale_id = f_spu_attr_sale_id;
		this.f_spu_id = f_spu_id;
		this.f_attr_id = f_attr_id;
	}
	public SPUSaleAttr() {
		super();
	}
	@Override
	public String toString() {
		return "SPUSaleAttr [f_spu_attr_sale_id=" + f_spu_attr_sale_id + ", f_spu_id=" + f_spu_id + ", f_attr_id="
				+ f_attr_id + "]";
	}
	
	
	
}
