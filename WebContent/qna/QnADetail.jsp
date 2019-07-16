<%@page import="jdk.internal.org.objectweb.asm.tree.analysis.Value"%>
<%@page import="com.bit.qna.model.QnADto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
        h2 {
            text-align: center;
            color: rgb(3, 73, 120);
            font-weight: bolder;
            margin: auto;
            font-size: 35px;
            padding-bottom: 30px;
        }

        hr {
            border: 1px solid lightgray;
            width: 800px;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            height: 300px;
            width: 800px;
            text-align: center;
            margin: auto;
            margin-bottom: 20px;
            border:1px solid lightgray;
        }
        tr,td:nth-child(2n-1){
            background-color:rgb(3,73,120);
            border-bottom:1px solid white;
        }
        tr,td:nth-child(2n-1)>label{
            font-size:20px;
            font-weight: bold;
            color:white;
        }
        tr,td:nth-child(2n){
            background-color:white;
        }
        tr,td:nth-child(2n)>span{
            font-size:20px;
            color:black;
        }
        #content>td{
            color:black;
            background-color:white;
            border-bottom: 1px solid lightgray;
        }
        #btn{
            text-align: center;
        }
        #btn>button{
            width:90px;
            height:30px;
            border:1px solid white;
            background-color:rgb(3,73,120);
            color:white;
            font-size:18px;
            font-weight: bold;
        }
    </style>
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
	}).next().next().click(function(){
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
	QnADto bean=(QnADto)request.getAttribute("bean");
			
%>

	<form action="" method="post">
				<h2><%=bean.getNum() %>번 게시글</h2>
				<hr>
				<input type="hidden" id="num" name="num" value="<%=bean.getNum() %>" readonly="readonly"/>
			
			<table>
             
            <tr>
               <td><label for="name">작성자</label></td>
               <td><span><%=bean.getName() %></span></td>
               <td><label for="category">분류</label></td>
               <td><span><%=bean.getCategory() %></span></td>
            </tr>
            <tr>
               <td><label for="phone">연락처</label></td>
               <td><span><%=bean.getPhone() %></span></td>
               <td><label for="postdate">날짜</label></td>
               <td><span><%=bean.getPostdate()%></span></td>
            </tr>
            <tr>
               <td><label for="phone">제목</label></td>
               <td><span><%=bean.getSub() %></span></td>
               <td><label for="status">상태</label></td>
               <td><span><%=bean.getStatus() %></span><input type="hidden" name="status" id="status" value="<%=bean.getStatus() %>" style="width: 200px;"/></td>
            </tr>
            <tr id="content">
               <td colspan="4"><span><%=bean.getContent() %></span></td>
            </tr>
         </table>
          <hr>
        <div id="btn">
               <button type="button" name="Modified">수정</button>
               <button type="submit">입력</button>
               <button type="reset">취소</button>
            </div>

	</form>
<jsp:include page="/UI/footerUI.jsp"/>		
</body>
</html>