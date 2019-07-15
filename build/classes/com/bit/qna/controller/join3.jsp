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
        }
        hr{
            border:1px solid lightgray;
            width:800px;
        }
        #btn{
            display:inline-flex;
            width:500px;
            height: 50px;
            margin-left: 590px;
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
    #hello{
        width:800px;
        height:100px;
        margin:auto;
        font-size:30px;
        text-align: center;
        line-height: 100px;
        font-weight: bold;
        color:rgb(3,73,120);
    }
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>회원가입 성공!</h1>
	<hr>
	<div id="hello">
	    안녕하세요!
	    비트캠프에 오신 것을 환영합니다.
	</div>
	<hr>
	<div id="btn">
	<input value="로그인으로 돌아가기" type="button" name="backlogin" id="backlogin" onclick="location='<%=request.getContextPath()%>/login'">
	<input value="메인으로 돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath()%>'">
	</div>
<jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>