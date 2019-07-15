package com.bit.recruit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.recruit.model.RecruitDao;


/**
 * Servlet implementation class RecruitAddController
 */
@WebServlet("/recruit/recruitadd")
public class RecruitAddController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session =req.getSession();
		
		RequestDispatcher rd = req.getRequestDispatcher("/recruit/recruitadd.jsp");
		rd.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//int num = Integer.parseInt(req.getParameter("num"));
		String category = req.getParameter("category");
		//Date postdate =  req.getParameter("postdate");
		String sub = req.getParameter("sub");
		String period = req.getParameter("period");
		String content = req.getParameter("content");
		
		System.out.println(category+" "+sub+" "+period+" "+content);
		
		RecruitDao dao =new RecruitDao();
		dao.addList(category, sub, period,content);
		dao =new RecruitDao();
		int num=dao.getNum();
		RequestDispatcher rd = req.getRequestDispatcher("recruitdetail?idx="+num);
		rd.forward(req, resp);
		//resp.sendRedirect(req.getContextPath()+"/recruitdetail?idx="+num);
			
		
	}

}
