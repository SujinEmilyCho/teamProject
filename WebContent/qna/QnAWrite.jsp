<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
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
        }
    
    hr{
            border:1px solid lightgray;
            width:800px;
            margin-bottom:20px;
        }
    
    form{
        text-align: center;
    }
   .asdasd{
      text-align: center;
      width: 300px;
   
   }
   #sub{
      width: 160px;
   }
    #btn>input{
        width:90px;
        height:30px;
        border:1px solid white;
        font-size:18px;
        font-weight: bold;
        color:white;
        background-color:rgb(3,73,120);
    }
</style>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<h1>상담센터</h1>
  <hr>
   <form action="" method="post">
      <input type="text" name="name" id="name" placeholder="이름" class="asdasd"><br>
      
      <input type="text" name="phone" id="phone" placeholder="연락처" class="asdasd"><br>
      
      <label  for="category" style="font-size: 13px">카테고리 </label>
      <select name="category">
         <option value="강좌문의">강좌문의</option>
         <option value="기타문의">기타문의</option>
      </select>
      
      <input type="text" name="sub" id="sub" placeholder="문의 사항 제목  " ><br>
      
      <textarea rows="20" cols="20" name="content" id="content" placeholder="문의 사항 내용"class="asdasd"></textarea><br/>
      <hr>
      <div id="btn">
      <input type="submit" value="문의하기" >
      <input type="reset" value="다시쓰기" >
      </div>
   </form>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>