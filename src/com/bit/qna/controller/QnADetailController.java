package com.bit.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.qna.model.QnADao;
import com.bit.qna.model.QnADto;




@WebServlet("/qna/detail")
public class QnADetailController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");	
		int num=Integer.parseInt(req.getParameter("idx"));
		QnADao dao=new QnADao();
		QnADto bean=dao.detail(num);
		req.setAttribute("bean", bean);
		RequestDispatcher rd = req.getRequestDispatcher("/qna/QnADetail.jsp");
		rd.forward(req, resp);
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//수정
		req.setCharacterEncoding("UTF-8");
		String name=req.getParameter("name");
		System.out.println("name의 값"+name);
		int num=0;
		String num2=req.getParameter("num");
		System.out.println("num2:"+num2);
		if(num2!=null) {
			num=Integer.parseInt(num2);
		}
		System.out.println("수정 num"+num);
		
		String status=req.getParameter("status");
		System.out.println("수정 status"+status);	
		QnADao dao=new QnADao();
		dao.edit(num,status);
		System.out.println("dao.edit num"+num);	
		
		resp.sendRedirect(req.getContextPath()+"/qna");
	}

}
