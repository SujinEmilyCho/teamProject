<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#addContent{
		width: 1600px;
		margin: 0px auto;
		text-align:center;
	}
	#addContent label{
		font-size:25px;
        font-weight: bold;
        color:rgb(3,73,120);
	}
	#sub{
		font-size: 25px;
		width: 850px;
	}
	#content{
		font-size: 25px;
		width: 1000px;
		height: 400px;
	}
	#notice{
		width: 25px;
	}
	#addContent button{
		font-size:20px;
    	color:white;
        border:1px solid white;
        font-weight: bold;
        width:80px;
        height:40x;
        background-color:rgb(3,73,120);
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
<jsp:include page="/UI/headerUI.jsp"/>
<div id="addContent">
<h1>글쓰기</h1>
<hr>
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
<br/><br/>
</form>
</div>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>