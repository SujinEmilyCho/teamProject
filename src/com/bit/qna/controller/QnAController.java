package com.bit.qna.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.qna.model.QnADao;

@WebServlet("/qna")
public class QnAController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//�ױױױ� ����Ʈ 
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		session.setAttribute("accountType", 2);		//�׽�Ʈ�� ����
		int accountType=0;
		if(session.getAttribute("accountType")!=null) {
			accountType=(Integer)session.getAttribute("accountType");
		};
		
		//�����ڰ� ��������� ���
		if(accountType==2) {
			QnADao dao=new QnADao();
			req.setAttribute("list", dao.getlist());
			RequestDispatcher rd= req.getRequestDispatcher("/qna/QnA.jsp");
			rd.forward(req, resp);
		}else {
			RequestDispatcher rd= req.getRequestDispatcher("/qna/QnAWrite.jsp");
			rd.forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//����.
		
		req.setCharacterEncoding("UTF-8");
		HashMap<String,String> map=new HashMap<String,String>();
		Enumeration<String> enums = req.getParameterNames();
		int i=0;
		while(enums.hasMoreElements()){
			String key=enums.nextElement();
			String value=req.getParameter(key);
			map.put(key, value);
		}
		
		String name=map.get("name");
		int phone=Integer.parseInt(map.get("phone"));
		String category=map.get("category");
		String sub=map.get("sub");
		String content=map.get("content");
		
		
		System.out.println("*--------------*");
		System.out.println("name"+name);
		System.out.println("phone"+phone);
		System.out.println("category"+category);
		System.out.println("sub"+sub);
		System.out.println("content"+content);
		QnADao dao=new QnADao();
		dao.insert(name, phone, category, sub, content);
			
		resp.sendRedirect(req.getContextPath()+"/qna/QnAWrite.jsp");
		
	}

}
