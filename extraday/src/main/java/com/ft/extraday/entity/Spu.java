package com.ft.extraday.entity;

import java.io.Serializable;
import java.util.Date;

public class Spu implements Serializable {
	private Integer f_id;
	private String f_spu_code;
	private Integer f_category_id;
	private String f_good_title;
	private String f_good_detail;
	private Date f_listing_time;
	private Date f_dlisting_time;
	private Integer f_show_index;
	private String f_main_img_url;
	public Integer getF_id() {
		return f_id;
	}
	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}
	public String getF_spu_code() {
		return f_spu_code;
	}
	public void setF_spu_code(String f_spu_code) {
		this.f_spu_code = f_spu_code;
	}
	public Integer getF_category_id() {
		return f_category_id;
	}
	public void setF_category_id(Integer f_category_id) {
		this.f_category_id = f_category_id;
	}
	public String getF_good_title() {
		return f_good_title;
	}
	public void setF_good_title(String f_good_title) {
		this.f_good_title = f_good_title;
	}
	public String getF_good_detail() {
		return f_good_detail;
	}
	public void setF_good_detail(String f_good_detail) {
		this.f_good_detail = f_good_detail;
	}
	public Date getF_listing_time() {
		return f_listing_time;
	}
	public void setF_listing_time(Date f_listing_time) {
		this.f_listing_time = f_listing_time;
	}
	public Date getF_dlisting_time() {
		return f_dlisting_time;
	}
	public void setF_dlisting_time(Date f_dlisting_time) {
		this.f_dlisting_time = f_dlisting_time;
	}
	public Integer getF_show_index() {
		return f_show_index;
	}
	public void setF_show_index(Integer f_show_index) {
		this.f_show_index = f_show_index;
	}
	public String getF_main_img_url() {
		return f_main_img_url;
	}
	public void setF_main_img_url(String f_main_img_url) {
		this.f_main_img_url = f_main_img_url;
	}
	@Override
	public String toString() {
		return "Spu [f_id=" + f_id + ", f_spu_code=" + f_spu_code
				+ ", f_category_id=" + f_category_id + ", f_good_title="
				+ f_good_title + ", f_good_detail=" + f_good_detail
				+ ", f_listing_time=" + f_listing_time + ", f_dlisting_time="
				+ f_dlisting_time + ", f_show_index=" + f_show_index
				+ ", f_main_img_url=" + f_main_img_url + "]";
	}
	public Spu(Integer f_id, String f_spu_code, Integer f_category_id,
			String f_good_title, String f_good_detail, Date f_listing_time,
			Date f_dlisting_time, Integer f_show_index, String f_main_img_url) {
		super();
		this.f_id = f_id;
		this.f_spu_code = f_spu_code;
		this.f_category_id = f_category_id;
		this.f_good_title = f_good_title;
		this.f_good_detail = f_good_detail;
		this.f_listing_time = f_listing_time;
		this.f_dlisting_time = f_dlisting_time;
		this.f_show_index = f_show_index;
		this.f_main_img_url = f_main_img_url;
	}
	public Spu() {
		super();
	}

	
}
