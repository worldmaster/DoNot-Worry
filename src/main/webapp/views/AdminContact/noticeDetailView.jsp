<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

<br><br><br>
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
			<td colspan="2"><%-- <%=bbs.getBbsTitle() %> --%> 제목</td>
		<tr>
			<td>작성자</td>
			<td colspan="2">홍길동</td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td colspan="2">2018-04-02</td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="2" style="width: 200px; text-aling:left;">내용이깁니다\
			</td>
		</tr>
		
		<tr>
			<td>관리자 답변</td>
			<td colspan="2" style="width: 200px; text-aling:left;">관리자 답변
			</td>
		</tr>
		
	 	</tbody>
		</table>
		<!--목록으로 돌아갈수 있는 a태그  -->
		<a href="<%contextPath.r %>" class="btn btn-primary">목록</a>
		<a href="boardUpdate.jsp" class="btn btn-primary">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" <%-- href="boardDelete.jsp?bbsID=<%bbsID %> " --%> class="btn btn-primary">삭제</a>
		
	<%-- 	<%
			if(userId != null && userID.equals(bbs.getUserID())){ %>
				 --%>
				<%-- <a href="boardUpdate.jsp?bbsId=<%=bbsID 
			 수정 삭제 버튼이 보이게 안 보이게
		 --%>
			
		
		
		
		
		</form>
	
	</div>
</body>
</html>