<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		text-align:center;
	}
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
            margin-bottom:50px;
        }
</style>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>오시는길</h1>
	<hr>
	<div>
	<img src="<%=request.getContextPath() %>/UI/imgs/acacome.PNG"/>	
	</div>
	<hr>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>