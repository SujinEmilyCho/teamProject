<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        body{
            width:1920px;
            margin: 0px auto;
        }
        table{
            width:1920px;
            text-align: center;
        }
        table>tr{
            padding:0px;
        }
        #header{
            width:1920px;
            height:200px;
            display:inline-flex;
        }
        #logo{
            margin-left:50px;
            width:600px;
            height: 100px;
            text-align: center;
            margin-top:20px;
        }
        #menubar{
            height:165px;
            width:1100px;
            text-align: center;
            margin-left:100px;
        }
        #menu{
            line-height: 90px;
            display: inline-block;
            
            border-bottom:7px solid rgb(3,73,120);
        }
        #menu>li{
            width:170px;
            height: 80px;
            line-height: 90px;
            float:left;
            list-style: none;
            padding-bottom: 0px;
        }
        #menu>li>a{
            display: block;
            font-size:30px;
            color:lightslategray;
            font-weight: bold;
            text-decoration: none;
        }
        .A{/*학원소개하단메뉴바*/
            position:absolute;
            width:1000px;
            height:0px;
            padding-top:0px;
            overflow:hidden;
            transition:height .4s; 
        }
        .B{/*교육과정하단메뉴바*/
            position:absolute;
            width:1000px;
            height:0px;
            padding-top:0px;
            overflow:hidden;
            transition:height .4s; 
        }
        .C{/*학습관리하단메뉴바*/
            position:absolute;
            width:800px;
            height:0px;
            padding-top:0px;
            overflow:hidden;
            transition:height .4s;
        }
        .D{/*학습관리하단메뉴바*/
            position:absolute;
            width:800px;
            height:0px;
            padding-top:0px;
            overflow:hidden;
            transition:height .4s;
        }
        #menu>li:hover>ul{
            height:60px;
        }
        #menu>li>ul>li{
            width:170px;
            height:50px;
            line-height: 60px;
            float:left;
            display:inline-block;
            font-size:27px;
            list-style: none;
            text-align: center;
        }
        .A>li{/*학원소개하단메뉴*/
            margin-left:40px;
        }
        .B>li{/*교육과정하단메뉴*/
            margin-left:65px;
        }
        .C>li{/*학습관리하단메뉴*/
            margin-left:95px;
        }
        .D>li{/*관리자 하단메뉴*/
            margin-left:95px;
        }
        #menu>li>ul{
            margin:0px auto;
            position:absolute;
            width:945px;
            left:900px;
        }
        #menu>li>ul>li>a{
            text-decoration: none;
            color:black; 
        }
        #menu>li>a:hover{
            color:rgb(3,73,120);
            font-size:32px;
            font-weight: bolder;
        }
        #menu>li>ul>li>a:hover{
            color:darkred;
            font-weight: bold;
            font-size:29px;
        }
        #content{
            
        }
        #footer{
            width:1920px;
            height:165px;
            background-color:rgb(3,73,120);
            text-align: center;
        }
    </style>
</head>

<body>
    <table id="UI">
        <tr>
            <div id="header">
                <div id="logo"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/UI/imgs/logo.jpg" /></a></div>
                <div id="menubar">
                    <ul id="menu">
                        <li><a href="<%=request.getContextPath()%>/hello">학원소개</a>
                            <ul class="A">
                                <li><a href="<%=request.getContextPath()%>/hello">인삿말</a></li>
                                <li><a href="<%=request.getContextPath()%>/intro">센터시설</a></li>
                                <li><a href="<%=request.getContextPath()%>/teacher">강사진소개</a></li>
                                <li><a href="<%=request.getContextPath()%>/come">오시는길</a></li>
                            </ul>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/recruit">교육과정</a>
                            <ul class="B">
                           		<li><a href="<%=request.getContextPath()%>/recruit">모집과정</a>
                                <li><a href="<%=request.getContextPath()%>/java">JAVA과정</a></li>
                                <li><a href="<%=request.getContextPath()%>/db">DB과정</a></li>
                                <li><a href="<%=request.getContextPath()%>/web">WEB과정</a></li>
                            </ul>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/score">학습관리</a>
                            <ul class="C">
                                <li><a href="">출결조회</a></li>
                                <li><a href="<%=request.getContextPath()%>/score">성적조회</a></li>
                                <li><a href="<%=request.getContextPath()%>/classbbs">게시판</a></li>
                            </ul>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/qna">상담센터</a></li>
			            <%if(session.getAttribute("result")==null){ %>
			            <li><a href="<%=request.getContextPath() %>/join">회원가입</a></li>
			            <%}else if(((Integer)session.getAttribute("accountType"))==1){ %>
			            <li><a href="<%=request.getContextPath()%>/account">관리</a>
			            	<ul class="D">
			                   <li><a href="<%=request.getContextPath()%>/account">계정관리</a></li>
			                     <li><a href="<%=request.getContextPath()%>/course">과정관리</a></li>
			               </ul>
			            </li>
			            <%}else{%>
			            <li><a href="">마이페이지</a></li>
			            <% }%>
			            <%if(session.getAttribute("result")==null){ %>
			            <li><a href="<%=request.getContextPath() %>/login">로그인</a></li>
			            <%}else{ %>
			            <li><a href="<%=request.getContextPath() %>/logout">로그아웃</a></li>
			            <%} %>
                    </ul>
                </div>
            </div>
        </tr>
    </table>
    </body>
    </html>