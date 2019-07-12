package com.bit.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.course.model.CourseDao;
import com.bit.course.model.CourseDto;
@WebServlet("/course/detail")
public class CourseDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String coursecode=req.getParameter("idx");
		
		CourseDao dao=new CourseDao();
		CourseDto bean=dao.detail(coursecode);
		req.setAttribute("bean", bean);
		RequestDispatcher rd = req.getRequestDispatcher("/course/coursedetail.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String title=req.getParameter("title");
		String teacher=req.getParameter("teacher");
		int maxstu=Integer.parseInt(req.getParameter("maxstu"));
		int classroom=Integer.parseInt(req.getParameter("classroom"));
		String period=req.getParameter("period");
		String status=req.getParameter("status");
		String coursecode=req.getParameter("coursecode");
		
		CourseDao dao=new CourseDao();
		dao.edit(coursecode, title, teacher, maxstu, classroom, period, status);
		
		resp.sendRedirect(req.getContextPath()+"/course");
	
	
	}
		
	

}
