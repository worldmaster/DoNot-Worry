<%@page import="com.kh.contact.model.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    

    Contact c = (Contact) request.getAttribute("b");

    %>
<%@ include file="/views/common/menubar.jsp" %>

<br><br>
	<div class="container">
	<form method="post" action="<%=contextPath %>/update.bo">
	<input type="hidden" name="bno" value="<%=c.getContNo() %>">	
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="2" style="background-color : #eeeeee;">건의사항 수정</th>

	</tr>
	</thead>
	 <tbody>
	 	<tr>
			<td><input type="text" class="form-control" name="writer" maxlength="50" readonly="readonly" value="<%=c.getContWriter() %>"></td>
		</tr>
	 
		<tr>
			<td><input type="text" class="form-control" placeholder="글제목" name="contact_title" maxlength="50" value="<%=c.getContTitle() %>"></td>
		</tr>
		<tr>
			<td><textarea class="form-control" placeholder="글 내용" name="contact_cont" maxlength="2048" style="height: 250px;"><%=c.getContCont() %></textarea></td>
		</tr>
		<tr>
			<td><textarea class="form-control" placeholder="사용자 답변" name="user_reply" maxlength="2048" style="height: 250px;"><%=c.getUserReply() %></textarea></td>
		</tr>
			<tr>
			<td><textarea class="form-control" readonly="readonly" placeholder="관리자 답변" name="admin_reply" maxlength="2048" style="height: 250px;"><%= c.getAdminReply() == null ? "" : c.getAdminReply() %></textarea></td>
		</tr>
		
	 	</tbody>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="수정하기" style="background-color: #98fe86; color: black;">
		
		</form>
	
	</div>
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>