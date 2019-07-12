package com.bit.accountmng.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.accountmng.model.AccountDao;


@WebServlet("/account/accountedit")
public class AccountManagementController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {


		String str=req.getParameter("param");
		System.out.println(str);
		if(str!=null){
			
			String[] rowData=str.split("]");
			
			for(int i=0;i<rowData.length;i++){
				
				String[] data=rowData[i].split(",");
				
				String num=data[0];
				String type=data[1];
				String course=data[2];
				
				int aNum = Integer.parseInt(num);
				int aType = Integer.parseInt(type);
				
				//�ٿ�������
				//�ٿ� ȣ��
				
				AccountDao dao =new AccountDao();
				dao.updateAccount(aType,course,aNum);
				
			}
			RequestDispatcher rd =req.getRequestDispatcher("/account");	//������ list �������� ������
			rd.forward(req, resp);
		}else{
			AccountDao dao =new AccountDao(); //Account list�ϱ� dao ȣ���ؼ� view�� �Ѱ��ֱ�
			
			req.setAttribute("list", dao.getAccount());
		}
		RequestDispatcher rd =req.getRequestDispatcher("/accountmng/accountedit.jsp");
		rd.forward(req, resp);
		//�������� �����̷�Ʈ
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) //����Ÿ��, �����ڵ� �����ϰ� ������
			throws ServletException, IOException {
		
		System.out.println("post");
		int accountType=0;
		if(req.getParameter("accountType")!=null){
			accountType = Integer.parseInt(req.getParameter("accountType"));
		}
		String courseCode = req.getParameter("courseCode");
		int accountNum=0;
		
		if(req.getParameter("accountType")!=null){
			accountNum =(Integer)(req.getSession().getAttribute("accountNum"));
		}
		
		AccountDao dao =new AccountDao();
		dao.updateAccount(accountType, courseCode, accountNum);
		resp.sendRedirect(req.getContextPath()+"/account/accountedit");
		
	}

}
