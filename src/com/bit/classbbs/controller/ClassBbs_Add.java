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
		
		//계정이 없는 경우
		if(session.getAttribute("accountNum")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/loginRequired.jsp");
			return;
		//계정은 있지만 accountType없는 경우
		}else if(session.getAttribute("accountType")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp");
			return;
		}
		
		//영업 제외, 강사, 학생, 행정만 접근 가능하도록 코드 추가해줘야해!
		RequestDispatcher rd = req.getRequestDispatcher("/classbbs/add.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassBbs_Dao classBbsDao = new ClassBbs_Dao();	
		int result=0;
		HttpSession session = req.getSession();		
		String courseCode = (String)session.getAttribute("courseCode");
		//행정팀이 글쓰는 경우
		if(courseCode==null) {
			courseCode=req.getParameter("courseCode");
		}
		int accountNum = (Integer)session.getAttribute("accountNum");
		int accountType = (Integer)session.getAttribute("accountType");
		String sub=req.getParameter("sub");
		if(sub==null) {sub="제목없음";}
		String content=req.getParameter("content");
		int notice=0;
		if(req.getParameter("notice")!=null) {
			notice =1;
		}
		
		//그냥 글쓰기&답글 구분: postNum와 replyNum가 널이면 그냥 글쓰기 / 값이 있으면 답글
		if(req.getParameter("postNum").equals("null")) {
			System.out.println(courseCode);
			System.out.println(accountNum);
			System.out.println(sub);
			System.out.println(content);
			System.out.println(notice);
			result = classBbsDao.addPost(courseCode, accountNum, sub, content, notice);
		}else {
			System.out.println("답글");
			int postNum = Integer.parseInt(req.getParameter(("postNum")));
			int replyNum = Integer.parseInt(req.getParameter(("replyNum")))+1;
			result = classBbsDao.addReply(courseCode, postNum, replyNum, accountNum, sub, content, notice);
		}
		
		//DB insert 결과로 페이지 처리
		if(result==1) {
		//디테일 페이지로 갈 수 있는 방법?
			if(accountType==1) {
				resp.sendRedirect(req.getContextPath()+"/classbbs?courseCode="+courseCode);
			}else {
				resp.sendRedirect(req.getContextPath()+"/classbbs");
			}
		//이부분 다시 구현 방법 생각
		}else {
			String errmsg="<script type=\"text/javascript\">alert('작업실패');</script>";
			req.setAttribute("errmsg", errmsg);
			doGet(req, resp);
		}
	}
}
