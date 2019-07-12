<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
	div{
	width:100px;
	height:100px;
	}
	div>a{
	text-decoration:none;
	}
</style>
</script>
</head>
<body>
	<div>
	<%if(session.getAttribute("result")==null){ %>
            <li><a href="<%=request.getContextPath() %>/login">LOGIN</a></li>
            <%}else{ %>
            <li><a href="<%=request.getContextPath() %>/logout">LOGOUT</a></li>
            <p><%=session.getAttribute("name") %>님 어서오세요</p>
            <%} %>
	</div>
	
</body>
</html>