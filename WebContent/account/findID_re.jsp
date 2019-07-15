
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
        #findre{
            margin: 25px auto;
            border:1px dotted rgb(3,73,120);
            width:700px;
            height: 100px;
            text-align: center;
            font-size: 30px;
            padding-top: 80px;
        }
        #btn{
            display:inline-flex;
            width:500px;
            height: 50px;
            margin-left: 780px;
            margin-bottom: 10px;
        }
        #goback{
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
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>아이디찾기</h1>
	<div id="findre">
	<%=request.getAttribute("FIname") %>님의 아이디는 '<%=request.getAttribute("fIID") %>'입니다.
	</div>
	<div id="btn">
	<input value="로그인으로 돌아가기" type="button" name="backlogin" id="backlogin" onclick="location='<%=request.getContextPath()%>/login'">
	<input value="메인으로 돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath()%>'">
	</div>
<jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>