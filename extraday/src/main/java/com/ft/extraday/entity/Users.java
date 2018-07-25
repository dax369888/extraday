package com.ft.extraday.entity;

import java.util.Date;

public class Users {
	
	private Integer f_user_id;
	private String f_username;
	private String f_password;
	private String f_user_mobile;
	private Integer f_growth_value;
	private Integer f_user_level;
	private String f_paycode;
	private Date f_register_time;
	private Date f_update_time;
	private Date f_last_login_time;
	private String f_email;
	private Date f_birthday;
	private Integer f_sex;
	private Double f_income;
	private String f_origin;
	
	public Integer getF_user_id() {
		return f_user_id;
	}
	public void setF_user_id(Integer f_user_id) {
		this.f_user_id = f_user_id;
	}
	public String getF_username() {
		return f_username;
	}
	public void setF_username(String f_username) {
		this.f_username = f_username;
	}
	public String getF_password() {
		return f_password;
	}
	public void setF_password(String f_password) {
		this.f_password = f_password;
	}
	public String getF_user_mobile() {
		return f_user_mobile;
	}
	public void setF_user_mobile(String f_user_mobile) {
		this.f_user_mobile = f_user_mobile;
	}
	public Integer getF_growth_value() {
		return f_growth_value;
	}
	public void setF_growth_value(Integer f_growth_value) {
		this.f_growth_value = f_growth_value;
	}
	public Integer getF_user_level() {
		return f_user_level;
	}
	public void setF_user_level(Integer f_user_level) {
		this.f_user_level = f_user_level;
	}
	public String getF_paycode() {
		return f_paycode;
	}
	public void setF_paycode(String f_paycode) {
		this.f_paycode = f_paycode;
	}
	public Date getF_register_time() {
		return f_register_time;
	}
	public void setF_register_time(Date f_register_time) {
		this.f_register_time = f_register_time;
	}
	public Date getF_update_time() {
		return f_update_time;
	}
	public void setF_update_time(Date f_update_time) {
		this.f_update_time = f_update_time;
	}
	public Date getF_last_login_time() {
		return f_last_login_time;
	}
	public void setF_last_login_time(Date f_last_login_time) {
		this.f_last_login_time = f_last_login_time;
	}
	public String getF_email() {
		return f_email;
	}
	public void setF_email(String f_email) {
		this.f_email = f_email;
	}
	public Date getF_birthday() {
		return f_birthday;
	}
	public void setF_birthday(Date f_birthday) {
		this.f_birthday = f_birthday;
	}
	public Integer getF_sex() {
		return f_sex;
	}
	public void setF_sex(Integer f_sex) {
		this.f_sex = f_sex;
	}
	public Double getF_income() {
		return f_income;
	}
	public void setF_income(Double f_income) {
		this.f_income = f_income;
	}
	public String getF_origin() {
		return f_origin;
	}
	public void setF_origin(String f_origin) {
		this.f_origin = f_origin;
	}
	@Override
	public String toString() {
		return "Users [f_user_id=" + f_user_id + ", f_username=" + f_username + ", f_password=" + f_password
				+ ", f_user_mobile=" + f_user_mobile + ", f_growth_value=" + f_growth_value + ", f_user_level="
				+ f_user_level + ", f_paycode=" + f_paycode + ", f_register_time=" + f_register_time
				+ ", f_update_time=" + f_update_time + ", f_last_login_time=" + f_last_login_time + ", f_email="
				+ f_email + ", f_birthday=" + f_birthday + ", f_sex=" + f_sex + ", f_income=" + f_income + ", f_origin="
				+ f_origin + "]";
	}
	public Users(Integer f_user_id, String f_username, String f_password, String f_user_mobile, Integer f_growth_value,
			Integer f_user_level, String f_paycode, Date f_register_time, Date f_update_time, Date f_last_login_time,
			String f_email, Date f_birthday, Integer f_sex, Double f_income, String f_origin) {
		super();
		this.f_user_id = f_user_id;
		this.f_username = f_username;
		this.f_password = f_password;
		this.f_user_mobile = f_user_mobile;
		this.f_growth_value = f_growth_value;
		this.f_user_level = f_user_level;
		this.f_paycode = f_paycode;
		this.f_register_time = f_register_time;
		this.f_update_time = f_update_time;
		this.f_last_login_time = f_last_login_time;
		this.f_email = f_email;
		this.f_birthday = f_birthday;
		this.f_sex = f_sex;
		this.f_income = f_income;
		this.f_origin = f_origin;
	}
	public Users() {
		super();
	}
	
	
	
	
	
}
