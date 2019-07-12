package com.bit.recruit.model;

import java.sql.Date;

public class RecruitDto {
	private int num;
	private String name;
	private String period;
	private String sub;
	private String content;
	private String category;
	private Date postdate;
	
	public RecruitDto() {
		// TODO Auto-generated constructor stub
	}
		
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getPeriod() {
		return period;
	}
	public String getSub() {
		return sub;
	}
	public String getContent() {
		return content;
	}
	public String getCategory() {
		return category;
	}
	public Date getPostdate() {
		return postdate;
	}
	
	
	public void setNum(int num) {
		this.num = num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	
	
	
	
	
	
}
