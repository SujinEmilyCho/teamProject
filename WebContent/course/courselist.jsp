<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bit.course.model.CourseDto" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.frame.css"/>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	table>thead>tr>th{
		border:1px solid;
	}
	table>tbody>tr>td{
		border:1px solid;
	}
	
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<% String root= request.getContextPath(); %>
	<form action="course">

		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>과정</th>
					<th>강사</th>
					<th>최대수용인원</th>
					<th>현재수용인원</th>
					<th>교실</th>
					<th>기간</th>
					<th>개설상태</th>
					
				</tr>
			</thead>
			
			<tbody>
				<%
					ArrayList<CourseDto> list=(ArrayList<CourseDto>)request.getAttribute("list");
					if(list!=null){
						for(CourseDto bean:list){
					
				%>
					<tr>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getCoursecode() %></a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getTitle() %></a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getTeacher() %></a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getMaxstu() %></a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>">0</a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getClassroom() %></a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getPeriod() %></a></td>
						<td><a href="<%=root %>/course/detail?idx=<%=bean.getCoursecode()%>"><%=bean.getStatus() %></a></td>
					</tr>
						
						
						
					
				<%
						}
					}
				%>
						
			</tbody>
		</table>

		</form>
		<form action="course" method="post">
						<label>년도</label>
						<select name="coursecode1">
								<option>null</option>
				<%
					if(list!=null){
						for(CourseDto bean:list){
					
				%>
								<option><%=bean.getCoursecode()%></option>
				<%
						}
					}
				%>
						</select>
						<label>강좌명</label>
						<select name="title1">
								<option>null</option>
				<%
					if(list!=null){
						for(CourseDto bean:list){
					
				%>
								<option><%=bean.getTitle()%></option>
				<%
						}
					}
				%>
						</select>
						<label>상태</label>
						<select name="status1">
								<option>null</option>
				<%
					if(list!=null){
						for(CourseDto bean:list){
					
				%>
								<option><%=bean.getStatus()%></option>
				<%
						}
					}
				%>
						</select>
						<input type="submit" for="search" value="조회">
						<input type="text" name ="search" value="null">
						<input type="submit" for="search" value="검색">
				</form>		
				
	
	<a href="<%=root %>/course/courseinsert"><button>추가</button></a>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>