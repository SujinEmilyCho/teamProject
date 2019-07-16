package com.bit.classbbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.classbbs.model.PostComment_Dao;

@WebServlet("/classbbs/comment")
public class PostComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		int accountNum = (Integer)session.getAttribute("accountNum");
		int classBbsNum = Integer.parseInt(req.getParameter("classBbsNum"));
		String content = req.getParameter("content");
		System.out.println(content);
		
		PostComment_Dao postCommentDao = new PostComment_Dao();
		int result = postCommentDao.addComment(classBbsNum, accountNum, content);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		PostComment_Dao postCommentDao = new PostComment_Dao();
		postCommentDao.deleteComment(num);
	}
}
