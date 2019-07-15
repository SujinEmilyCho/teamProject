<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<form action="" method="post">
		<label  for="name">이 름</label>
		<input type="text" name="name" id="name"><br>
		
		<label  for="phone">전화번호</label>
		<input type="text" name="phone" id="phone"><br>
		
		<label  for="category">카테고리</label>
		<select name="category">
			<option value="강좌문의">강좌문의</option>
			<option value="기타문의">기타문의</option>
		</select><br>
		
		<label  for="sub">제 목</label>
		<input type="text" name="sub" id="sub"><br>
		
		<label  for="content">내 용</label>
		<input type="text" name="content" id="content"><br>
		
		<input type="submit" value="문의하기">
		<input type="reset" value="다시쓰기">
		
	</form>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>