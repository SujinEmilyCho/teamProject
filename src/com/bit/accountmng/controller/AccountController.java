package com.bit.accountmng.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.accountmng.model.AccountDao;

//Account list �����ִ� ������
@WebServlet("/account")	
public class AccountController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDao dao = new AccountDao(); //Account list �ϱ� dao ȣ���ؼ� view �� �Ѱ��ֱ�
		requset.setAttribute("list", dao.getAccount());
		
		RequestDispatcher rd= requset.getRequestDispatcher("/accountmng/accountlist.jsp");
		rd.forward(requset, response);
		
		
	}
	

	// account.bit
	
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ActionForward forward = new ActionForward();
//		
////		AccountDao dao = AccountDao.getInstance(); //Account list �ϱ� dao ȣ���ؼ� view �� �Ѱ��ֱ�
////		request.setAttribute("list", dao.getAccount(null));
////		
////		RequestDispatcher rd= request.getRequestDispatcher("/account/accountlist.jsp");
////		rd.forward(request, response);
//		
//		
//		//���� ������ ��ȣ �����
//		int spage =1;	//start page
//		String page = request.getParameter("page");
//		
//		if(page != null){
//			spage = Integer.parseInt(page);
//		}
//		
//		//�˻����ǰ� �˻������� �����´�.
//		String opt = request.getParameter("opt");
//		String condition = request.getParameter("condition");
//		
//		//�˻����ǰ� ������ Map�� ��´�.
//		HashMap<String, Object>listOpt = new HashMap<String, Object>();
//		listOpt.put("opt",opt);
//		listOpt.put("condition", condition);
//		listOpt.put("start", spage*10-9);
//		
//		AccountDao dao = AccountDao.getInstance();
//		int listCount = dao.getAccountListCount(listOpt);
//		ArrayList<AccountDto> list = dao.getAccount(listOpt);
//		
//		//�� ȭ�鿡 10���� �Խñ��� ����������
//		//������ ��ȣ�� �� 5��, ���ķδ� [����]���� ǥ��
//		
//		//��ü ������ ��
//		int maxPage = (int)(listCount/10.0 + 0.9);
//		
//		//���� ������ ��ȣ
//		int startPage = (int)(spage/5.0 + 0.8) * 5-4;
//		
//		//������ ������ ��ȣ
//		int endPage = startPage + 4;
//		if(endPage > maxPage) endPage = maxPage;
//		
//		// 4�� ������ ��ȣ ����
//		request.setAttribute("spage", spage);
//		request.setAttribute("maxPage", maxPage);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		
//		//���� �� ���� �۸�� ����
//		//request.setAttribute("listCount", listCount);
//		request.setAttribute("list", list);
//		
//		//�ܼ� ��ȸ�̹Ƿ� forward()��� (DB�� ���� ��ȭ �����Ƿ�)
//		forward.setRedirect(false);
//		forward.setNextPath("accountlist.bit");
//		
//		return forward;
//	}
	
}
