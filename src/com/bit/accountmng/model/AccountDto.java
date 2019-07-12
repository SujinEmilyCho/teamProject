package com.bit.accountmng.model;

import java.sql.Date;

public class AccountDto {
	int accountNum;
	String id;
	String pw;
	String name;
	String email;
	int phone;
	Date bday;
	int accountType;
	String courseCode;
	
	
	public int getAccountNum() {
		return accountNum;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public int getPhone() {
		return phone;
	}
	public Date getBday() {
		return bday;
	}
	public int getAccountType() {
		return accountType;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public void setBday(Date bday) {
		this.bday = bday;
	}
	public void setAccountType(int accountType) {
		this.accountType = accountType;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	
	
}
