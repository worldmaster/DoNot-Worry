<%@ page import = "java.util.ArrayList, com.kh.product.model.vo.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<% 
	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
	/* Product p = (Product)request.getAttribute("p"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>
        body{
            background-color: #fdfee5;
            box-sizing: border-box;
            text-align: center;
            width: 1500px;
            opacity: 0;
        }
        .territory{
/*             border: 1px solid red; */
            width: 1400px;
            margin: auto;
        }

        /*===============헤더*/
        header{
            height: 150px;
        }
        .headerwrap1{
            display: flex;
        }

        .territory{
/*             border: 1px solid red; */
            width: 1400px;
            margin: auto;
        }

        ul>li{
            list-style-type: none;
        }


        #menubar{
            list-style-type: none;
            display: flex;
            font-weight: 600;
            font-size: 25px;
            line-height: 100px;
            justify-content: space-between;
            
            
        }

        #menubar>li{
            position: relative;
            vertical-align: middle;
            cursor: pointer;
/*             border: 1px solid red; */
        }

        
        /* 메뉴바 호버시 글자색 변경 */
        #menubar>li:hover, #menubar>li>button:hover{
            color: #98fe86;
        }

        
        /* donut worry 메인로고 */
        #main_logo1{
            width: 120px;
            height: 110px;
            vertical-align: middle;
/*             border: 1px solid pink; */
            
        }

        /* 로그인 로고 */
        #main_logo2{
            /* margin-left: -50px; */
            width: 80px;
            height: 80px;
            vertical-align: middle;
/*          der: 1px solid pink; */
        }

        /* 장바구니 로고 */
        #main_logo3{
            margin-left: -50px;
            width: 80px;
            height: 80px;
            vertical-align: middle;
/*             border: 1px solid pink; */
        }

        /* 마이페이지 로고 */
        #main_logo4{
            margin-right: 30px;
            margin-left: -50px;
            width: 80px;
            height: 80px;
            vertical-align: middle;
/*             border: 1px solid blue; */
        }

        /* HELP 하위 리스트 (공지사항, 건의사항, 1:1채팅)  */
        #list_hidden1{
            margin-top: -20px;
            /* margin-left: -10px; */
            padding-left: 0px;
            line-height: 50px;
            font-size: 15px;
            color: black;
            text-decoration: none;
            display: none;
/*             border: 1px solid pink; */
        }

        /* 마이페이지 하위 리스트(회원정보수정, 주문내역조회, 나의건의사항) */
        #list_hidden2{
            margin-top: -20px;
            margin-left: -120px;
            line-height: 50px;
            font-size: 15px;
            display: none;
/*             border: 1px solid pink; */
        }

        /* 하위 리스트 2개 css설정 */
        #list_hidden1>li>a, #list_hidden2>li>a{
            text-decoration: none;
            color: black;
        }

        /* 숨긴 리스트 호버시 글자색 변경 */
        #list_hidden1>li>a:hover, #list_hidden2>li>a:hover{
            color: #98fe86;
        }

        /* HELP 숨긴 리스트 나타내기 (공지사항, 건의사항, 1:1채팅)*/
        #menubar>li:hover ul{
            display: block;
        }
        /* 마이페이지 숨긴 리스트 나타내기(회원정보수정, 주문내역조회, 나의건의사항)*/
        #menubar>li>img:hover+ul{
            display: block;
        }
        
        /* 숨긴 리스트 고정시키기 */
        #menubar>li>ul:hover{
            display: block;
        }



        /*===============컨텐츠*/
        .wrap1{
            width: 1400px;
            /* height: 2000px; */
            margin: auto;
        }
        .wrap1>div{
/*             border: 1px solid blue; */
        }
                /*타이틀*/
        .title{
            height: 150px;
            line-height: 150px;
        }
                /*검색, 카테고리 조회*/
        .searchAndCategory{
            width: 100%;
            display: flex;
            justify-content: space-between;
        }
                    /*검색*/
        .search{
            text-align: center;
            line-height: 50px;
            padding-left: 10px;
        }
        #product{
            box-sizing: border-box;
            border: 3px solid #98fe86;
            border-radius: 20px;
            text-align: center;
            color: #1e7304;
            font-size: 15px;
            width: 300px;
            height: 40px;
        }
        #production{
        	display : inline-block;
            background-color:#98fe86 ;
            color: #1e7304;
            font-weight: 600;
            font-size: 15px;
            box-sizing: border-box;
            border: none;
            border-radius: 100px;
            width: 70px;
            height: 40px;
            line-height : 40px;

        }
        
        #producticon:hover{
            cursor: pointer;
            color: #98fe86;
            background-color: #fdfee5;
            transition-duration: 300ms;
        }
                    /*카테고리 조회*/
                    
        .inner{
        	margin-top : 50px;
        }
        
        .category{
            display: flex;
            align-items: center;
            padding-right: 10px;
        }
        .category input{
            background-color:#98fe86 ;
            color: #1e7304;
            font-weight: 600;
            font-size: 15px;
            box-sizing: border-box;
            border: none;
            border-radius: 100px;
            width: 100px;
            height: 40px;
            margin-left: 20px;
        }
        .category input:hover{
            cursor: pointer;
            color: #98fe86;
            background-color: #fdfee5;
            transition-duration: 300ms;
        }

                /*상품*/
        .product{
            padding: 0 0 30px 0;
        }
        .product>ul{
/*             border: 1px solid green; */
            display: grid;
            grid-template-columns: repeat(4,1fr);
            grid-column-gap: 50px;
            grid-row-gap : 100px;
            padding: 0;
        }
        .product>ul>li{
/*             border: 1px solid yellow; */
            display: inline-grid;
            list-style: none;
            text-align: center;
        }
        .product>ul>li img{
            display: block;
            box-sizing: border-box;
            width: 100%;
            border-radius: 500px;
            border: 4px solid #98fe86
        }
        .inner li:hover{
        	cursor : pointer;
        }



       /*===============푸터*/
       footer{
            height: 100px;
            font-size: 11px;
        }

        footer>a{
            line-height: 18px;
            text-decoration: none;
            font-size: 11px;
            color: black;
        }

    </style>
    
    
</head>
<body>
	<!--헤더-->
	<%@ include file ="/views/common/menubar.jsp" %>
    

    <!--===============컨텐츠-->
                <!--메뉴-->
    <div class="territory wrap1">
        <div class="contentwrap1 title">
            <h2>메뉴</h2>
        </div>
                <!--검색, 카테고리 조회-->
        <div class="contentwrap1 searchAndCategory">
                <!--검색-->
            <div class="contentwrap2 search">
                <form action="<%= contextPath%>/productlistsearch.do" method="get">
                    <input type="search" name="product" id="product" placeholder="검색어를 입력하세요.">
                    <input type="submit" value="검색" id="production">
                </form>
            </div>
                    <!--카테고리 조회-->
            <div class="contentwrap2 category">
                <form action="">
                	<input type="button" value="신상품순" name="new" id="new-order">
                    <input type="button" value="이름순" name="popular" id="name-order">
                    <input type="button" value="낮은가격순" name="low-price" id="low-order">
                    <input type="button" value="높은가격순" name="high-price" id="high-order">
                </form>
                
              <script>
					$(function(){
						$("#new-order").click(function(){
							$.ajax({
								url: "neworder.do",
								type: "post",
								success: function(list){
									let result = "";
									
									for(let product of list){
										result += "<li id='productName'>" 
												+ "<div>"
												+ "<img src='" + '<%=request.getContextPath()%>' + "/" + product.productImg + "'>"
												+ "<div>"
												+ "<h4>" + product.productName + "</h4>"
												+ "<p>" + product.productPrice + "</p>"
												+ "</div>"
												+ "</div>"
												+ "</li>";
									}
									
									
									$(".product>ul").html(result);
								}
							});
						});
						
						$("#name-order").click(function(){
							$.ajax({
								url: "nameorder.do",
								type: "post",
								success: function(list){
									let result = "";
									
									for(let product of list){
										result += "<li id='productName'>" 
												+ "<div>"
												+ "<img src='" + '<%= request.getContextPath() %>' + "/" + product.productImg +"'>"
												+ "<div>"
												+ "<h4>" + product.productName + "</h4>"
												+ "<p>" + product.productPrice + "</p>"
												+ "</div>"
												+ "</div>"
												+ "</li>";
									}
									
									$(".product>ul").html(result);
								}
							});
						});
						
						
						$("#low-order").click(function(){
							$.ajax({
								url : "loworder.do",
								type : "post",
								success : function(list){
									let result = "";
									
									for(let product of list){
										result += "<li id='productName'>" 
											+ "<div>"
											+ "<img src='" + '<%= request.getContextPath() %>' + "/" + product.productImg +  "'>"
											+ "<div>"
											+ "<h4>" + product.productName + "</h4>"
											+ "<p>" + product.productPrice + "</p>"
											+ "</div>"
											+ "</div>"
											+ "</li>";
									}
									
									$(".product>ul").html(result);
								}
							});
						});
						
						
						$("#high-order").click(function(){
							$.ajax({
								url : "highorder.do",
								type : "post",
								success : function(list){
									let result = "";
									
									for(let product of list){
										result += "<li id='productName'>" 
											+ "<div>"
											+ "<img src='" + '<%= request.getContextPath() %>' + "/" + product.productImg + "'>"
											+ "<div>"
											+ "<h4>" + product.productName + "</h4>"
											+ "<p>" + product.productPrice + "</p>"
											+ "</div>"
											+ "</div>"
											+ "</li>";
									}
									
									$(".product>ul").html(result);
								}
							});
						});
					});
				</script>
            </div>
        </div>
                <!--상품-->
        <div class="contentwrap1 product">
            <div class="contentwrap1 product inner">
                <ul>
                	 <% if(productList.size() != 0){ %>
                		<% for(Product p : productList){ %>
                			<li id="productName" onclick="test()">
		                		<div>
		                			<img src="<%=contextPath%>/<%= p.getProductImg()%>" alt=<%=p.getProductName() %>>
		                			<div>
		                				<h4><%=p.getProductName() %></h4>
		                				<p><%=p.getProductPrice() %></p>
		                			</div>
		                		</div>
	                		</li>
                		<% } %>
                	<%} else {%>
                	
                		<li id="productName">
                			<div style="height:300px; color:#1e7304; font-weight:600; font-size:20px; line-height:300px;">
                				"도넛이 준비되어 있지 않습니다."
                			</div>
                		</li>
                	<% } %> 
                    
                </ul>
            </div>
        </div>
    </div>
    
    <script>
        $(function(){
            $(document).ready(function(){
                $("body").css({
                    "opacity": "1",
                    "transition-duration":"1000ms"});
                
            });
            
            
            $(".inner").on('click', 'li', function(){
            	
            	window.location.href = "<%=contextPath%>/productdetail.do?pname="+$(this).find("h4").text();
            	
            });
            
           
        })
        
 
    
    </script>
    
</body>
</html>