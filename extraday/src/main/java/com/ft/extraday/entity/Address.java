package com.ft.extraday.entity;

public class Address {
	private Integer f_addr_id;
	private Integer f_user_id;
	private Integer f_region_id;
	private String  f_address_det;
	private Integer f_is_def;
	private String f_rec_name;
	private String f_rec_mobile;

	public Integer getF_addr_id() {
		return f_addr_id;
	}
	public void setF_addr_id(Integer f_addr_id) {
		this.f_addr_id = f_addr_id;
	}
	public Integer getF_user_id() {
		return f_user_id;
	}
	public void setF_user_id(Integer f_user_id) {
		this.f_user_id = f_user_id;
	}
	public Integer getF_region_id() {
		return f_region_id;
	}
	public void setF_region_id(Integer f_region_id) {
		this.f_region_id = f_region_id;
	}
	public String getF_address_det() {
		return f_address_det;
	}
	public void setF_address_det(String f_address_det) {
		this.f_address_det = f_address_det;
	}
	public Integer getF_is_def() {
		return f_is_def;
	}
	public void setF_is_def(Integer f_is_def) {
		this.f_is_def = f_is_def;
	}
	public String getF_rec_name() {
		return f_rec_name;
	}
	public void setF_rec_name(String f_rec_name) {
		this.f_rec_name = f_rec_name;
	}
	public String getF_rec_mobile() {
		return f_rec_mobile;
	}
	public void setF_rec_mobile(String f_rec_mobile) {
		this.f_rec_mobile = f_rec_mobile;
	}
	@Override
	public String toString() {
		return "Address [f_addr_id=" + f_addr_id + ", f_user_id=" + f_user_id
				+ ", f_region_id=" + f_region_id + ", f_address_det="
				+ f_address_det + ", f_is_def=" + f_is_def + ", f_rec_name="
				+ f_rec_name + ", f_rec_mobile=" + f_rec_mobile + "]";
	}
	public Address(Integer f_addr_id, Integer f_user_id, Integer f_region_id, String f_address_det, Integer f_is_def,
			String f_rec_name, String f_rec_mobile) {
		super();
		this.f_addr_id = f_addr_id;
		this.f_user_id = f_user_id;
		this.f_region_id = f_region_id;
		this.f_address_det = f_address_det;
		this.f_is_def = f_is_def;
		this.f_rec_name = f_rec_name;
		this.f_rec_mobile = f_rec_mobile;
	}
	public Address() {
		super();
	}
	
	
                    

}
