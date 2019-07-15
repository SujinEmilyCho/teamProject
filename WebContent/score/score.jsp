<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.bit.score.model.ScoreDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
	th{
		width: 200px;
	}
	th:nth-child(1){
		width: 20px;
	}
</style>
<%
	String context=request.getContextPath();
%>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script type="text/javascript" >
	$(document).ready(function(){
<%if((Integer)session.getAttribute("accountType")==3){%>
		$('button').eq(1).hide().next().hide();		
		//입력 버튼 클릭
		$('button').eq(0).click(function(){
			$('button').show();
			$(this).hide();
			$('.span').hide();
			$('.score').attr("type", "text");			
		});		
		//취소 버튼
		$('button[type="reset"]').click(function(){
			$('button').hide();
			$('button[type="button"]').show();
			$('.span').show();
			$('.score').attr('type', 'hidden');			
		});
<%}%>
		$('#courseCode').change(function(){
			window.location.href="<%=context%>/score?courseCode="+$('#courseCode').val();
		});
	});	
</script> 
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/UI/headerUI.jsp"/>


	<%
	if((Integer)session.getAttribute("accountType")==1){
		ArrayList<String> codes=(ArrayList<String>)request.getAttribute("codes");
	%>
		<select name="courseCode" id="courseCode">
	<%
	for(int i=0; i<codes.size(); i++){
	%>
		<option <%if(codes.get(i).equals(request.getParameter("courseCode"))){out.print("selected");}%>><%=codes.get(i)%></option>
	
	<%}%>
		</select>
	<%}%>
	
	<form action="" method="post">
	<table>
		<tr>
			<th></th>
			<th>이름</th>
			<th>test1</th>
			<th>test2</th>
			<th>test3</th>
		</tr>
		
	<%
	ArrayList<ScoreDto> list = (ArrayList<ScoreDto>)request.getAttribute("score");
	for(int i=0; i<list.size(); i++){
	%>
		<tr>
			<td><input type="hidden" name="accountNum" class="accountNum" value="<%=list.get(i).getAccountNum() %>"/><%=i+1 %></td>
			<td><input type="hidden" name="name" class="name" value="<%=list.get(i).getName() %>"/><%=list.get(i).getName() %></td>
			<td><input type="hidden" name="score" class="score" value="<%=list.get(i).getTest1() %>"/><span class="span"><%=list.get(i).getTest1() %></span></td>
			<td><input type="hidden" name="score" class="score" value="<%=list.get(i).getTest2() %>"/><span class="span"><%=list.get(i).getTest2() %></span></td>
			<td><input type="hidden" name="score" class="score" value="<%=list.get(i).getTest3() %>"/><span class="span"><%=list.get(i).getTest3() %></span></td>
		</tr>
	<%
	}
	%>
	</table>
	<%if((Integer)session.getAttribute("accountType")==3){%>
	<button type="button">입력</button>
	<button type="submit">저장</button>
	<button type="reset">취소</button>
	<%}%>
	</form>

<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>