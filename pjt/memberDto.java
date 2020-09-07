package com.myProject.pjt;

import java.sql.Timestamp;

public class memberDto {

	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private Timestamp jDate;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getjDate() {
		return jDate;
	}
	public void setjDate(Timestamp jDate) {
		this.jDate = jDate;
	}
	

	
}
