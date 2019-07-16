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
    margin-bottom:30px;
    }
table {
             border-top: 1px solid white;
            border-collapse: collapse;
            width:900px;
            margin: auto;
            text-align: center;
        }
         th, td {
            border-bottom: 1px solid white;
            padding: 10px;
            font-size:25px;
        }
    td>a{
        text-decoration: none;
        color:black;
    }
        tbody tr:nth-child(2n) {
            background-color: ;
        }
        tbody tr:nth-child(2n+1) {
            background-color: beige;
        }
        #headtr {
            background-color: rgb(3,73,120);
            color:white;
        }

</style>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<h1>상담센터</h1><hr>
				<% String root= request.getContextPath(); %>
	<form action="">
	<table> 
			<thead id="headtr">
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
	<hr>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>