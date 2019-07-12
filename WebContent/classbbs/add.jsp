<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
	#sub{
		width: 680px;
	}
	label{
		width: 100px;
	}
	#content{
		width: 800px;
		height: 400px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('button').last().click(function(){
			window.history.back();
		});
	});
</script>
<title>Insert title here</title>
</head>
<%
	String errmsg=(String)request.getAttribute("errmsg");
	if(errmsg!=null){
		out.print(errmsg);
	}
%>
<body>
<form action="" method="post">
<input type="hidden" name="courseCode" value="<%=request.getParameter("courseCode")%>">
<input type="hidden" name="postNum" value="<%=request.getParameter("postNum")%>">
<input type="hidden" name="replyNum" value="<%=request.getParameter("replyNum")%>">
<div>
<label for="sub">제목</label>
<input type="text" name="sub" id="sub">
<input type="checkbox" name="notice" id="notice">
<label for="notice">공지글</label>
</div>
<br/>
<div>
<textarea name="content" id="content"></textarea>
</div>
<button type="submit">확인</button>
<button type="button">취소</button>
</form>
</body>
</html>