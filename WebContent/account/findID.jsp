<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
        #findlist{
            width:500px;
            height: 350px;
            margin:auto;
            font-size:20px;
            font-weight: bold;
        }
        #findlist>form{
            margin: auto;
            width:300px;
        }
        #findlist>form>label{
            font-size:25px;
            font-weight: bold;
            color:rgb(3,73,120);
        }
        input{
            margin-bottom: 8px;
            width:250px;
        }
        #btn{
            display:inline-flex;
            width:500px;
            height: 50px;
            margin-left: 720px;
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
        #cancel{
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
</script>
</head>
<body>
<%String errmsg = (String)request.getAttribute("errmsg");
if(errmsg!=null){out.print(errmsg);}%>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>아이디찾기</h1>
	<ul id="findlist">
	<form action="" method="post">
	<label for="name">성함</label><br>
	 <input type="text" name="name" id="name" ><br>
	 <label for="email">이메일</label><br>
	 <input type="text" name="email" id="email"><br>
	 <label for="bday">생년월일</label><br>
	 <input type="text" name="bday" id="bday"><br>
	 <label for="phone">전화번호</label><br>
	 <input type="text" name="phone" id="phone"><br>
	 </form>
	 </ul><hr>
	 <div id="btn">
	 <button type="submit">찾기</button>
	 <input type="button" onclick="location='login'" id="cancel" value="취소">
	 </div>
   <jsp:include page="/UI/footerUI.jsp"/>	
</body>
</html>