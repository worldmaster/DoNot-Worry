<%@ page import = "com.kh.common.model.vo.pageBar, java.util.ArrayList, com.kh.AdminContact.model.vo.AdminContact" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	pageBar pb = (pageBar)request.getAttribute("pb");
	ArrayList<AdminContact> list = (ArrayList<AdminContact>) request.getAttribute("list");
	
	int currentPage = pb.getCurrentPage();
	int startPage = pb.getStartPage();
	int endPage = pb.getEndPage();
	int maxPage = pb.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .table th{
        	text-align: center;
        }
        
        .table tr{height: 40px;}
        
        .table-bordered>tbody>tr{
        	cursor: pointer;
        }

</style>
</head>
<body>
	
	<%@ include file="/views/common/menubar2.jsp" %>


	<div class="content">
	<br><br><br>
	<table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="5" style="text-align: center"><h4>건의사항</h4></th>
	</tr>
	<tr>
		<th style="background-color : #fafafa; color:#000000; width:100px;"><h5>글번호</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:400px"><h5>제목</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:100px"><h5>작성자</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:100px;"><h5>작성일</h5></th>
	</tr>
	</thead>
	<tbody>
		<%if(list.isEmpty()){ %>
			<tr>
				<td colspan="4">조회된 건의사항이 없습니다</td>
			</tr>
		<%}else{ %>
			<%for(AdminContact ac : list) {%>
				<tr>
					<td><%=ac.getContNo() %></td>
					<td><%=ac.getContTitle() %></td>
					<td><%=ac.getContWriter() %></td>
					<td><%=ac.getContDate()%></td>
				</tr>
			<%} %>				
		<%} %>
		
		<tr>
			<!-- <td colspan="5"><a href="boordWrite.jsp" class="btn btn-primary pull-right" type="submit">글 작성</a> -->
		</tr>	
	</tbody>
	</table>
	
	<br>
	
	
	<!-- 페이징 바 -->
	<div align="center" id="pagingBar" >
		<%if(currentPage != 1) {%>
			<button onclick="location.href='<%=contextPath%>/adlist.co?currentPage=<%=currentPage - 1%>'">&lt;</button>
		<%} %>
		
		<%for(int p = startPage; p <= endPage; p++){ %>
		
			<%if(p != currentPage) {%>
			<button onclick="location.href='<%=contextPath%>/adlist.co?currentPage=<%=p%>'"><%=p %></button>
			<%} else{ %>
			<!--  현재 내가 보고있는 페이지일 경우 클릭이 안 되게끔 -->
				<button disabled><%=p %></button>
				<%} %>
		<%} %>
		<% if(currentPage != maxPage){ %>
            <button onclick="location.href='<%= contextPath %>/adlist.co?currentPage=<%= currentPage + 1 %>'">&gt;</button>
         <% } %>
		</div>
		
	</div>
	<%@ include file="/views/common/footerBar.jsp" %>	
	
	<script>
		$(function() {
			$(".table-bordered>tbody>tr").click(function(){
				const cno = $(this).children().eq(0).text();
				
				location.href = "<%=request.getContextPath()%>/addetail.co?cno="+cno;
			});
			
		});
	</script>
</body>
</html>