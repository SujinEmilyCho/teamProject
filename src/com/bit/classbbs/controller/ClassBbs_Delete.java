package com.bit.classbbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.classbbs.model.ClassBbs_Dao;

@WebServlet("/classbbs/delete")
public class ClassBbs_Delete extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int index = Integer.parseInt(req.getParameter("index"));
		ClassBbs_Dao classBbsDao = new ClassBbs_Dao();
		classBbsDao.deletePost(index);
		}
}
