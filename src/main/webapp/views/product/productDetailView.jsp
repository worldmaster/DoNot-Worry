<%@ page import="com.kh.product.model.vo.Product" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   
   Product p = (Product)request.getAttribute("p");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title><%=p.getProductName() %></title>


<style>
        body{
            background-color: #fdfee5;
            box-sizing: border-box;
            text-align: center;
            width: 1500px;
            opacity: 0;
        }
        body div{
           box-sizing: border-box; 
        }
        .territory{
            /* border: 1px solid red; */
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
            /* border: 1px solid red; */
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
          /*   border: 1px solid red; */
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
           /*  border: 1px solid pink; */
            
        }

        /* 로그인 로고 */
        #main_logo2{
            /* margin-left: -50px; */
            width: 80px;
            height: 80px;
            vertical-align: middle;
           /*  border: 1px solid pink; */
        }

        /* 장바구니 로고 */
        #main_logo3{
            margin-left: -50px;
            width: 80px;
            height: 80px;
            vertical-align: middle;
        /*     border: 1px solid pink; */
        }

        /* 마이페이지 로고 */
        #main_logo4{
            margin-right: 30px;
            margin-left: -50px;
            width: 80px;
            height: 80px;
            vertical-align: middle;
            /* border: 1px solid blue; */
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
           /*  border: 1px solid pink; */
        }

        /* 마이페이지 하위 리스트(회원정보수정, 주문내역조회, 나의건의사항) */
        #list_hidden2{
            margin-top: -20px;
            margin-left: -120px;
            line-height: 50px;
            font-size: 15px;
            display: none;
            /* border: 1px solid pink; */
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
        .wrap{
            width: 1400px;
            margin: auto;
           /*  border: 1px solid blue; */
        }
        .wrap div{
        /*     border: 1px solid green; */
        }
                /*타이틀*/
        .title{
            width: 100%;
            margin:100px 0 100px 0;
            text-align : center;
        }
        
        
                /*메뉴 소개*/
        .menu-info{
            display: flex;
            width: 100%;
            justify-content: space-evenly;
            margin-bottom: 50px;
        }
        .menu-info div{
            text-align: left;
            width: 50%;
        }
        
        .menu-info-img{
        	display : flex;
        	justify-content : center;
        }
                /*메뉴 이미지*/
        .menu-info img{
            width: 500px;
            height: 500px;
            border: 5px solid #98fe86;
            border-radius: 500px;
        }
                /*메뉴디테일*/
        .menu-info-detail{
            display: flex;
            flex-wrap: wrap;
            flex-direction: column; /*수직 정렬*/
            padding: 20px;
        }
        .menu-info-detail>h3, .menu-info-detail>h4{
            color: #1e7304;
        }
        .menu-info-detail>div{
           /*  border: 1px solid #1e7304;  */
        }
        .gocartbox{
            width: 100%;
            display: flex;
            justify-content: center;
            margin-bottom: 150px;
        }
        #gocart{
            display: block;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            width: 180px;
            height: 50px;
            border: none;
            background-color: #98fe86;
            border-radius: 500px;
            color: #1e7304;
            font-size: 18px;
            font-weight: 600;
        }
        #gocart:hover{
            color: #98fe86;
            background-color: #fdfee5;
            cursor: pointer;
            transition-duration: 300ms;
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

<%@ include file="/views/common/menubar.jsp" %>

<!--===============컨텐츠-->
                <!--메뉴-->
    <div class="territory wrap1">
        <div class="contentwrap1 title">
            <h2>메뉴 소개</h2>
        </div>
        <form action="<%=contextPath%>/cart.do" method="get">
            <div class="menu-info">
                <div class="menu-info-img">
                   <img src="<%=contextPath%>/<%= p.getProductImg()%>" alt="<%= p.getProductName() %>">
                </div>
                
                <div class="menu-info-detail">
                   <h3><%=p.getProductName() %></h3>
                    <h4><%=p.getProductPrice() %></h4>
                    <p><%=p.getProductExplain() %></p>
                    <h4>원산지 정보</h4>
                    <p><%=p.getOrigin() %></p>
                </div>
                
            </div>
            <% if(loginUser == null){ %>
               <div class="gocartbox"><button type="reset" id="gocart" style="width:300px;">로그인하면 구매하실 수 있어요</button></div>
            <%} else { %>
               <div class="gocartbox">
               <button type="submit" id="gocart" class="gocartbtn"
               onclick="addToCart
               ('<%=p.getProductName()%>', '<%=p.getProductPrice()%>', 
               '<%=p.getProductNo()%>', '<%=p.getProductImg()%>', 1)">
               장바구니에 담기</button></div>
            
            <%} %>
            
        </form>


    </div>
    
    <script>
    
  
        $(function(){
            $(document).ready(function(){
                $("body").css({
                    "opacity": "1",
                    "transition-duration":"1000ms"});
                
            });
            
        });
        
        function addToCart(productName, productPrice, productNo, productImg, productAmount) {
             // 상품 ID를 키로 사용하여 데이터 추가
             
             if (localStorage.getItem('productName_' + productNo) !== null) {
             // 이미 존재하는 경우 함수 종료
             alert("이미 장바구니에 담겨있는 도넛입니다.");
             event.preventDefault();
             return;
           }

             localStorage.setItem('productNo_' + productNo, productNo);
             localStorage.setItem('productName_' + productNo, productName);
             localStorage.setItem('productPrice_' + productNo, productPrice);
             localStorage.setItem('productImg_' + productNo, productImg);
             localStorage.setItem('productAmount_' + productNo, productAmount);
             
             
             
           }
       
    </script>

<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>