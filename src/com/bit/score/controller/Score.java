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
//		req.getSession().invalidate();	//테스트용 라인, 기존 세션 종료
		
		HttpSession session=req.getSession();		
		ScoreDao dao=new ScoreDao();
		ArrayList<ScoreDto> score=null;
		
//		session.setAttribute("accountNum", 1);	//테스트용 라인 강사: 8, 학생:9, 행정:1, 영업:2,  비회원: 6
//		session.setAttribute("accountType", 1); //테스트용 라인
//		session.setAttribute("courseCode", "1906JAVA");//테스트용 라인
		
		System.out.println(session.getAttribute("accountNum"));
		System.out.println(session.getAttribute("accountType"));
		
		//계정없는 경우
		if(session.getAttribute("accountNum")==null) {
			resp.sendRedirect(req.getContextPath()+"/error/loginRequired.jsp"); // 에러페이지 컨트롤러 만들기
			return;
		//계정이 있지만 accountType이 없는 경우
		}else if(session.getAttribute("accountType")==null || (Integer)session.getAttribute("accountType")==0) {
			resp.sendRedirect(req.getContextPath()+"/error/notAuthorized.jsp"); // 에러페이지 컨트롤러 만들기
			return;
		}
		
		
		
		//계정 타입별 동작
		int accountNum= (Integer)session.getAttribute("accountNum");
		int accountType = (Integer)session.getAttribute("accountType");
		String courseCode=null;
		
		switch(accountType) {
			//행정팀
			case 1:
				//select에 진행중인 과정 리스트 받기
				ArrayList<String> codes = dao.getCourseCodes();
				req.setAttribute("codes", codes);
				//선택한 반 정보 없을 경우 디폴트값 설정
				if((courseCode=req.getParameter("courseCode"))==null) {
					courseCode = codes.get(0);
				}
				//선택한 반 점수 정보 받기
				score=dao.getScore(courseCode);
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
				//반 점수 정보 받기
				score=dao.getScore(courseCode);
				break;
			//학생
			case 4:
				courseCode=(String)session.getAttribute("courseCode");
				//계정에 아직 반 정보가 입력되지 않은 경우
				if(courseCode==null) {
					resp.sendRedirect(req.getContextPath()+"/error/notPreparedYet.jsp"); // 에러페이지 컨트롤러 만들기
					return;
				}
				//개인 점수 받기
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
