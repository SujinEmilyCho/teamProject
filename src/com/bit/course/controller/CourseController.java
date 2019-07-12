package com.bit.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.course.model.CourseDao;

@WebServlet("/course")
public class CourseController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CourseDao dao =new CourseDao(); //Account list 니깐 dao 호출해서 view 로 넘겨주기
		String coursecode1 = req.getParameter("coursecoede1");
		String title1 = req.getParameter("title1");
		String status1 =req.getParameter("status1");
		String search =req.getParameter("search");
		System.out.println("전체 처음 길때는 이게 보여야아함 ");
		
		if(coursecode1==null) {
			coursecode1="asdnhjkasd12n3jklnlddd";
		}
		if(title1==null) {
			title1="saduie4rbhj2134sado";
		}
		if(status1==null) {
			status1="asbhdjkb2134bjksadbk";
		}
		if(search==null) {
			search="3qw434asercvwervewarwae";
		}
		
		req.setAttribute("list", dao.getAccount(coursecode1, title1, status1, search));
		
		RequestDispatcher rd= req.getRequestDispatcher("/course/courselist.jsp");
		rd.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CourseDao dao =new CourseDao(); //Account list 니깐 dao 호출해서 view 로 넘겨주기
		String coursecode1 = req.getParameter("coursecode1");
		String title1 = req.getParameter("title1");
		String status1 =req.getParameter("status1");
		String search=req.getParameter("search");
		req.setAttribute("list", dao.getAccount(coursecode1, title1, status1 , search));
		
		RequestDispatcher rd= req.getRequestDispatcher("/course/courselist.jsp");
		rd.forward(req, resp);
	}

}
