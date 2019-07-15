<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.bit.score.model.ScoreDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	#scoreContent{
		width: 1200px;
		margin: 0px auto;
	}
	#scoreContent table{
		width: 1200px;
		border-collapse: collapse;
        text-align: center;
        margin-bottom:50px;		
        font-size: 20px;
	}
	#scoreContent th, td {
            border-bottom: 1px solid white;
            padding: 10px;
    }
    #scoreContent tbody tr:nth-child(2n) {
        background-color: white;
    }
    #scoreContent tbody tr:nth-child(2n+1) {
        background-color: beige;
    }
    #scoreContent table th{
		 background-color: rgb(3,73,120);
         font-size:25px;
         color:white;
	}
	#scoreContent select{
		font-size:20px;
	}
	#scoreContent button{
		font-size:20px;
    	color:white;
        border:1px solid white;
        font-weight: bold;
        width:80px;
        height:40x;
        background-color:rgb(3,73,120);
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
<h1>성적</h1>
<hr>
<div id="scoreContent">
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
		<br/><br/>
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
	<br/><br/><br/>
	<%}%>
	</form>
</div>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>