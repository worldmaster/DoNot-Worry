<%@page import="com.kh.contact.model.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  Contact c = (Contact) request.getAttribute("b");
  System.out.println(c);
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

<br><br>
	<div class="container">
	<form method="post" action="<%=contextPath %>/insert.bo">
	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="2" style="background-color : #eeeeee;">건의사항 등록</th>

	</tr>
	</thead>
	 <tbody>

	 
		<tr>
			<td><input type="text" class="form-control" placeholder="글제목" name="contact_title" maxlength="50"></td>
		</tr>
		<tr>
			<td><textarea class="form-control" placeholder="글 내용" name="contact_cont" maxlength="2048" style="height: 250px;"></textarea></td>
		</tr>
		<tr>
			<td><textarea class="form-control" placeholder="사용자 답변" name="user_reply" maxlength="2048" style="height: 250px;"></textarea></td>
		</tr>
	 	</tbody>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기" style="background-color: #98fe86; color: black;">
		
		</form>
	
	</div>
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>