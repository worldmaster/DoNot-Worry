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
	<table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd">
	<thead>
	<tr>
		<th colspan="5" style="text-align: center"><h4>건의사항</h4></th>
	</tr>
	<tr>
		<th style="background-color : #fafafa; color:#000000; width:70px;"><h5>번호</h5></th>
		<th style="background-color : #fafafa; color:#000000;"><h5>제목</h5></th>
		<th style="background-color : #fafafa; color:#000000;"><h5>작성자</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:100px;"><h5>작성날짜</h5></th>
		<th style="background-color : #fafafa; color:#000000; width:70px;"><h5>조회수</h5></th>
	</tr>
	</thead>
	<tbody>
		<tr>
		<td>1</td>
		<td>안녕하세요</td>
		<td>홍길동</td>
		<td>2018-01-01</td>
		<td>1</td>	
		</tr>
		<tr>
			<td colspan="5"><a href="boordWrite.jsp" class="btn btn-primary pull-right" type="submit">글 작성</a>
		</tr>	
		
		
	</tbody>
	</div>




</body>
</html>