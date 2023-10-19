<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.AdminNotice.model.vo.AdminNotice"%>
<%	AdminNotice an = (AdminNotice)request.getAttribute("an");%>
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
<!-- 	<form method="post" action=""> -->
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="5" style="text-align: center;"><h4>공지사항</h4></th>
	</tr>
	</thead>
	 <tbody>
		<tr>
		<tr>
			<th width="70">제목</th>
			<!-- <td width="900">공지사항 확인하세요1</td> -->
			<td width="900"><%=an.getNoticeTitle()%></td>
		</tr>
		<tr>
			<th width="70">작성자</th>
			<!-- <td>관리자</td> -->
			<td><%=an.getNoticeWriter() %></td>
		</tr>
		<tr>
			<th width="70">작성일</th>
			<!-- <td>2023-04-01</td> -->
			<td><%=an.getNoticeDate() %></td>
		</tr>
		<tr>
			<th width="70">내용</th>
			<!-- <td colspan="3" style="height: 230px">관리자 공지사항 내용</td> -->
			<td colspan="3" style="height: 230px"><%=an.getNoticeCont() %></td>
		</tr>
	 	</tbody>
		</table>
		
		<br>
		<!-- <table class="table table-striped">
			<tr>
				<th width="70">답변</th>
				<td>
					<textarea class="form-control" rows="6" cols="122" style="resize: none; placeholder="관리자 답변내용"></textarea>
				</td>
			</tr>
		</table> -->
		<a href="<%=request.getContextPath() %>/adlist.no" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">목록</a>
		
		<%-- <% if(loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter())) {%> --%>
		<a href="<%=request.getContextPath() %>/adUpdate.no?ano=<%=an.getNoticeNo() %>" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">수정하기</a>
		<a href="<%=request.getContextPath() %>/adDelete.no?ano=<%=an.getNoticeNo() %>" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd ; color: black;">삭제하기</a>
		<%-- <%} %> --%>
		
		<!-- <input type="submit" class="btn btn-primary pull-right" value="등록">
		<input type="submit" class="btn btn-primary pull-right" value="삭제"> -->
		<!-- </form> -->
	</div>
		<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>