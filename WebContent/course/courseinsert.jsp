<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<%
	String root = request.getContextPath();
%>
<form action="" method="post">
<h2>입력 페이지</h2>
			
				<div>
					<label for="coursecode">강좌코드</label>
					<input type="text" name="coursecode" id="coursecode" />
				</div>
				<div>
					<label for="title">강좌명</label>
					<input type="text" name="title" id="title" />
				</div>
				<div>
					<label for="teacher">강사명</label>
					<input type="text" name="teacher" id="teacher" />
				</div>
				<div>
					<label for="maxstu">최대수강인원</label>
					<input type="text" name="maxstu" id="maxstu" />
				</div>
				<div>
					<label for="classroom">교실</label>
					<input type="text" name="classroom" id="classroom" />
				</div>
				<div>
					<label for="period">기간</label>
					<input type="text" name="period" id="period" />
				</div>
				<div>
					<label for="status">상태</label>
					<input type="text" name="status" id="status" />
				</div>
				<div>
					<button type="submit">입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
			</form>		
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>