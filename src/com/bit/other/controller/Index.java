package com.bit.other.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/index","/hello","/intro", "/teacher", "/db", "/java","/web", "/come"})
public class Index extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher rd=null;
		String uri=request.getRequestURI().replaceAll(request.getContextPath(), "");
		if(uri.equals("/index")){
			rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/hello")){
			rd = request.getRequestDispatcher("/info/acahello.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/intro")){
			rd = request.getRequestDispatcher("/info/acaintro.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/teacher")){
			rd = request.getRequestDispatcher("/info/acateacher.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/db")){
			rd = request.getRequestDispatcher("/info/DB.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/java")){
			rd = request.getRequestDispatcher("/info/java.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/web")){
			rd = request.getRequestDispatcher("/info/web.jsp");
			rd.forward(request, response);
		}else if(uri.equals("/come")){
			rd = request.getRequestDispatcher("/info/come.jsp");
			rd.forward(request, response);
		}
	}
}
