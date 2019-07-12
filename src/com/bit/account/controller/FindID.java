package com.bit.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bit.account.model.Account_Dao;

@WebServlet("/findid")
public class FindID extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd= req.getRequestDispatcher("/account/findID.jsp");
		rd.forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String FIname = req.getParameter("name");
		System.out.println("fileIdCon / method:Post / FIname="+FIname);
		String FIemail = req.getParameter("email");
		String FIbday = req.getParameter("bday");
		int FIphone = Integer.parseInt(req.getParameter("phone"));
		
		Account_Dao dao = new Account_Dao();
		String fIID = dao.findID(FIname, FIemail, FIbday, FIphone);
		if(fIID!=null){
			req.setAttribute("fIID", fIID);
			req.setAttribute("FIname",FIname);
			RequestDispatcher rd= req.getRequestDispatcher("/account/findID_re.jsp");
			rd.forward(req, resp);
		}else{
			req.setAttribute("errnsg","<script type=\"text/javascript\">alert(\"입력한 회원정보를 다시 확인해주세요.\");</script>");
			doGet(req, resp);
		}
	}
}
