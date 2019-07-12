package com.bit.course.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.course.model.CourseDao;
@WebServlet("/course/delete")
public class CourseDeleteController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("����οԴ�!");
		CourseDao dao = new CourseDao();
		String coursecode = req.getParameter("coursecode");
		System.out.println("coursecode:"+coursecode);
		dao.delete(coursecode);
		System.out.println("dao.delete �� "+coursecode+" ���� ");
		resp.sendRedirect(req.getContextPath()+"/course");
		
	}

}
