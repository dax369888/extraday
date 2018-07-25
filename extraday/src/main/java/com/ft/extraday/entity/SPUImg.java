package com.ft.extraday.entity;

public class SPUImg {
	
	private Integer f_pic_id;
	private Integer f_good_spu_id;
	private Integer f_pic_status;
	private String f_pic_url;
	private Integer f_sort_num;
	public Integer getF_pic_id() {
		return f_pic_id;
	}
	public void setF_pic_id(Integer f_pic_id) {
		this.f_pic_id = f_pic_id;
	}
	public Integer getF_good_spu_id() {
		return f_good_spu_id;
	}
	public void setF_good_spu_id(Integer f_good_spu_id) {
		this.f_good_spu_id = f_good_spu_id;
	}
	public Integer getF_pic_status() {
		return f_pic_status;
	}
	public void setF_pic_status(Integer f_pic_status) {
		this.f_pic_status = f_pic_status;
	}
	public String getF_pic_url() {
		return f_pic_url;
	}
	public void setF_pic_url(String f_pic_url) {
		this.f_pic_url = f_pic_url;
	}
	public Integer getF_sort_num() {
		return f_sort_num;
	}
	public void setF_sort_num(Integer f_sort_num) {
		this.f_sort_num = f_sort_num;
	}
	public SPUImg(Integer f_pic_id, Integer f_good_spu_id, Integer f_pic_status, String f_pic_url, Integer f_sort_num) {
		super();
		this.f_pic_id = f_pic_id;
		this.f_good_spu_id = f_good_spu_id;
		this.f_pic_status = f_pic_status;
		this.f_pic_url = f_pic_url;
		this.f_sort_num = f_sort_num;
	}
	public SPUImg() {
		super();
	}
	@Override
	public String toString() {
		return "SPUImg [f_pic_id=" + f_pic_id + ", f_good_spu_id=" + f_good_spu_id + ", f_pic_status=" + f_pic_status
				+ ", f_pic_url=" + f_pic_url + ", f_sort_num=" + f_sort_num + "]";
	}
	
	
	
}
