<%@page import="com.kh.contact.model.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    

    Contact c = (Contact) request.getAttribute("b"); //bno임
   	System.out.println(c);
//    	String adminReply = c.getAdminReply() == null ? "" : c.getAdminReply();
    
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
	<form method="post" action="writeAction.jsp">
	<table class="table table-striped" style="text-align:center; border:3px solid #dddddd">
	<thead>
	<tr>
		<th colspan="3" style="background-color : #eeeeee;">건의사항 상세 보기</th>

	</tr>
	</thead>
	 <tbody>
		<tr>
		<tr>
			<td style="width:20%;">글 제목</td>
			<td colspan="2"><%=c.getContTitle() %></td>
		<tr>
			<td>작성자</td>
			<td colspan="2"><%=c.getContWriter() %></td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td colspan="2"><%=c.getContDate() %></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="2" style="width: 200px; text-aling:left;"><%=c.getContCont() %>

			</td>
		</tr>
		
		<!-- 사용자 답변 -->
		<tr>
			<td>사용자답변</td>
			<td colspan="2" style="width: 200px; text-aling:left;">
			<%=c.getUserReply() %>
			</td>
		</tr>
		
		
		<!-- 관리자 답변 -->
				<tr>
			<td>관리자 답변</td>
			<td colspan="2" style="width: 200px; text-aling:left;"><%= c.getAdminReply() == null ? "" : c.getAdminReply() %>

			</td>
		</tr>
		
	 	</tbody>
		</table>
		<!--목록으로 돌아갈수 있는 a태그  -->
		<a href="<%= contextPath%>/list.bo" class="btn btn-primary" style="background-color: #98fe86; color: black;" >목록</a>
		<a href="<%= contextPath %>/update.bo?bno=<%=c.getContNo() %>" class="btn btn-primary" style="background-color: #98fe86; color: black;">수정</a>
		<a href="<%= contextPath %>/delete.bo?bno=<%=c.getContNo() %>" class="btn btn-primary" style="background-color: #98fe86; color: black;" ">삭제</a>
		
	<%-- 	<%
			if(userId != null && userID.equals(bbs.getUserID())){ %>
				 --%>
				<%-- <a href="boardUpdate.jsp?bbsId=<%=bbsID 
			 수정 삭제 버튼이 보이게 안 보이게
		 --%>
			
		
		
		
		
		</form>
	
	</div>
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>