<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.bit.qna.model.QnADao" %>
<%@page import="com.bit.qna.model.QnADto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/jav ascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<h1>QnA</h1>
				<% String root= request.getContextPath(); %>
	<form action="">
	<table> 
			<thead>
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>연락처</th>
					<th>날짜</th>
					<th>상태</th>
					<th>분류</th>
					
				</tr>
			</thead>
			
			<tbody>
				<%
				ArrayList<QnADto> list=(ArrayList<QnADto>)request.getAttribute("list");
				if(list!=null){
					for(QnADto bean:list){
				%>
					<tr>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getNum() %></a></td>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getSub() %></a></td>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getName() %></a></td>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getPhone() %></a></td>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getPostdate() %></a></td>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getStatus() %></a></td>
						<td><a href="<%=root %>/qna/detail?idx=<%=bean.getNum()%>"><%=bean.getCategory() %></a></td>
					</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</form>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>