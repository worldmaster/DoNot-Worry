<%@ page import ="java.util.ArrayList, com.kh.AdminNotice.model.vo.AdminNotice"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
ArrayList<AdminNotice> list = (ArrayList<AdminNotice>)request.getAttribute("list");  	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
        .table th{
        	text-align: center;
        }
        
        .table tr{height: 40px;}
        
        #noticeSearch>button{
        	background-color: #fafafa;
        	border-radius: 4px;
        	border: 1px solid #dddddd;
        	color: black;
        	height: 30px;
        	width: 50px; 
        }
        
        #searchTitle{
        	width: 300px;
        	height: 40px;
        	border-radius: 5px;
        	border: 1px solid #dddddd;
        }
        
        .table-bordered>tbody>tr{
        	cursor: pointer;
        }

</style>
</head>
<body>
	<%@include file="/views/common/menubar2.jsp" %>
	
	<div class="content">
	<br><br><br>
	<table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="5" style="text-align: center"><h4>공지사항</h4></th>
	</tr>
	<tr>
		<th style="background-color : #fafafa; color:#000000; width:100px;"><h5>글번호</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:400px"><h5>제목</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:100px"><h5>작성자</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:100px;"><h5>작성일</h5></th>
		<!-- <th style="background-color : #fafafa; color:#000000; width:70px;"><h5>조회수</h5></th> -->
	</tr>
	</thead>
	<tbody>
		<% if(list.isEmpty()){ %>
			<tr>
				<td colspan="4">존재하는 공지사항이 없습니다</td>
			</tr>
		<%} else{%>
			<%for(AdminNotice an : list){ %>
				<tr>
					<td><%=an.getNoticeNo() %></td>
					<td><%=an.getNoticeTitle() %></td>
					<td><%=an.getNoticeWriter() %></td>
					<td><%=an.getNoticeDate() %></td>
				</tr>
			<%} %>
		<%} %>
		<tr></tr>
	</tbody>
	</table>
<%--  	<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>  --%>
	<a href="<%=request.getContextPath() %>/adinsert.no" class="btn btn-primary pull-right" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">글작성</a>
	
<%--  	<%} %>  --%>
	<form id="noticeSearch">
		<input type="search" name="searchTitle" id="searchTitle" placeholder="제목을 입력하세요">
		<button type="button" id="noticeSearch">조회</button>
		
	</form>
	</div>
	
	<%@ include file="/views/common/footerBar.jsp" %>
	
	<script>
		$(function(){
			$(".table-bordered>tbody>tr").click(function(){
			const ano = $(this).children().eq(0).text();
				
				location.href = "<%=request.getContextPath()%>/addetail.no?ano="+ano;
			
			})
		});
		
		$(function(){
			$("#noticeSearch>button").click(function(){
				const searchTitle = $("#searchTitle").val();
				
				location.href = "<%=contextPath%>/search.no?searchTitle="+searchTitle;
			})
		});
	</script>

</body>
</html>