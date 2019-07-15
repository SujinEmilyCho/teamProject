package com.bit.accountmng.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.accountmng.model.AccountDao;

//Account list 보여주는 페이지
@WebServlet("/account")	
public class AccountController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDao dao = new AccountDao(); //Account list 니깐 dao 호출해서 view 로 넘겨주기
		requset.setAttribute("list", dao.getAccount());
		
		RequestDispatcher rd= requset.getRequestDispatcher("/accountmng/accountlist.jsp");
		rd.forward(requset, response);
		
		
	}	
}
