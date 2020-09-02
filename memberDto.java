package com.myProject.pjt;

import java.sql.Timestamp;

public class memberDto {
//	아이디 비밀번호 이름 생년월일 성별 휴대전화 이메일
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
//	private Timestamp jDate;
	
	
//	public memberDto(String id, String pwd,  String gender, String phone, String email) {
//
//		this.id = id;
//		this.pwd = pwd;
//		this.gender = gender;
//		this.phone = phone;
//		this.email = email;
//	}
	
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
//	public Timestamp getjDate() {
//		return jDate;
//	}
//	public void setjDate(Timestamp jDate) {
//		this.jDate = jDate;
//	}
	

	
}
