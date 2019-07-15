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
   #courselist{
   			width:1600px;
   			margin:auto;
            border-collapse: collapse;
            text-align: center;
            margin-bottom:50px;
        }
         th, td {
            border-bottom: 1px solid white;
            padding: 10px;
        }
        tbody tr:nth-child(2n) {
            background-color: white;
        }
        tbody tr:nth-child(2n+1) {
            background-color: beige;
        }
        #headtr {
            background-color: rgb(3,73,120);
            font-size:25px;
            color:white;
        }
        #searchcourse{
        	margin-left:560px;
        	display:inline-flex;
        	width:900px;
        	height:200px;
        	text-align:center;
        }
        #searchcourse>form>label{
        	font-size:20px;
            font-weight: bold;
            color:rgb(3,73,120);
        }
        #searchcourse>form>#jo{
        	font-size:20px;
        	color:white;
            border:1px solid white;
            font-weight: bold;
            width:80px;
            height:40x;
            background-color:rgb(3,73,120);
        }
        #searchcourse>form>#sear{
        	font-size:20px;
        	color:white;
            border:1px solid white;
            font-weight: bold;
            width:80px;
            height:40x;
            background-color:rgb(3,73,120);
        }
        #searchcourse>form>#sear_text{
        	font-size:20px;
            font-weight: bold;
            width:230px;
            height:40x;
        }
        #searchcourse>form>select{
        	font-size:20px;
        }
        #searchcourse>a{
        	font-size:20px;
        	color:white;
            border:1px solid white;
            font-weight: bold;
            width:80px;
            height:30px;
            line-height:30px;
            background-color:darkred;
            text-decoration:none;
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