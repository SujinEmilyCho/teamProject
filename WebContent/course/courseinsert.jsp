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
             margin-bottom: 30px;
        }
		#coursebox{
			width:1600px;
   			margin:auto;
            border-collapse: collapse;
            text-align: center;
            margin-bottom:30px;
		}
		#coursebox>div{
			margin:auto;
			width:800px;
            margin-bottom: 20px;
		}
		#coursebox>div>label{
			font-size:20px;
            font-weight: bold;
            color:rgb(3,73,120);
            width:120px;
            height:40px;
		}
		#coursebox>div>#coursecode{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:60px;
		}
		#coursebox>div>#title{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:76px;
		}
		#coursebox>div>#teacher{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:76px;
		}
		#coursebox>div>#maxstu{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:15px;
		}
		#coursebox>div>#classroom{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:95px;
		}
		#coursebox>div>#period{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:95px;
		}
		#coursebox>div>#status{
			font-size:20px;
			font-weight:bold;
			width:200px;
			margin-left:95px;
		}
    #coursebox>#btn{
        width:400px;
        height:30px;
    }
    button{
            color:white;
            border:1px solid rgb(3,73,120);
            font-weight: bold;
            width:100px;
            height:35px;
            background-color:rgb(3,73,120);
            font-size:20px;
        line-height:30px;
    }
</style>
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
<%
	String root = request.getContextPath();
%>
<form action="" method="post">
<h2>입력 페이지</h2>
			
				<div>
					<label for="coursecode">강좌코드</label>
					<input type="text" name="coursecode" id="coursecode" />
				</div>
				<div>
					<label for="title">강좌명</label>
					<input type="text" name="title" id="title" />
				</div>
				<div>
					<label for="teacher">강사명</label>
					<input type="text" name="teacher" id="teacher" />
				</div>
				<div>
					<label for="maxstu">최대수강인원</label>
					<input type="text" name="maxstu" id="maxstu" />
				</div>
				<div>
					<label for="classroom">교실</label>
					<input type="text" name="classroom" id="classroom" />
				</div>
				<div>
					<label for="period">기간</label>
					<input type="text" name="period" id="period" />
				</div>
				<div>
					<label for="status">상태</label>
					<input type="text" name="status" id="status" />
				</div>
				<div>
					<button type="submit">입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
			</form>		
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>