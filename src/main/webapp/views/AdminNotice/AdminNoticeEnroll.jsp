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
	
	<form method="post" action="<%=request.getContextPath()%>/adinsert.no">

	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="2" style="text-align: center;"><h4>공지사항 등록</h4></th>
	</tr>
	</thead>
	 <tbody>
		<tr>
		<tr>
			<th width="70">제목</th>
			<th><input type="text" class="form-control" placeholder="제목" name="title" maxlength="50" required></th>
		</tr>
		<tr>
			<th width="70">내용</th>
			<td><textarea class="form-control" placeholder="내용"  name="content" style="height: 350px;" required></textarea></td>
		</tr>
	 	</tbody>
		</table>
		<br>
		<!-- table class="table table-striped">
			<tr>
				<th width="70">답변</th>
				<td>
					<textarea class="form-control" rows="6" cols="122" style="resize: none; placeholder="관리자 답변내용"></textarea>
				</td>
			</tr>
		</table> -->
		<button type="submit" class="btn btn-primary" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">등록</button>
		<!-- <a href="boardDelete.jsp" class="btn btn-primary">삭제</a> -->
		
		<!-- <input type="submit" class="btn btn-primary pull-right" value="등록">
		<input type="submit" class="btn btn-primary pull-right" value="삭제"> -->
		</form>
	
	</div>
	<%@ include file="/views/common/footerBar.jsp" %>

</body>
</html>