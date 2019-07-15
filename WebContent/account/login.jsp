<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
	h1{
            width:300px;
            height:50px;
            text-align: center;
            color:rgb(3,73,120);
            font-weight: bolder;
            margin: auto;
            font-size:40px;
        }
        #login{
            margin:auto;
            margin-top:40px;
            margin-bottom: 30px;
            width:40px;
            height:100px;
            padding:70px 70px 70px 70px;
            border-top:3px solid lightgray;
            border-bottom:3px solid lightgray;
        }
        td{
            font-size:35px;
            width:70px;
            color:rgb(3,73,120);
            font-weight:bold;
        }
        #input{
            width:80px;
            height:60px;
            font-size:35px;
        }
        button{
            color:white;
            border:1px solid rgb(3,73,120);
            font-weight: bold;
            width:100px;
            height:50px;
            background-color:rgb(3,73,120);
            font-size:25px;
        }
        #btn{
            display:inline-flex;
            width:500px;
            height: 100px;
            margin-left: 675px;
            margin-bottom: 150px;
        }
        #btn>li{
            border:1px solid white;
            height:50px;
            width:200px;
            background-color:rgb(3,73,120);
            list-style: none;
            text-align: center;
            line-height: 50px;
            font-size:25px;
        }
        #btn>li>a{
            color:white;
            text-decoration: none;
            font-weight: bold;            
        }
</style>
<title>LOGIN</title>
<style type="text/css">
	div{
		display:block;
	}
</style>
</head>
<body>
<%String errmsg = (String)request.getAttribute("errmsg");
if(errmsg!=null){out.print(errmsg);}%>
<jsp:include page="/UI/headerUI.jsp"/>
	<form action="" method="post">
	<h1>로그인</h1>
	<div>
		<table id="login">
			<tr id="ID">
				<td>ID</td>
				<td id="input"><input type="text" name="ID"></td>
			</tr>
			<tr id="PW">
				<td>PW</td>
				<td id="input"><input type="password" name="PW"></td>
			</tr>
		</table>
	</div>
	<ul id="btn">
        <li><button type="submit" value="login">로그인</button></li>
        <li><a href="<%=request.getContextPath() %>/join"" id="join">회원가입</a></li>
        <li><a href="<%=request.getContextPath() %>/findid" id="findid">아이디찾기</a></li>
	</ul>
	</form>
<jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>