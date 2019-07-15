<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .asdasd{
      text-align: center;
      width: 300px;
   
   }
   #sub{
      width: 160px;
   }
</style>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	
   <form action="" method="post">
      <input type="text" name="name" id="name" placeholder="이름" class="asdasd"><br>
      
      <input type="text" name="phone" id="phone" placeholder="연락처" class="asdasd"><br>
      
      <label  for="category" style="font-size: 13px">카테고리 </label>
      <select name="category">
         <option value="강좌문의">강좌문의</option>
         <option value="기타문의">기타문의</option>
      </select>
      
      <input type="text" name="sub" id="sub" placeholder="문의 사항 제목  " ><br>
      
      <textarea rows="20" cols="20" name="content" id="content" placeholder="문의 사항 내용"class="asdasd"></textarea><br>
      <input type="submit" value="문의하기" >
      <input type="reset" value="다시쓰기" >
      
   </form>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>