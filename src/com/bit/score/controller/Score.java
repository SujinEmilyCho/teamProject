package com.bit.score.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.score.model.ScoreDao;
import com.bit.score.model.ScoreDto;

@WebServlet("/score")
public class Score extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getSession().invalidate();	//�׽�Ʈ�� ����, ���� ���� ����
		
		HttpSession session=req.getSession();		
		ScoreDao dao=new ScoreDao();
		ArrayList<ScoreDto> score=null;
		
//		session.setAttribute("accountNum", 1);	//�׽�Ʈ�� ���� ����: 8, �л�:9, ����:1, ����:2,  ��ȸ��: 6
//		session.setAttribute("accountType", 1); //�׽�Ʈ�� ����
//		session.setAttribute("courseCode", "1906JAVA");//�׽�Ʈ�� ����
		
		System.out.println(session.getAttribute("accountNum"));
		System.out.println(session.getAttribute("accountType"));
		
		//�������� ���
		if(session.getAttribute("accountNum")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/loginRequired.jsp"); // ���������� ��Ʈ�ѷ� �����
			return;
		//������ ������ accountType�� ���� ���
		}else if(session.getAttribute("accountType")==null || (Integer)session.getAttribute("accountType")==0) {
			resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp"); // ���������� ��Ʈ�ѷ� �����
			return;
		}
		
		
		
		//���� Ÿ�Ժ� ����
		int accountNum= (Integer)session.getAttribute("accountNum");
		int accountType = (Integer)session.getAttribute("accountType");
		String courseCode=null;
		
		switch(accountType) {
			//������
			case 1:
				//select�� �������� ���� ����Ʈ �ޱ�
				ArrayList<String> codes = dao.getCourseCodes();
				req.setAttribute("codes", codes);
				//������ �� ���� ���� ��� ����Ʈ�� ����
				if((courseCode=req.getParameter("courseCode"))==null) {
					courseCode = codes.get(0);
				}
				//������ �� ���� ���� �ޱ�
				score=dao.getScore(courseCode);
				break;
			//������ ���� ����
			case 2:
				resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp"); // ���������� ��Ʈ�ѷ� �����
				return;
			//����
			case 3:
				courseCode=(String)session.getAttribute("courseCode");
				//������ ���� �� ������ �Էµ��� ���� ���
				if(courseCode==null) {
					resp.sendRedirect(req.getContextPath()+"/error/notPreparedYet.jsp"); // ���������� ��Ʈ�ѷ� �����
					return;
				}
				//�� ���� ���� �ޱ�
				score=dao.getScore(courseCode);
				break;
			//�л�
			case 4:
				courseCode=(String)session.getAttribute("courseCode");
				//������ ���� �� ������ �Էµ��� ���� ���
				if(courseCode==null) {
					resp.sendRedirect(req.getContextPath()+"/error/notPreparedYet.jsp"); // ���������� ��Ʈ�ѷ� �����
					return;
				}
				//���� ���� �ޱ�
				score=dao.getMyScore(accountNum, courseCode);				
				break;
		}

		req.setAttribute("score", score);
		RequestDispatcher rd=req.getRequestDispatcher("/score/score.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String[] params1=req.getParameterValues("accountNum");
		String[] params2=req.getParameterValues("score");
		String courseCode=(String)session.getAttribute("courseCode");
		int[] accountNums = new int[params1.length];
		for(int i=0; i<params1.length ;i++) {
			accountNums[i]=Integer.parseInt(params1[i]);
		}
		
		int[] scores = new int[params2.length];
		for(int i=0; i<params2.length ;i++) {
			scores[i]=Integer.parseInt(params2[i]);
		}
		
		ScoreDao dao=new ScoreDao();
		dao.updateScore(accountNums, scores);	
		doGet(req, resp);
	}
}
