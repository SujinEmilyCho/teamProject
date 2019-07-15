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
//		req.getSession().invalidate();	//테스트용 라인, 기존 세션 종료
		
		HttpSession	session = req.getSession();
		ClassBbs_Dao classBbsDao=new ClassBbs_Dao();
		
//		session.setAttribute("accountNum", 1);	//테스트용 라인 강사: 8, 학생:9, 행정:1, 영업:2,  비회원: 6
//		session.setAttribute("accountType", 1); //테스트용 라인
//		session.setAttribute("courseCode", "1906JAVA");//테스트용 라인
		
		//계정없는 경우
		if(session.getAttribute("accountNum")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/loginRequired.jsp"); // 에러페이지 컨트롤러 만들기
			return;
		//계정이 있지만 accountType이 없는 경우
		}else if(session.getAttribute("accountType")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp"); // 에러페이지 컨트롤러 만들기
			return;
		}
				
		//계정 타입별 동작
//		int accountNum= (Integer)session.getAttribute("accountNum"); // 아마 필요없을 걸?
		int accountType = (Integer)session.getAttribute("accountType");
		String courseCode=null;
		//검색 키워드 처리
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
			//행정팀
			case 1:
				//select에 진행중인 과정 리스트 받기
				ArrayList<String> codes=classBbsDao.getCourseCodes();
				req.setAttribute("codes", codes);
				//선택한 반 정보 없을 경우 디폴트값 설정
				if((courseCode=(String)req.getParameter("courseCode"))==null) {
					courseCode=codes.get(0);
					req.setAttribute("courseCode", courseCode);
				}
				break;
			//영업팀 권한 없음
			case 2:
				resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp"); // 에러페이지 컨트롤러 만들기
				return;
			//강사
			case 3:
				courseCode=(String)session.getAttribute("courseCode");
				//계정에 아직 반 정보가 입력되지 않은 경우
				if(courseCode==null) {
					resp.sendRedirect(req.getContextPath()+"/error/notPreparedYet.jsp"); // 에러페이지 컨트롤러 만들기
					return;
				}
				break;
			//학생
			case 4:
				courseCode=(String)session.getAttribute("courseCode");
				//계정에 아직 반 정보가 입력되지 않은 경우
				if(courseCode==null) {
					resp.sendRedirect(req.getContextPath()+"/error/notPreparedYet.jsp"); // 에러페이지 컨트롤러 만들기
					return;
				}			
				break;
		}
		//게시판 리스트 불러오기
		ArrayList<ClassBbs_Dto> list = classBbsDao.getList(courseCode, keyword);
		//게시글 개수 추출
		int total = list.get(0).getNum();
		list.remove(0);
		
		//전체 게시글 개수, 게시글 리스트 뷰로 보내기
		req.setAttribute("total", total);
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/classbbs/classBbs.jsp");
		rd.forward(req, resp);
		}
}