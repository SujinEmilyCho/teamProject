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
	<h1>�α���</h1>
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
	<button type="submit" value="login">�α���</button>
	<a href="join">ȸ������</a>
	<a href="findid">���̵�ã��</a>
	<a href="">��й�ȣã��</a>
	</form>
	<%
   Object obj =request.getAttribute("errnsg");
   if(obj!=null)out.print(obj);
   %>
</body>
</html>