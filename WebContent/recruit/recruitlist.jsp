<%@page import="com.bit.recruit.model.RecruitDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="css/frame.css"/>
<style type="text/css">
	table{
		border:1px ;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
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
					<td><a href="recruit/recruitdetail?idx=<%=bean.getNum() %>"><%=bean.getNum() %></a></td>
					<td><a href="recruit/recruitdetail?idx=<%=bean.getNum() %>"><%=bean.getSub() %></a></td>
					<td><a href="recruit/recruitdetail?idx=<%=bean.getNum() %>"><%=bean.getPeriod() %></a></td>
				</tr>
			
			<%
					}
				}
			%>
		</tbody>
	</table>
	<button type="submit">글쓰기</button>
	</form>
	
	


</body>
</html>