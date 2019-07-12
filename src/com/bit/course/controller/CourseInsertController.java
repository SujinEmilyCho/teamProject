package com.bit.course.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.course.model.CourseDao;

@WebServlet("/course/courseinsert")
public class CourseInsertController extends HttpServlet{
	
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		   req.setCharacterEncoding("UTF-8");
		System.out.println("insert cont");
		RequestDispatcher rd = req.getRequestDispatcher("/course/courseinsert.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		   req.setCharacterEncoding("UTF-8");
		HashMap<String,String> map=new HashMap<String,String>();
		Enumeration<String> enums = req.getParameterNames();
		int i=0;
		while(enums.hasMoreElements()){
			String key=enums.nextElement();
			String value=req.getParameter(key);
			map.put(key, value);
		}
	
		String coursecode=map.get("coursecode");
		String title=map.get("title");
		String teacher=map.get("teacher");
		int maxstu=Integer.parseInt(map.get("maxstu"));
		String status=map.get("status");
		int classroom=Integer.parseInt(map.get("classroom"));
		String period=map.get("period");
		
		CourseDao dao=new CourseDao();
		dao.insert(coursecode, title, teacher, maxstu, classroom, period, status);
		
		res.sendRedirect(req.getContextPath()+"/course");
	
	}

}
