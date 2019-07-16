<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,com.bit.recruit.model.RecruitDto"%>
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
    div>#btn{
        width: 1920px;
        height: 40px;
        display:inline-flex;
        margin-left:760px;
        margin-top:10px;
        text-align: center;
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
    #btn>form>button{
        width:120px;
        height:40px;
        background-color:rgb(3,73,120);
        color:white;
        border:1px solid white;
        font-size:20px;
        font-weight: bold;
    }
</style>
<%
			RecruitDto bean=(RecruitDto)request.getAttribute("bean");
%>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//삭제 버튼 기능
	$('#delete').click(function(){
		var result = confirm("삭제하시겠습니까?");	
		if(result){
			$.ajax({
				url: "delete",
				method: "post",
				data: {index: '<%=bean.getNum()%>'},
				success: function(){
					window.location.href="/recruit";
				},
				error: function(){
					alert("삭제 실패");
				}
			});
		}
	});	
});
</script>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<%
	SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
	
	Date time = new Date();

	String nowDay = format.format(time);

%>
	<form action="<%=request.getContextPath() %>/recruit/recruitdetail" method="post"><!-- RecruitAddController dopost 페이지로감 -->
	<div>
	<table>

		<thead>
			
			<tr>
			<div>
				<th>글번호</th>
				<td><span><%=bean.getNum() %></span></td>
			</div>
			
			<div>
				<th><label for="category">강좌분류</label></th>
				<td><input type="text" name="category" id="category" value="<%=bean.getCategory() %>"/></td>
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
				<td><input type="text" name="sub" id="sub" value="<%=bean.getSub()%>"/></td>
				
				<th><label for="period">강좌기간</label></th>
				<td><input type="text" name="period" id="period" value="<%=bean.getPeriod() %>"/></td>
			</tr>
		
		</thead>
		
		<tbody>
				<tr>
					<td colspan="4">
						<textarea name="content" cols="100" rows="30" value="<%=bean.getContent()%>">
						</textarea>
					</td>
				</tr>
		</tbody>
	</table>
		<div id="btn">
	        <button type="submit">저장</button>
	        <button type="button" id="delete">삭제</button>
	    </form>
	        <form action="recruit" method="get">
		    	<button type="submit">돌아가기</button>    
		    </form>
		    
		    
		    	
		    
		</div>
    </div>

<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>