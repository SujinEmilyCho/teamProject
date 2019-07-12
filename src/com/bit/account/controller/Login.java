package com.bit.account.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.account.model.Account_Dao;
import com.bit.account.model.Account_Dto;

@WebServlet("/login")
public class Login extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd= req.getRequestDispatcher("/account/login.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {		
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("ID");
		String pw = req.getParameter("PW");
		Account_Dao dao = new Account_Dao();
		Account_Dto bean=dao.login(id, pw);
		
		if(bean!=null){
			//session
			HttpSession session = req.getSession();
			session.setAttribute("result",true);
			session.setAttribute("courseCode",bean.getCourseCode());
			session.setAttribute("accountType",bean.getAccountType());
			session.setAttribute("accountNum",bean.getAccountNum());
			session.setAttribute("name" ,bean.getName());
			resp.sendRedirect(req.getContextPath());
		}else{
			req.setAttribute("errnsg","<script type=\"text/javascript\">alert(\"아이디와 비밀번호를 확인해주세요\");</script>");
			doGet(req, resp);
		}
		System.out.println("id : "+id);
		System.out.println(pw);
	}

}
