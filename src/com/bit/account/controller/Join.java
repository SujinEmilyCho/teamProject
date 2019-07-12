package com.bit.account.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.account.model.Account_Dao;

@WebServlet("/join")
public class Join extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd=null;		
		if(req.getParameter("req")==null) {
			rd= req.getRequestDispatcher("/account/join1.jsp");
			rd.forward(req, resp);
		}else {
			rd= req.getRequestDispatcher("/account/join2.jsp");
			rd.forward(req, resp);
		}
		//join.jsp¸ø¿À³ª
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String Jname = req.getParameter("name");
		String Jid = req.getParameter("id");
		String Jpw = req.getParameter("pw");
		String Jemail = req.getParameter("email");
		int Jphone = Integer.parseInt(req.getParameter("phone"));
		String bday1=req.getParameter("bday");
	
	
		Account_Dao dao = new Account_Dao();
		dao.joinUser(Jname, Jid, Jpw, Jemail, Jphone, bday1);
		
		System.out.println(Jname+"/"+Jid+"/"+Jpw+"/"+Jemail+"/"+Jphone+"/"+bday1);
		RequestDispatcher rd= req.getRequestDispatcher("/account/join3.jsp");
		rd.forward(req, resp);
		
	}
}
