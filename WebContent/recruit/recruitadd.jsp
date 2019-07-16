<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bit.recruit.model.RecruitDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="../css/frame.css"/>
<style type="text/css">
	  body{
        width:1920px;
        height:900px;
    }
	div>table{
		border-collapse: collapse;
        text-align: center;
        width: 700px;
        margin: 0px auto;
        margin-top:20px;
        margin-bottom: 20px;
	}
	div>table>thead>tr>th{
		border:1px solid;
        background-color: rgb(3,73,120);
        font-size:20px;
        color:white;
	}
	div>table>thead>tr>td{
		border-bottom:1px solid lightgray;
        margin-bottom: 10px;
	}
    #btn{
        text-align:center;
    }
    #btn>button{
        width:120px;
        height:40px;
        background-color:rgb(3,73,120);
        color:white;
        border:1px solid white;
        font-size:20px;
        font-weight: bold;
    }
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<%
SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");

Date time = new Date();

String nowDay = format.format(time);

RecruitDto bean=(RecruitDto)request.getAttribute("bean");

%>
<form action="" method="post">
	<div>
	<table>

		<thead>
			
			<tr>
			<div>
				<th>글번호</th>
				<td><span></span></td>
			</div>
			
			<div>
				<th><label for="category">강좌분류</label></th>
				<td><input type="text" name="category" id="category" /></td>
			</div>	
			
			</tr>
			<tr>
				<th>작성자</th>
				<td>영업팀</td>
				
				<th>날짜</th>
				<td><span><%=nowDay %></span></td>
			</tr>
			
			<tr>
				<th><label for="sub">제목</label></th>
				<td><input type="text" name="sub" id="sub" /></td>
				
				<th><label for="period">강좌기간</label></th>
				<td><input type="text" name="period" id="period" /></td>
			</tr>
		
		</thead>
		
		<tbody>
				<tr>
					<td colspan="4"><textarea name="content" cols="100" rows="30"></textarea></td>
				</tr>
		</tbody>
	</table>
	<div id="btn">
	<button type="submit">저장</button>
	<button type="reset">돌아가기</button>
 </div>
 </div>
</form>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>