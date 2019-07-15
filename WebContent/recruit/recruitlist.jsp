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
    
	table{
		border-collapse: collapse;
        text-align: center;
         width: 700px;
         margin: 0px auto;
	}
    table>thead>tr>th{
		border:1px solid;
        background-color: rgb(3,73,120);
            font-size:25px;
            color:white;
	}
	table>thead>tr>td{
		border:1px solid;
	}
	table>tbody>tr>td{
		border:1px solid;
		
	}
    table>tbody>tr>td>a{
		text-decoration:none;
        	color:black;
        	font-size:23px;
        	font-weight:bold;
		
	}
    tbody tr:nth-child(2n+1) {
            background-color: beige;
        }
    body>form>button{
       width: 70px;
        height: 30px;
        position: absolute;
        top:0;
        right: 0;
        bottom:0;
        left: 0;
        margin: auto;
        
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
    <h1>모집 과정</h1>
    <hr>
	<form action="recruit/recruitadd" method="get">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>기간</th>
			</tr>
		</thead>
		<tbody>
			<%
				ArrayList<RecruitDto> list=(ArrayList<RecruitDto>)request.getAttribute("list");
				if(list!=null){
					for(RecruitDto bean:list){
			%>
				<tr>
					<td><a href="<%=request.getContextPath() %>/recruit/recruitdetail?idx=<%=bean.getNum() %>"><%=bean.getNum() %></a></td>
					<td><a href="<%=request.getContextPath() %>/recruit/recruitdetail?idx=<%=bean.getNum() %>"><%=bean.getSub() %></a></td>
					<td><a href="<%=request.getContextPath() %>/recruit/recruitdetail?idx=<%=bean.getNum() %>"><%=bean.getPeriod() %></a></td>
				</tr>
			
			<%
					}
				}
			%>
		</tbody>
	</table>
	<hr>
	
	<button type="submit">글쓰기</button>
	</form>
	
	

<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>