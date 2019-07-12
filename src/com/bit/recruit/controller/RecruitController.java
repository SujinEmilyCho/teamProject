package com.bit.recruit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.recruit.model.RecruitDao;

/**
 * Servlet implementation class Recruit
 */
@WebServlet("/recruit")
public class RecruitController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RecruitDao dao = new RecruitDao();	//list 니깐 dao 호출해서 view로 넘겨줘야한다.
		req.setAttribute("list", dao.getList());
		
		RequestDispatcher rd = req.getRequestDispatcher("/recruit/recruitlist.jsp");
		rd.forward(req, resp);
		
	}
	
	

}
