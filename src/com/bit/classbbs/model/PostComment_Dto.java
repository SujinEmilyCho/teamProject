package com.bit.classbbs.model;

import java.sql.Date;

public class PostComment_Dto {
	int num;
	int classBbsNum;
	int accountNum;
	String content;
	Date postDate;
	String name;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getClassBbsNum() {
		return classBbsNum;
	}
	public void setClassBbsNum(int classBbsNum) {
		this.classBbsNum = classBbsNum;
	}
	public int getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
