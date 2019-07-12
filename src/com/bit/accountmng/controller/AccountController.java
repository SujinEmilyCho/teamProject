package com.bit.accountmng.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.accountmng.model.AccountDao;

//Account list 보여주는 페이지
@WebServlet("/account")	
public class AccountController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDao dao = new AccountDao(); //Account list 니깐 dao 호출해서 view 로 넘겨주기
		requset.setAttribute("list", dao.getAccount());
		
		RequestDispatcher rd= requset.getRequestDispatcher("/accountmng/accountlist.jsp");
		rd.forward(requset, response);
		
		
	}
	

	// account.bit
	
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ActionForward forward = new ActionForward();
//		
////		AccountDao dao = AccountDao.getInstance(); //Account list 니깐 dao 호출해서 view 로 넘겨주기
////		request.setAttribute("list", dao.getAccount(null));
////		
////		RequestDispatcher rd= request.getRequestDispatcher("/account/accountlist.jsp");
////		rd.forward(request, response);
//		
//		
//		//현재 페이지 번호 만들기
//		int spage =1;	//start page
//		String page = request.getParameter("page");
//		
//		if(page != null){
//			spage = Integer.parseInt(page);
//		}
//		
//		//검색조건과 검색내용을 가져온다.
//		String opt = request.getParameter("opt");
//		String condition = request.getParameter("condition");
//		
//		//검색조건과 내용을 Map에 담는다.
//		HashMap<String, Object>listOpt = new HashMap<String, Object>();
//		listOpt.put("opt",opt);
//		listOpt.put("condition", condition);
//		listOpt.put("start", spage*10-9);
//		
//		AccountDao dao = AccountDao.getInstance();
//		int listCount = dao.getAccountListCount(listOpt);
//		ArrayList<AccountDto> list = dao.getAccount(listOpt);
//		
//		//한 화면에 10개의 게시글을 보여지게함
//		//페이지 번호는 총 5개, 이후로는 [다음]으로 표시
//		
//		//전체 페이지 수
//		int maxPage = (int)(listCount/10.0 + 0.9);
//		
//		//시작 페이지 번호
//		int startPage = (int)(spage/5.0 + 0.8) * 5-4;
//		
//		//마지막 페이지 번호
//		int endPage = startPage + 4;
//		if(endPage > maxPage) endPage = maxPage;
//		
//		// 4개 페이지 번호 저장
//		request.setAttribute("spage", spage);
//		request.setAttribute("maxPage", maxPage);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		
//		//글의 총 수와 글목록 저장
//		//request.setAttribute("listCount", listCount);
//		request.setAttribute("list", list);
//		
//		//단순 조회이므로 forward()사용 (DB의 상태 변화 없으므로)
//		forward.setRedirect(false);
//		forward.setNextPath("accountlist.bit");
//		
//		return forward;
//	}
	
}
