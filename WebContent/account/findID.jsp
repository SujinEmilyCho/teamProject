<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h1>아이디찾기</h1>
	<form action="" method="post">
	<label for="name">성함</label><br>
	 <input type="text" name="name" id="name" ><br>
	 <label for="email">이메일</label><br>
	 <input type="text" name="email" id="email"><br>
	 <label for="bday">생년월일</label><br>
	 <input type="text" name="bday" id="bday"><br>
	 <label for="phone">전화번호</label><br>
	 <input type="text" name="phone" id="phone"><br>
	 
	 <button type="submit">찾기</button>
	 <input type="button" onclick="location='login'" value="취소">
	 
	 </form>
	 <%
   Object obj =request.getAttribute("errnsg");
   if(obj!=null)out.print(obj);
   %>
</body>
</html>