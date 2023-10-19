<%@ page import="com.kh.AdminContact.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminContact ac = (AdminContact)request.getAttribute("ac");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/menubar2.jsp" %>
	<div class="content">
	<br><br><br>
   	<form action="<%=request.getContextPath()%>/addelete.co" method="post">  
	<input type="hidden" name=cno value="<%=ac.getContNo()%>">
	
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd; margin: 0 auto;">
	
	<thead>
	<tr>
		<th colspan="5" style="text-align: center;"><h4>건의사항</h4></th>
	</tr>
	</thead>
	 <tbody>
		<tr>
		<tr>
			<th width="70">제목</th>
			<td width="900"><%=ac.getContTitle() %></td>
		</tr>
		<tr>
			<th width="70">작성자</th>
			<td><%=ac.getContWriter() %></td>
		</tr>
		<tr>
			<th width="70">작성일</th>
			<td><%=ac.getContDate() %></td>
		</tr>
		<tr>
			<th width="70">내용</th>
			<td colspan="3" style="height: 170px"><%=ac.getContCont() %></td>
		</tr>
	 	</tbody>
		</table>
		<br>
	
		<table class="table table-striped" id="admin-reply" style="text-align:center">
			<tr>
				<th width="70">사용자 답변</th>
				<td style="height: 100px; text-align: center;"><%=ac.getUserReply()%></td>
			</tr>
		</table>
		
		<table class="table table-striped" id="admin-reply-enroll">
			<tr>
				<th width="70">관리자 답변</th>
<%-- 						<textarea class="form-control" name="adminReply" placeholder="관리자 답변" rows="5" cols="120" style="resize: none;"><%=ac.getAdminReply()%></textarea> --%>
					<td colspan="3"  style="height: 120px"><%= ac.getAdminReply() == null ? "" : ac.getAdminReply() %></td>
			</tr>
		</table>
		<a href="<%=request.getContextPath() %>/adlist.co" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">목록</a>
		
<!-- 		<button type="submit" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">등록</button> -->
		<a href="<%=request.getContextPath() %>/addelete.co?cno=<%=ac.getContNo() %>" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd ; color: black;">삭제</a>
		</form>
	
	</div>
		<%@ include file="/views/common/footerBar.jsp" %>

</body>
</html>