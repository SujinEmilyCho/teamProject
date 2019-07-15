<%@page import="com.bit.accountmng.model.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/frame.css"/>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	table>thead>tr>th{
		border:1px solid;
        background-color: rgb(3,73,120);
            font-size:25px;
            color:white;
	}
	table>tbody>tr>td{
		border:1px solid;
	}
    tbody tr:nth-child(2n+1) {
            background-color: beige;
        }
	
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
	<%
		request.setCharacterEncoding("utf-8");
		AccountDao dao = new AccountDao();
		ArrayList<AccountDto> arr =dao.getAccount();
		
	%>
<script type="text/javascript">

$(document).ready(function() {
   
});





</script>

<script>
				function Ajax(){
					$.ajax({
						type : "get",
						url : "accountsearch.jsp",
						data :{"search":$("#search").val(),"kind":$("#kind").val()},
						success : function(data){
							data = $.parseJSON(data);	//이게 머임?
							var memberInfo = "";
							var admin = "";
								for (var i=0; i<data.length; i++){
									if(data[i].admin==1){
										admin = "행정팀";
									}else if(data[i].admin==2){
										admin = "영업팀";
									}else if(data[i].admin==3){
										admin = "강사팀";
									}else{
										admin="학생";
									}
									
									memberInfo += "<tr>";
									memberInfo += "<td>"+data[i].accountNum +"</td>";
									memberInfo += "<td>"+data[i].id +"</td>";
									memberInfo += "<td>"+data[i].name +"</td>";
									memberInfo += "<td>"+data[i].bday +"</td>";
									memberInfo += "<td>"+data[i].phone +"</td>";
									memberInfo += "<td>"+data[i].email +"</td>";
									memberInfo += "<td>"+data[i].accountType +"</td>";
									memberInfo += "<td>"+data[i].courseCode +"</td>";
									memberInfo += "</tr>";
									
								}
								$("tbody#result").html(memberInfo);
								
						},
						error : function(e){
							alert("error : "+e)
						},
						beforeSend : check
							
						
					})
				}
				function check(){
					if($("#kind").val()==""){
						alert("검색할 항목을 선택하세요");
						return false;
					}
					return true;
				}
			</script>
</head>
<body>
<jsp:include page="/UI/headerUI.jsp"/>
	<!-- <div id=sh>
		<select id =kind name=kind>
			<option value=""></option>
			<option value="at">회원타입</option>
			<option value="courseCode">강의과정</option>
			<option value="name">이름</option>
		</select>	
			<input type="text" id=serch name=search>
			<input type="button" value="검색" onclick="Ajax()">
	</div> -->
	
	<form action="<%=request.getContextPath() %>/account" method="get"> <!--버튼 눌렀을 때 액션 동작, 이동하면서 텍스트필드의 값을 함께 가져간다. -->
	
		<table>
			<thead>
				<tr>
					<th>계정 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>계정타입</th>
					<th>과정코드</th>
					
				</tr>
			</thead>
			
			<tbody id="result">
				<%
					ArrayList<AccountDto> list=(ArrayList<AccountDto>)request.getAttribute("list");
					if(list!=null){
						for(AccountDto bean:list){
					
				%>
					<tr>
						<td><%=bean.getAccountNum() %></td>
						<td><%=bean.getId() %></td>
						<td><%=bean.getName() %></td>
						<td><%=bean.getBday() %></td>
						<td><%=bean.getPhone() %></td>
						<td><%=bean.getEmail() %><input type="hidden" name="email" value="<%=bean.getEmail()%>"/></td>
						<input type="hidden" name="accSeq" value="<%=bean.getAccountNum()%>"/>
						
						<td><select name="at" class="at_class">
								<%if(bean.getAccountType()==1){
									
									%>
									<option value="0">0</option>
									<option value="1" selected="selected"><%=bean.getAccountType() %></option>
									
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								
								<%}else if(bean.getAccountType()==2){%>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2" selected="selected"><%=bean.getAccountType() %></option>
									
									<option value="3">3</option>
									<option value="4">4</option>
									
								
								
								<%}else if(bean.getAccountType()==3){%>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									
									<option value="3" selected="selected"><%=bean.getAccountType() %></option>
									<option value="4">4</option>
									
								<%}else if(bean.getAccountType()==4){%>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4" selected="selected"><%=bean.getAccountType() %></option>
								
								<%
									
								}else{
								
									%>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								<%} %>
							</select>
						</td> 
						
						
						<td><select name="courseCode">
							<%//System.out.println(bean.getCourseCode());
							if("1905WEB".equals(bean.getCourseCode())){ %>
								<option value="1905WEB" selected="selected"><%=bean.getCourseCode() %></option> 
								<option value="1906JAVA">1906JAVA</option>
								<option value="1907DB">1907DB</option>
								
							<%}else if("1906JAVA".equals(bean.getCourseCode())){%>
								<option value="1905WEB">1905WEB</option> 
								<option value="1906JAVA" selected="selected"><%=bean.getCourseCode() %></option>
								<option value="1907DB">1907DB</option>
								
							<%}else if("1907DB".equals(bean.getCourseCode())){ %>
								<option value="1905WEB">1905WEB</option> 
								<option value="1906JAVA">1906JAVA</option>
								<option value="1907DB" selected="selected"><%=bean.getCourseCode() %></option>
							<%}else{ %>
								<option value="nul">nul</option>
								<option value="1905WEB">1905WEB</option> 
								<option value="1906JAVA">1906JAVA</option>
								<option value="1907DB">1907DB</option>
							<%} %>
						</select>
						</td>
					</tr>
					
				<%
						}
					}
				%>
			</tbody>
		</table>
		<% 
			String subSelect =request.getParameter("select");
		
		%>
		<!-- <a href="account.bit">[저 장]</a> -->
		
			<select name="showhowmany">
				<option value="10">10개씩 보기</option>
				<option value="25">25개씩 보기</option>
				<option value="50">50개씩 보기</option>
			</select>
			<input type="submit" value="보기">
			
			
			<button type="button" onclick="chg()">저 장</button> 
		</form> <!-- 저장 액션 폼 -->
		
			<script>	//update 
				function chg(){
					//큰 배열
					var atArr=document.getElementsByName("at");
					var accSeqArr=document.getElementsByName("accSeq");
					var courseCodeArr=document.getElementsByName("courseCode");
					
					var str='';
					for(var i=0;i<atArr.length;i++){
						//작은배열
						if(i==atArr.length-1){
							str+=accSeqArr[i].value+','+atArr[i].value+','+courseCodeArr[i].value;
						}else{
							str+=accSeqArr[i].value+','+atArr[i].value+','+courseCodeArr[i].value+']';
						}
						
					}		
					console.log(str);
					location.href="<%=request.getContextPath() %>/account/accountedit?param="+encodeURI(str);
					//location.href=("account.bit");
					//rep();
				}
			
				//function rep(){
				//	location.replace("account.bit");
				//}
			</script>
			
<jsp:include page="/UI/footerUI.jsp"/>			
</body>
</html>