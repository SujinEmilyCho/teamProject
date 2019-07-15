
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>아이디찾기</h1>
	<div>
	<%=request.getAttribute("FIname") %>님의 아이디는 '<%=request.getAttribute("fIID") %>'입니다.
	</div>
	<input value="로그인으로 돌아가기" type="button" name="backlogin" id="backlogin" onclick="location='<%=request.getContextPath()%>/login'">
	<input value="메인으로 돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath()%>'">
<jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>