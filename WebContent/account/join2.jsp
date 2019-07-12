<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $('input[name="pw"]').keyup(function(){
	   $('font[name=check]').text('');
	  }); //#pw.keyup

	  $('input[name="repw"]').keyup(function(){
	   if($('#pw').val()!=$('#repw').val()){
	    $('font[name=check]').html("암호틀림");
	   }else{
	   	$('font[name=check]').html("암호맞음");
	   }
	  }); //#repw.keyup
	 });
	 
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
	 <div id="main">
	 <h1>회원가입</h1>
	 <br><br>
	 
	 <label for="name">성함</label><br>
	 <input type="text" name="name" id="name" ><br>
	 <label for="id">아이디</label><br>
	 <input type="text" name="id" id="id" ><br>
	 <label for="pw">비밀번호</label><br>
	 <input type="password" name="pw" id="pw"/><br>
	 
	 <label for="repw">비밀번호 확인</label><br>
	 <input type="password" name="repw" id="repw"/>
	 <font name="check" size="2" color="red"></font><br>
	 <label for="email">이메일</label><br>
	 <input type="text" name="email" id="email"><br>
	 <label for="bday">생년월일</label><br>
	 <input type="text" name="bday" id="bday"><br>
	 <label for="phone">전화번호</label><br>
	 <input type="text" name="phone" id="phone">	 
	 </div>
	
	 <button type="submit" id="join" name="join">가입하기</button>
	 <input value="돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath() %>'">
	 </form>
</body>
</html>