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
       	#detail{
       		margin:auto;
        	width:900px;
        	height:500px;
        }
        #detail>div{
        	width:400px;
        	height:40px;
        	margin:auto;
            text-align: center;
        }
    #detail>div>label{
        width:200px;
        height:30px;
        color:rgb(3,73,120);
        font-size:18px;
        font-weight: bold;
        padding-bottom: 10px;
    }
    #detail>div>span{
        width:300px;
        margin-left:10px;
        color:darkgray;
    }
    #btn{
        margin:auto;
    }
    #btn>button{
        width:80px;
        height:40px;
        background-color:rgb(3,73,120);
        margin-left:10px;
        color:white;
        font-size:20x;
    }
    #dele{
        width:80px;
        height:40px;
        margin-left:30px;
    }
    #dele>form>button{
        background-color:rgb(3,73,120);
        width:80px;
        height:40px;
        font-size:20px;
        color:white;
    }
</style>
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
			<h1>상세 페이지</h1>
			<hr>
			<form action="" method="post">
			<div id="detail">
				<div>
					<label for="coursecode">과정코드 : </label>
					<span><%=bean.getCoursecode() %></span>
					<input type="hidden" name="coursecode" id="coursecode" value="<%=bean.getCoursecode() %>" readonly="readonly"/>
				</div>
				<div>
					<label for="title">과정명 : </label>
					<span><%=bean.getTitle() %></span>
					<input type="hidden" name="title" id="title" value="<%=bean.getTitle() %>"/>
				</div>
				<div>
					<label for="teacher">강사 : </label>
					<span><%=bean.getTeacher() %></span>
					<input type="hidden" name="teacher" id="teacher" value="<%=bean.getTeacher() %>"/>
				</div>
				<div>
					<label for="maxstu">최대수용인원 : </label>
					<span><%=bean.getMaxstu() %></span>
					<input type="hidden" name="maxstu" id="maxstu" value="<%=bean.getMaxstu() %>"/>
				</div>
				<div>
					<label for="hidden">교실 : </label>
					<span><%=bean.getClassroom() %></span>
					<input type="hidden" name="classroom" id="classroom" value="<%=bean.getClassroom()%>"/>
				</div>
				<div>
					<label for="period">기간 : </label>
					<span><%=bean.getPeriod() %></span>
					<input type="hidden" name="period" id="period" value="<%=bean.getPeriod() %>"/>
				</div>
				<div>
					<label for="status">상태 : </label>
					<span><%=bean.getStatus() %></span>
					<input type="hidden" name="status" id="status" value="<%=bean.getStatus() %>"/>
				</div>
				<hr>
				<div id="btn">
					<button type="button" id="edit">수정</button>
					<button type="submit">입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
					</form>
					<div id="dele">
						<form action="delete" method="post">
							<input type="hidden" name="coursecode" id="coursecode" value="<%=bean.getCoursecode() %>" readonly="readonly"/>	
                       		<button type="submit" name="delete">삭제</button>
                   		</form>	
                    </div>
		</div>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>