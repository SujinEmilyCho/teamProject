<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입을 축하드립니다!</h1>
	<input value="로그인으로 돌아가기" type="button" name="backlogin" id="backlogin" onclick="location='<%=request.getContextPath()%>/login'">
	<input value="메인으로 돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath()%>'">
</body>
</html>