package com.bit.classbbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.classbbs.model.ClassBbs_Dao;
import com.bit.classbbs.model.ClassBbs_Dto;

@WebServlet("/classbbs")
public class ClassBbs extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
//		req.getSession().invalidate();	//�׽�Ʈ�� ����, ���� ���� ����
		
		HttpSession	session = req.getSession();
		ClassBbs_Dao classBbsDao=new ClassBbs_Dao();
		
//		session.setAttribute("accountNum", 1);	//�׽�Ʈ�� ���� ����: 8, �л�:9, ����:1, ����:2,  ��ȸ��: 6
//		session.setAttribute("accountType", 1); //�׽�Ʈ�� ����
//		session.setAttribute("courseCode", "1906JAVA");//�׽�Ʈ�� ����
		
		//�������� ���
		if(session.getAttribute("accountNum")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/loginRequired.jsp"); // ���������� ��Ʈ�ѷ� �����
			return;
		//������ ������ accountType�� ���� ���
		}else if(session.getAttribute("accountType")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp"); // ���������� ��Ʈ�ѷ� �����
			return;
		}
				
		//���� Ÿ�Ժ� ����
//		int accountNum= (Integer)session.getAttribute("accountNum"); // �Ƹ� �ʿ���� ��?
		int accountType = (Integer)session.getAttribute("accountType");
		String courseCode=null;
		//�˻� Ű���� ó��
		String keyword = req.getParameter("keyword");
		if((keyword)==null){
			keyword="%%";
		}else {
			keyword="%"+keyword+"%";
		}
		int row=10;
		if(req.getParameter("row")!=null) {
			row=Integer.parseInt(req.getParameter("row"));
		};
		req.setAttribute("row", row);
		System.out.println(keyword);
		System.out.println(row);
 
		switch (accountType) {
			//������
			case 1:
				//select�� �������� ���� ����Ʈ �ޱ�
				ArrayList<String> codes=classBbsDao.getCourseCodes();
				req.setAttribute("codes", codes);
				//������ �� ���� ���� ��� ����Ʈ�� ����
				if((courseCode=(String)req.getParameter("courseCode"))==null) {
					courseCode=codes.get(0);
					req.setAttribute("courseCode", courseCode);
				}
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
				break;
			//�л�
			case 4:
				courseCode=(String)session.getAttribute("courseCode");
				//������ ���� �� ������ �Էµ��� ���� ���
				if(courseCode==null) {
					resp.sendRedirect(req.getContextPath()+"/error/notPreparedYet.jsp"); // ���������� ��Ʈ�ѷ� �����
					return;
				}			
				break;
		}
		//�Խ��� ����Ʈ �ҷ�����
		ArrayList<ClassBbs_Dto> list = classBbsDao.getList(courseCode, keyword);
		//�Խñ� ���� ����
		int total = list.get(0).getNum();
		list.remove(0);
		
		//��ü �Խñ� ����, �Խñ� ����Ʈ ��� ������
		req.setAttribute("total", total);
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/classbbs/classBbs.jsp");
		rd.forward(req, resp);
		}
}