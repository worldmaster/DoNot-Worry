<%@page import="com.kh.AdminProduct.model.vo.AdminProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    AdminProduct ap = (AdminProduct) request.getAttribute("b");
    
    System.out.println(ap);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
li{
list-style: none;
}

section {
           height: 900px; /*컨텐츠 영역 사이즈*/
            width: 1400px;/*바꾸면 안 됨*/
            margin: auto;
            text-align: center;
}

section > h1 {
    padding-top: 100px;
    margin: 0 0 100px;
    text-align: center;
    font-size: 1.750em;
    font-weight: 500;
    letter-spacing: 0;
}

.view > .inform01 {
    float: left;
}
.view > .inform01 > .photo {
    margin: 0 0 15px 0;
    width: 360px;
    position: relative;
    padding-top: 100%;
    overflow: hidden;
}

.view > .inform01 > .photo img {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    -o-object-fit: cover;
    object-fit: cover;
}
.view > .inform03 {
    width: calc(100% - 400px);
    float: right;
    height: 100%;
}
.view > .inform03 .price {
    margin-bottom: 30px;
}
.view > .inform03 li {
    line-height: 24px;
}
.view > .inform03 .price li:nth-child(3) {
    font-size: 2.4rem;
    margin: 20px 0 0;
}
.view > .inform03 .txt {
    margin-bottom: 50px;
}
.view > .inform03 .alergy, .view > .inform03 .nutrition {
    position: relative;
    border-top: 1px solid #ebebeb;
    padding: 15px 0;
    line-height: 26px;
}
.view > .inform03 h3 {
    font-size: 2rem;
    font-weight: 500;
}
.view > .inform03 h3 {
    font-size: 2rem;
    font-weight: 500;
}
.view > .inform03 .nutrition {
    border-bottom: 1px solid #ebebeb;
}
</style>
<body>	
	
	<%@ include file="/views/common/menubar2.jsp" %>
		
	<section>
	<h1>메뉴안내</h1>
	<div class="inner">
	<div class="view">
	<div class="inform01">
	<div class="photo">
	<img src="<%=contextPath%>/<%=ap.getFileNo()%>" >
	</div>
	</div>
	
	<div class="inform03">
		<ul class="price">
		<li>
		<h2><%=ap.getProductName() %></h2>
		</li>
		<li><%=ap.getProductPrice() %>원</li>
		</ul>
		
		<ul>
		<li class="alergy">
		<h2><%=ap.getProductExplain() %></h2>
		</li>
		<li class="nutrition">
		<h3><%=ap.getOrigin() %></h3>
		</li>
		</ul>
		<br><br><br>
	<a href="<%= contextPath%>/adproduct.no" class="btn btn-primary" style="background-color: #98fe86; color: black;">목록으로</a>
	<a href="<%= contextPath %>/delete.pd?bno=<%=ap.getProductNo()%>" class="btn btn-primary" style="background-color: #98fe86; color: black;">상품삭제</a>



	

	</div>
	
	</div>
	</div>

	

	</section>
	
</body>
</html>