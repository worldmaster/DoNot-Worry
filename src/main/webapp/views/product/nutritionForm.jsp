<%@ page import="java.util.ArrayList, com.kh.product.model.vo.Nutrition" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Nutrition> nutritionList = (ArrayList<Nutrition>) request.getAttribute("nutritionList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"> </script>

<style>
.content {
	height: auto; /*컨텐츠 영역 사이즈*/
	width: 1400px; /*바꾸면 안 됨*/
	margin: auto;
}

#container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
	/* border: 1px solid blue; */
}
/* 영양정보 타이틀 (영어) */
#nutrition_title1 {
	font-size: 25px;
}
/* 영양정보 타이틀 (한글) */
#nutrition_title2 {
	font-size: 30px;
	font-weight: bold;
}

/* 제품명 검색창 전체 div */
#search {
	float: left;
	margin-right: 950px;
	margin-bottom: 10px;
	height: 30px;
	width: 250px;
	border: 1px solid #98fe86;
	border-radius: 2px;
	background-color: #fdfee5;
}
/* 제품명 검색 input type text태그 */
#search2 {
	font-size: 16px;
	width: 200px;
	height: 25px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
	background-color: #fdfee5;
}
/* 제품명 검색클릭 버튼 */
#search-btn {
	height: 100%;
	border: 0px;
	background-color: #98fe86;
	outline: none;
	float: right;
	color: white;
}

/* 제품명 검색 placeholder 색상 조정 */
input:-ms-input-placeholder {
	color: #a8a8a8;
}

input::-webkit-input-placeholder {
	color: #a8a8a8;
}

input::-moz-placeholder {
	color: #a8a8a8;
}

/* 영양성분표 */
table {
	border-collapse: collapse;
	/* float: left; */
	margin: 0 0 2em;
	width: 1200px;
	
}

table {
	border-bottom: 2px solid #98fe86;
	font-size: 15px;
	font-weight: 700;
	background-color: rgb(218, 255, 195);
}

thead {
	border-top: 2px solid #98fe86;
	border-bottom: 2px solid #98fe86;
	text-align: center;
	height: 50px;
	background-color: rgb(218, 255, 195, 0.5);
}

th {
	padding: 0.35em 0 .35em;
	font-weight: 700;
	font-size: 16px;
	text-align: center;
}

tbody {
	border-bottom: 2px solid #98fe86;
	
}

tr > td:first-child{
	font-weight: 700;
}

tr {
	border-bottom: 1px solid lightgray;
	/* padding: 0.35em 0 .35em; */
	font-size: 16px;
	height: 50px;
	font-weight: 500;
}


</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<br><br><br><br>
	<div class="content">

		<div id="container">

			<div id="nutrition_title1">Nutrition Information</div>
			<br>
			<div id="nutrition_title2">영양정보</div>
			
			<br><br><br>
			
			<form id="search"> 
				<input type="text" id="search2" name="searchNutrition" placeholder="제품명 입력">
				<button type="button" id="search-btn">검색</button>
			</form>
			<form>
				<table id="nutrition_list">
					<thead>
						<tr>
							<th style="text-align: center;">제품명</th>
							<th style="text-align: center;">열량(kcal)</th>
							<th style="text-align: center;">1회제공량(g)</th>
							<th style="text-align: center;">당류(g)</th>
							<th style="text-align: center;">단백질(g)</th>
							<th style="text-align: center;">포화지방(g)</th>
							<th style="text-align: center;">나트륨(mg)</th>
							<th style="text-align: center;">알레르기 성분</th>
						</tr>
					</thead>
					<tbody>
						 <% if(nutritionList.isEmpty()) {%> 
							<tr>
								<td colspan="8">조회된 리스트가 없습니다.</td>
							</tr>
						 <% } else {%> 
								<% for(Nutrition n : nutritionList) {%>
									<tr>
										<td><%= n.getProductName() %></td>
										<td><%= n.getKcal()  %></td>
										<td><%= n.getServingSize() %></td>
										<td><%= n.getSugar() %></td>
										<td><%= n.getProtein() %></td>
										<td><%= n.getFat() %></td>
										<td><%= n.getNa() %></td>
										<td><%= n.getAllergy() %></td>
									</tr>
								<% } %>
						 <% } %> 
						
					</tbody>
				</table>
			</form>
			
			<script>
				$("#search>button").click(function(){
					const searchKey = $("#search2").val();
					
						location.href="<%= contextPath%>/nutritionsearchlist.do?searchNutrition="+searchKey;
					
				});
			</script>  
		</div>
	
	</div>


	

	<%@ include file="/views/common/footerBar.jsp"%>
</body>
</html>