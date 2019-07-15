<%@page import="com.bit.course.model.CourseDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		$('button').hide().eq(0).show().click(function(){
			$('#content>h2').text("수정 페이지");
			$('button').show();
			$(this).hide();
			$('input[type=hidden]').each(function(idx,ele){
				if(idx>0){
					$(ele).attr('type','text');
					$('label+span').hide().first().show();
				}
			});
		}).next().next().next().click(function(){
			$('#content>h2').text("상세 페이지");
			$('button').hide().eq(0).show();
			$('input[type=text]').attr('type','hidden');
			$('label+span').show();
		});
	});
	
	
</script>

</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<%
	String root = request.getContextPath();
%>
		<div id="content">
			<%
			CourseDto bean=(CourseDto)request.getAttribute("bean");
			
			%>
			<h2>상세 페이지</h2>
			<form action="" method="post">
				<div>
					<label for="coursecode">coursecode</label>
					<span><%=bean.getCoursecode() %></span>
					<input type="hidden" name="coursecode" id="coursecode" value="<%=bean.getCoursecode() %>" readonly="readonly"/>
				</div>
				<div>
					<label for="title">title</label>
					<span><%=bean.getTitle() %></span>
					<input type="hidden" name="title" id="title" value="<%=bean.getTitle() %>"/>
				</div>
				<div>
					<label for="teacher">teacher</label>
					<span><%=bean.getTeacher() %></span>
					<input type="hidden" name="teacher" id="teacher" value="<%=bean.getTeacher() %>"/>
				</div>
				<div>
					<label for="maxstu">maxstu</label>
					<span><%=bean.getMaxstu() %></span>
					<input type="hidden" name="maxstu" id="maxstu" value="<%=bean.getMaxstu() %>"/>
				</div>
				<div>
					<label for="hidden">classroom</label>
					<span><%=bean.getClassroom() %></span>
					<input type="hidden" name="classroom" id="classroom" value="<%=bean.getClassroom()%>"/>
				</div>
				<div>
					<label for="period">period</label>
					<span><%=bean.getPeriod() %></span>
					<input type="hidden" name="period" id="period" value="<%=bean.getPeriod() %>"/>
				</div>
				<div>
					<label for="status">status</label>
					<span><%=bean.getStatus() %></span>
					<input type="hidden" name="status" id="status" value="<%=bean.getStatus() %>"/>
				</div>
				<div>
					<button type="button">수정</button>
					<button type="submit">입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
				</form>		
			<form action="delete" method="post">
				<div>
					<input type="hidden" name="coursecode" id="coursecode" value="<%=bean.getCoursecode() %>" readonly="readonly"/>	
					<button type="submit" name="delete">삭제</button>
				</div>
			</form>		
		</div>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>