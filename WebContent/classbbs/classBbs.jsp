<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.bit.classbbs.model.ClassBbs_Dto, java.lang.Math"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
	table{
		width: 70%;
	}
	th:nth-child(1){
		width: 10px;
	}
	th:nth-child(3), th:nth-child(4){
		width: 80px;
	}

</style>
<%
	String context=request.getContextPath();
%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var courseCode = $('#courseCode').val();
		var row = $('#row').val();
		//행정팀 반 선택 select
		$('#courseCode').change(function(){
			window.location.href="<%=context%>/classbbs?courseCode="+$('#courseCode').val()+"&keyword=&row="+$('#row').val();
		});
		$('#row').change(function(){
			window.location.href="<%=context%>/classbbs?courseCode="+courseCode+"&keyword=&row="+$('#row').val();
		});
		$('button[type="button"]').click(function(){
			if(courseCode){
				window.location.href="<%=context%>/classbbs/add?courseCode="+courseCode;
			}else{
				window.location.href=window.location.href+"/add";
			}
		});
		
	});
</script>
<title>Insert title here</title>
</head>
<body>
<form action="">
<%
	if((Integer)session.getAttribute("accountType")==1){
%>
<div>
<select name="courseCode" id="courseCode">
<%		ArrayList<String> codes=(ArrayList<String>)request.getAttribute("codes");
		for(int i=0; i<codes.size(); i++){		
%>
	<option value="<%=codes.get(i) %>" <%if(codes.get(i).equals(request.getParameter("courseCode"))){out.print("selected");}%>><%=codes.get(i) %></option>
<%}%>
</select>
</div>
<%}%>
<div>
<table>
<thead>
	<tr>
		<th>No.</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<%
ArrayList<ClassBbs_Dto> list=(ArrayList<ClassBbs_Dto>)request.getAttribute("list");
for(int i=0; i<list.size(); i++){
%>
<tr>
	<td><%=i+1 %></td>
	<td><a href="<%=context %>/classbbs/detail?index=<%=list.get(i).getNum()%>"><%if(list.get(i).getReplyNum()>0){out.print("&nbsp;&nbsp;&nbsp;&nbsp;re)");}%><%=list.get(i).getSub() %></a></td>
	<td><%=list.get(i).getName() %></td>
	<td><%=list.get(i).getPostDate() %></td>
</tr>
<%} %>
</tbody>
</table>
</div>
<div>
<button type="button">글쓰기</button>
<%
int total= (Integer)request.getAttribute("total");
int row = (Integer)request.getAttribute("row");
int pages = (int)Math.ceil((total*1.0)/row);
//여기 페이지 처리하다가 자러감! for문 다음 코드 메모장에!
//for(int i=0; i<pages; i++){
%>

<input type="text" name="keyword" id="keyword" placeholder="제목/본문 검색">
<button type="submit">검색</button>
<select name="row" id="row">
	<option value="10" <%if(row==10){out.print("selected");} %>>10개씩 보기</option>
	<option value="15" <%if(row==15){out.print("selected");} %>>15개씩 보기</option>
	<option value="20" <%if(row==20){out.print("selected");} %>>20개씩 보기</option>
</select>
</div>
</form>
</body>
</html>