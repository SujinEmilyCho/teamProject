<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.classbbs.model.ClassBbs_Dto,com.bit.classbbs.model.PostComment_Dto, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String context=request.getContextPath();
	ClassBbs_Dto bean = (ClassBbs_Dto)request.getAttribute("bean");
	ArrayList<PostComment_Dto> list = (ArrayList<PostComment_Dto>)request.getAttribute("commentList");
	String errmsg=(String)request.getAttribute("errmsg");
	if(errmsg!=null){
		out.print(errmsg);
	}
%>
<style type="text/css">
	#detailContent{
		width: 1100px;
		margin: 0px auto;
		font-size: 25px;
	}
	#detailContent label{
		display: inline-block;
		width: 100px;
		font-size:25px;
        font-weight: bold;
        color:rgb(3,73,120);
	}
	#sub{
		font-size: 25px;
		width: 850px;
	}
	
	#detailContent table{
		font-size: 20px;
		width: 1000px;
		margin: 0px auto;
	}
	#detailContent table td:nth-child(1), #detailContent table td:nth-child(2), #detailContent table td:nth-child(4){
		width: 100px;
	}
	#detailContent table td:nth-child(3){
		text-align: left;
	}
	#detailContent button{
		font-size:20px;
    	color:white;
        border:1px solid white;
        font-weight: bold;
        width:100px;
        height:40x;
        background-color:rgb(3,73,120);
	}
	#buttons{
		margin: 0px auto;
		text-align: center;
	}
	#buttons button{
		margin-left: 100px;
	}
	textarea{
		width: 1000px;
		height: 400px;
		font-size: 25px;
		margin: 0px auto;
	}
	.detail>span:nth-child(1){
		display: inline-block;
		width: 1000px;
		height: 400px;
	}
	#commentDiv {
		text-align: center;
	}
	#comment{
		width: 890px;
		height: 25px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#cancel').hide();
		$('#update').hide();
		$('.edit').hide();
		
		//커맨트 입력
		$('#newComment').click(function(){
			var value = $('#comment').val();
			if(value){
				var result = confirm("저장하시겠습니까?");
					if(result){
						$.ajax({
							url: "<%=context%>/classbbs/comment",
							method:"get",
							data:{classBbsNum: "<%=bean.getNum()%>", content:  value},
							success: function(){
								//$('#comment').val(null);
								location.reload();
							},
							error: function(){
								alert("실패");
							}
						});
					}
			}else{
				alert("댓글을 입력해주세요.");
			}
		});
		
		//커맨트 삭제
		$('.deleteComment').click(function(){
			var result=confirm("삭제하시겠습니까?");
			if(result){
				$.ajax({
					url: "<%=context%>/classbbs/comment",
					method: "post",
					data:{num:$(this).val()},
					success:function(){
						location.reload();
					},
					error: function(){
						alert("삭제실패");
					}
				});
			}
		});
		
		//답글 버튼 기능
		$('#reply').click(function(){
			var type=<%=session.getAttribute("accountType")%>;
			if(type!=1){
				window.location.href="<%=context%>/classbbs/add?postNum=<%=bean.getPostNum()%>&replyNum=<%=bean.getReplyNum()%>";
			}else{
				window.location.href="<%=context%>/classbbs/add?postNum=<%=bean.getPostNum()%>&replyNum=<%=bean.getReplyNum()%>&courseCode=<%=bean.getCourseCode()%>";
			}
		});
		//뒤로 가기 버튼 기능
		$('#back').click(function(){
			window.history.back();
		});		
		//삭제 버튼 기능
		$('#delete').click(function(){
			var result = confirm("삭제하시겠습니까?");	
			if(result){
				$.ajax({
					url: "delete",
					method: "post",
					data: {index: '<%= request.getParameter("index") %>'},
					success: function(){
						window.location.href="<%=context%>/classbbs";
					},
					error: function(){
						alert("삭제 실패");
					}
				});
			}
		});	
		//수정 버튼 기능
		$('#edit').click(function(){
			$('button').hide();
			$('#cancel').show();
			$('#update').show();
			$('.detail').hide();
			$('.edit').show();
		});
		//수정 버튼 > 확인
		$('#update').click(function(){
			
		});
		//수정 버튼 > 취소
		$('#cancel').click(function(){
			$('button').show();
			$('#cancel').hide();
			$('#update').hide();
			$('.detail').show();
			$('.edit').hide();
		});
	}); 
</script>
<title>Insert title here</title>
</head> 
<jsp:include page="/UI/headerUI.jsp"/>
<body>
<div id="detailContent">
	<form action="" method="post">
	<input type="hidden" name="num" id="num" value="<%=bean.getNum()%>">
	<div class="detail">
		<label>제목</label>
		<span><%= bean.getSub()%></span>
	</div>
	<div class="edit">
		<label for="sub">제목</label>
		<input type="text" name="sub" id="sub" value="<%=bean.getSub()%>">
		<%if((Integer)session.getAttribute("accountType")==1||(Integer)session.getAttribute("accountType")==3){ %>
		<input type="checkbox" name="notice" id="notice" <%if(bean.getNotice()==1){out.print("checked");}%>>
		<label for="notice">공지글</label>
		<%} %>
	</div>
	<div>
		<label>작성자</label>
		<span><%= bean.getName()%></span><br/>
		<label>작성일</label>
		<span><%= bean.getPostDate()%></span><br/><br/>
	</div>
	<div class="detail">
		<span><%=bean.getContent()%></span>
	</div>
	<div class="edit">
		<textarea rows="" cols="" name="content" id="content"><%=bean.getContent()%></textarea>
	</div>
	<br/><br/>
	<div class="detail" id=commentDiv>
		<input type="text" name="comment" id="comment">
		<button type="button" id="newComment">댓글입력</button>
		<br/><br/>
	</div>
	<div class="detail">
		<table>
			<thead>
			</thead>
			<tbody>
			<%
			for(int i=0; i<list.size(); i++){
			%>
				<tr>
					<td><%=list.get(i).getPostDate()%></td>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getContent()%></td>
					<%if(list.get(i).getAccountNum()==(Integer)session.getAttribute("accountNum")){%>
					<td><button type="button" class="deleteComment" value="<%=list.get(i).getNum()%>">삭제</button></td>
					<%}else{%>
					<td>&nbsp;</td>	
					<%} %>
				</tr>
			<% }%>
			</tbody>
		</table>
	</div>
	<br/>
	<div id="buttons">
		<%
		if((Integer)session.getAttribute("accountNum")==bean.getAccountNum()){
		%>
		<button type="button" id="edit">수정</button>
		<button type="button" id="delete">삭제</button>
		<button type="submit" id="update">확인</button>
		<button type="button" id="cancel">취소</button>
		<%} %>
		<button type="button" id="reply">답글</button>
		<button type="button" id="back">돌아가기</button>
		 </form>
	</div>
	<br/><br/>
 </div>
<jsp:include page="/UI/footerUI.jsp"/>
</body>
</html>