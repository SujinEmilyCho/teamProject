package com.bit.course.model;

public class CourseDto {

	
	String coursecode;
	String title;
	String teacher;
	int maxstu;
	int classroom;
	String period;
	String status;
	
	public CourseDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public CourseDto( String coursecode, String title, String teacher, int maxstu, int classroom, String period,
			String status) {
		super();
		
		this.coursecode = coursecode;
		this.title = title;
		this.teacher = teacher;
		this.maxstu = maxstu;
		this.classroom = classroom;
		this.period = period;
		this.status = status;
	}




	public String getCoursecode() {
		return coursecode;
	}

	public void setCoursecode(String coursecode) {
		this.coursecode = coursecode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public int getMaxstu() {
		return maxstu;
	}

	public void setMaxstu(int maxstu) {
		this.maxstu = maxstu;
	}

	public int getClassroom() {
		return classroom;
	}

	public void setClassroom(int classroom) {
		this.classroom = classroom;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
