<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
     h1{
            width:800px;
            height:50px;
            text-align: center;
            color:rgb(3,73,120);
            font-weight: bolder;
            margin: auto;
            font-size:40px;
            padding-bottom: 30px;
            border-bottom:1px solid lightgray;
            
        }
        hr{
            border:1px solid lightgray;
            width:800px;
        }
        #btn{
            display:inline-flex;
            width:500px;
            height: 50px;
            margin-left: 780px;
            margin-bottom: 10px;
        }
        input{
            border:1px solid white;
            height:50px;
            width:200px;
            background-color:rgb(3,73,120);
            list-style: none;
            text-align: center;
            line-height: 50px;
            font-size:25px;
            color:white;
            font-weight: bold;
        }
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>회원가입을 축하드립니다!</h1>
	<input value="로그인으로 돌아가기" type="button" name="backlogin" id="backlogin" onclick="location='<%=request.getContextPath()%>/login'">
	<input value="메인으로 돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath()%>'">
<jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>