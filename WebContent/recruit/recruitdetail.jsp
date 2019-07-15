<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,com.bit.recruit.model.RecruitDto"%>
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
<jsp:include page="/UI/headerUI.jsp"/>
	<div id="content">
			<h2>상세 페이지</h2>
			<%
			RecruitDto bean=(RecruitDto)request.getAttribute("bean");
			%>
			<form action="update" method="post">
				<div>
					<label for="num">글 번호</label>
					<span><%=bean.getNum() %></span>
					<input type="text" name="num" id="num" value="<%=bean.getNum() %>"/>
				</div>
				
				<div>
					<label for="category">강좌분류</label>
					<span><%=bean.getCategory() %></span>
					<input type="text" name="category" id="category" value="<%=bean.getCategory() %>"/>
				</div>
				
				<div>
					<label for="writer">작성자</label>
					<span>영업팀</span>
					
				</div>
				
				<div>
					<label for="postdate">날짜</label>
					<span><%=bean.getPostdate() %></span>
					<input type="text" name="num" id="num" value="<%=bean.getPostdate() %>"/>
				</div>
				
				<div>
					<label for="sub">제목</label>
					<span><%=bean.getSub() %></span>
					<input type="text" name="sub" id="sub" value="<%=bean.getSub() %>"/>
				</div>
				
				<div>
					<label for="period">강좌기간</label>
					<span><%=bean.getPeriod() %></span>
					<input type="text" name="period" id="period" value="<%=bean.getPeriod() %>"/>
				</div>
				
				<div>
					<!--<button type="button">수정</button>  
					<button type="reset">취소</button> -->
					<button type="submit">수정</button>
					<button type="button">돌아가기</button>
					<button type="button">뒤로</button>
					
				</div>
			</form>
		</div>
		
	<!--<a href="#">[저 장]</a>
	<a href="#">[돌아가기]</a>  -->
	

<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>