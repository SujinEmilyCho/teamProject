<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>LOGIN</title>
<style type="text/css">
	div{
		display:block;
	}
</style>
</head>
<body>
	<form action="" method="post">
	<h1>로그인</h1>
	<div>
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="ID"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="PW"></td>
			</tr>
		</table>
	</div>
	<button type="submit" value="login">로그인</button>
	<a href="join">회원가입</a>
	<a href="findid">아이디찾기</a>
	<a href="">비밀번호찾기</a>
	</form>
	<%
   Object obj =request.getAttribute("errnsg");
   if(obj!=null)out.print(obj);
   %>
</body>
</html>