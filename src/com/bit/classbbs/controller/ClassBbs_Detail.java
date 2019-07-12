package com.bit.classbbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.classbbs.model.ClassBbs_Dao;
import com.bit.classbbs.model.ClassBbs_Dto;
import com.bit.classbbs.model.PostComment_Dao;
import com.bit.classbbs.model.PostComment_Dto;

@WebServlet("/classbbs/detail")
public class ClassBbs_Detail extends HttpServlet {	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int index=Integer.parseInt(req.getParameter("index"));
		
		ClassBbs_Dao classBbsDao = new ClassBbs_Dao();
		ClassBbs_Dto bean = classBbsDao.readPost(index);
		req.setAttribute("bean", bean);
		
		PostComment_Dao postCommentDao = new PostComment_Dao();
		ArrayList<PostComment_Dto> commentList= postCommentDao.readComment(index);
		req.setAttribute("commentList", commentList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/classbbs/detail.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//edit 기능 처리
		ClassBbs_Dao classBbsDao = new ClassBbs_Dao();
		int num=Integer.parseInt(req.getParameter("num"));
		String sub = req.getParameter("sub");
		if(sub==null) {sub="제목없음";}
		String content = req.getParameter("content");
		int notice=0;
		if(req.getParameter("notice")!=null) {
			notice=1;
		}
		System.out.println(req.getParameter("notice"));
		int result = classBbsDao.editPost(num, sub, content, notice);
		if(result==1) {
			resp.sendRedirect(req.getContextPath()+"/classbbs");
		}else {
			String errmsg="<script type=\"text/javascript\">alert('작업실패');</script>";
			req.setAttribute("errmsg", errmsg);
			doGet(req, resp);
		}
	}
}
