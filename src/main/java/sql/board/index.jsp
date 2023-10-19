<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jsp5/resources/css/bootstrap.css">
<link rel="stylesheet" href="/jsp5/resources/css/custom.css">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
        .content{
            border: 1px solid red;
            height: 500px; /*컨텐츠 영역 사이즈*/
            width: 1400px;/*바꾸면 안 됨*/
            margin: auto;
        }

</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>
<br><br>

<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
%>


    <div class="content">
       <nav class="navbar navbar-default">
       	<div class="navbar-header">
       		<button type="button" class="navbar-toggle collapsed"
       			data-toggle="collapse" data-target = "#bs-example-navbar-collapse-1"
       			aria-expanded="false">
       			</button>
       			<a class="navbar-brand" href="index.jsp">실시간 회원제 채팅 서비스</a>
       		
       	</div>
       	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       		<ul class="nav navbar-nav">
       			<li class="active"><a href="index.jsp">메인</a></li>
       		</ul>
       	</div>
       </nav>
       
    </div>
    
<%@ include file="/views/common/footerBar.jsp" %>

</body>
</html>