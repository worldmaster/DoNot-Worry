<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Notice n = (Notice) request.getAttribute("n");
	System.out.println(n);
%>
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
		<th colspan="3" style="background-color : #eeeeee;">공지사항 상세 보기</th>
	</tr>
	</thead>
	 <tbody>
		<tr>
		<tr>
			<td style="width:20%;">글 제목</td>
			<td colspan="2"><%=n.getNoticeTitle() %></td>
		<tr>
			<td>작성자</td>
			<td colspan="2"><%=n.getNoticeWriter() %></td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td colspan="2"><%=n.getNoticeDate() %></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="2" style="width: 200px; text-aling:left;"><%=n.getNoticeCont() %>
			</td>
		</tr>
		

		
	 	</tbody>
		</table>
		<!--목록으로 돌아갈수 있는 a태그  -->
		<a href="<%= contextPath%>/list.no" class="btn btn-primary" style="background-color: #98fe86; color: black;">목록</a>
		
		
<%-- 		<a href="boardUpdate.jsp" class="btn btn-primary">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="boardDelete.jsp?bbsID=<%bbsID %> " class="btn btn-primary">삭제</a>
		 --%>
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