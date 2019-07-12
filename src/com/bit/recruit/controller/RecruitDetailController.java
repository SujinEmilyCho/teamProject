package com.bit.recruit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.recruit.model.RecruitDao;

/**
 * Servlet implementation class RecruitDetailController
 */
@WebServlet("/recruit/recruitdetail")
public class RecruitDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session =req.getSession();
//		if(session.getAttribute("result")==null){
//			resp.sendRedirect(req.getContextPath()+"/login/form.bit");
//		}else{//로그인 사용자만 볼 수 있게
			
			//resp.sendRedirect(req.getContextPath()+"/recruit/recruitdetail.bit");
			int num=Integer.parseInt(req.getParameter("idx"));
			RecruitDao dao=new RecruitDao();
			req.setAttribute("bean", dao.getListOne(num));
			
			RequestDispatcher rd = req.getRequestDispatcher("/recruit/recruitdetail.jsp");
			//여기서 루트는 해당프로젝트 부터이다. sendRedirect랑 다르게 -->이거는 포트번호 다음부터 다 쳐야됨
			
			rd.forward(req, resp);
		}
		
	

	

}
