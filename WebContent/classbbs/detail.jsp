<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.bit.classbbs.model.ClassBbs_Dto,com.bit.classbbs.model.PostComment_Dto, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#cancel').hide();
		$('#update').hide();
		$('.edit').hide();
		
		//Ŀ��Ʈ �Է�
		$('#newComment').click(function(){
			var value = $('#comment').val();
			if(value){
				var result = confirm("�����Ͻðڽ��ϱ�?");
					if(result){
						$.ajax({
							url: "<%=context%>/classbbs/comment",
							method:"get",
							data:{classBbsNum: "<%=bean.getNum()%>", content: value},
							success: function(){
								//$('#comment').val(null);
								location.reload();
							},
							error: function(){
								alert("����");
							}
						});
					}
			}else{
				alert("����� �Է����ּ���.");
			}
		});
		
		//Ŀ��Ʈ ����
		$('.deleteComment').click(function(){
			var result=confirm("�����Ͻðڽ��ϱ�?");
			if(result){
				$.ajax({
					url: "<%=context%>/classbbs/comment",
					method: "post",
					data:{num:$(this).val()},
					success:function(){
						location.reload();
					},
					error: function(){
						alert("��������");
					}
				});
			}
		});
		
		//��� ��ư ���
		$('#reply').click(function(){
			var type=<%=session.getAttribute("accountType")%>;
			if(type!=1){
				window.location.href="<%=context%>/classbbs/add?postNum=<%=bean.getPostNum()%>&replyNum=<%=bean.getReplyNum()%>";
			}else{
				window.location.href="<%=context%>/classbbs/add?postNum=<%=bean.getPostNum()%>&replyNum=<%=bean.getReplyNum()%>&courseCode=<%=bean.getCourseCode()%>";
			}
		});
		//�ڷ� ���� ��ư ���
		$('#back').click(function(){
			window.history.back();
		});		
		//���� ��ư ���
		$('#delete').click(function(){
			var result = confirm("�����Ͻðڽ��ϱ�?");	
			if(result){
				$.ajax({
					url: "delete",
					method: "post",
					data: {index: '<%= request.getParameter("index") %>'},
					success: function(){
						window.location.href="<%=context%>/classbbs";
					},
					error: function(){
						alert("���� ����");
					}
				});
			}
		});	
		//���� ��ư ���
		$('#edit').click(function(){
			$('button').hide();
			$('#cancel').show();
			$('#update').show();
			$('.detail').hide();
			$('.edit').show();
		});
		//���� ��ư > Ȯ��
		$('#update').click(function(){
			
		});
		//���� ��ư > ���
		$('#cancel').click(function(){
			$('button').show();
			$('#cancle').hide();
			$('#update').hide();
			$('.detail').show();
			$('.edit').hide();
		});
	}); 
</script>
<title>Insert title here</title>
</head> 
<body>
<form action="" method="post">
<input type="hidden" name="num" id="num" value="<%=bean.getNum()%>">
<div class="detail">
<label>����</label><span><%= bean.getSub()%></span>
</div>
<div class="edit">
<label for="sub">����</label><input type="text" name="sub" id="sub" value="<%=bean.getSub()%>">
<input type="checkbox" name="notice" id="notice" <%if(bean.getNotice()==1){out.print("checked");}%>>
<label for="notice">������</label>
</div>
<div>
<label>�ۼ���</label><span><%= bean.getName()%></span>
<label>�ۼ���</label><span><%= bean.getPostDate()%></span><br/>
</div>
<div class="detail">
<span><%=bean.getContent()%></span>
</div>
<div class="edit">
<textarea rows="" cols="" name="content" id="content"><%=bean.getContent()%></textarea>
</div>
<div>
<input type="text" name="comment" id="comment">
<button type="button" id="newComment">����Է�</button>
</div>
<div>
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
		<td><button type="button" class="deleteComment" value="<%=list.get(i).getNum()%>">����</button></td>
		<%} %>
	</tr>
<% }%>
</tbody>
</table>
</div>
<%
if((Integer)session.getAttribute("accountNum")==bean.getAccountNum()){
%>
<button type="button" id="edit">����</button>
<button type="button" id="delete">����</button>
<button type="submit" id="update">Ȯ��</button>
<button type="button" id="cancel">���</button>
<%} %>
<button type="button" id="reply">���</button>
<button type="button" id="back">���ư���</button>
 </form>
</body>
</html>