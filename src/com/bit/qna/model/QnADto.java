package com.bit.qna.model;

import java.sql.Date;

public class QnADto {

	private int num;
	private String name;
	private int phone;
	private Date postdate;
	private String sub;
	private String content;
	private String category;
	private String status;
	
	public QnADto() {
		
	}
	
	public QnADto(int num, String name, int phone, Date postdate, String sub, String content, String category,
			String status) {
		super();
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.postdate = postdate;
		this.sub = sub;
		this.content = content;
		this.category = category;
		this.status = status;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
