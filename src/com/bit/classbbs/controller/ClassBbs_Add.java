package com.bit.classbbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.classbbs.model.ClassBbs_Dao;

@WebServlet("/classbbs/add")
public class ClassBbs_Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		//������ ���� ���
		if(session.getAttribute("accountNum")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/loginRequired.jsp");
			return;
		//������ ������ accountType���� ���
		}else if(session.getAttribute("accountType")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp");
			return;
		}
		
		//���� ����, ����, �л�, ������ ���� �����ϵ��� �ڵ� �߰��������!
		RequestDispatcher rd = req.getRequestDispatcher("/classbbs/add.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassBbs_Dao classBbsDao = new ClassBbs_Dao();	
		int result=0;
		HttpSession session = req.getSession();		
		String courseCode = (String)session.getAttribute("courseCode");
		//�������� �۾��� ���
		if(courseCode==null) {
			courseCode=req.getParameter("courseCode");
		}
		int accountNum = (Integer)session.getAttribute("accountNum");
		int accountType = (Integer)session.getAttribute("accountType");
		String sub=req.getParameter("sub");
		if(sub==null) {sub="�������";}
		String content=req.getParameter("content");
		int notice=0;
		if(req.getParameter("notice")!=null) {
			notice =1;
		}
		
		//�׳� �۾���&��� ����: postNum�� replyNum�� ���̸� �׳� �۾��� / ���� ������ ���
		if(req.getParameter("postNum").equals("null")) {
			System.out.println(courseCode);
			System.out.println(accountNum);
			System.out.println(sub);
			System.out.println(content);
			System.out.println(notice);
			result = classBbsDao.addPost(courseCode, accountNum, sub, content, notice);
		}else {
			System.out.println("���");
			int postNum = Integer.parseInt(req.getParameter(("postNum")));
			int replyNum = Integer.parseInt(req.getParameter(("replyNum")))+1;
			result = classBbsDao.addReply(courseCode, postNum, replyNum, accountNum, sub, content, notice);
		}
		
		//DB insert ����� ������ ó��
		if(result==1) {
		//������ �������� �� �� �ִ� ���?
			if(accountType==1) {
				resp.sendRedirect(req.getContextPath()+"/classbbs?courseCode="+courseCode);
			}else {
				resp.sendRedirect(req.getContextPath()+"/classbbs");
			}
		//�̺κ� �ٽ� ���� ��� ����
		}else {
			String errmsg="<script type=\"text/javascript\">alert('�۾�����');</script>";
			req.setAttribute("errmsg", errmsg);
			doGet(req, resp);
		}
	}
}
