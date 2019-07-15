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
            border-bottom:1px solid lightgray;
            
        }
        hr{
            border:1px solid lightgray;
            width:800px;
        }
        #joinlist{
            width:500px;
            height: 500px;
            margin:auto;
            font-size:20px;
            font-weight: bold;
            margin-right:550px;
        }
        #joinlist>label{
            font-size:25px;
            font-weight: bold;
            color:rgb(3,73,120);
        }
        input{
            margin-bottom: 8px;
        }
        #font{
            font-size:25px;
            font-weight: bold;
        }
        #btn{
            display:inline-flex;
            width:500px;
            height: 100px;
            margin-left: 780px;
            margin-bottom: 10px;
        }
        button{
            color:white;
            border:1px solid white;
            font-weight: bold;
            width:200px;
            height:50px;
            background-color:rgb(3,73,120);
            font-size:25px;
        }
        #backindex{
            border:1px solid white;
            height:50px;
            width:200px;
            background-color:rgb(3,73,120);
            list-style: none;
            text-align: center;
            line-height: 50px;
            font-size:25px;
            color:white;
            font-weight: bold;
        }
</style>
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
<jsp:include page="/UI/headerUI.jsp"/>
	<form action="" method="post">
	 <div id="main">
	 <h1>회원가입</h1>
	 <br><br>
	 <ul id="joinlist">
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
	 </ul><hr><br>
	 </div>
	<div id="btn">
	 <button type="submit" id="join" name="join">가입하기</button>
	 <input value="돌아가기" type="button" name="backindex" id="backindex" onclick="location='<%=request.getContextPath() %>'">
	 </div>
	 </form>
<jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>