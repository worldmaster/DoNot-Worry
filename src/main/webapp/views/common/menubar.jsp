<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
   String contextPath = request.getContextPath();

   Member loginUser = (Member)session.getAttribute("loginUser");
   //로그인 전이라면 loginUser에는 null값이 담겨있을 것이고
   // 로그인 성공 후라면 loginUser에는 로그인한 회원의 정보가 담긴 Member객체가 들어가 있을 것
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom.css">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>



    <title>Document</title>
    <style>

        body{
            background-color: #fdfee5;
            box-sizing: border-box;/*바꾸면 안 됨*/
            text-align: center;/*바꾸면 안 됨*/
            width: 1500px;/*바꾸면 안 됨*/
        }

        .territory{/*헤더, 푸터 가로 길이 설정*/
            
            width: 1400px;/*바꾸면 안 됨*/
            margin: auto;
        }

        ul>li{
            list-style-type: none;
        }

        /*====================================================================================== */
        /*======================================헤더=============================================*/
        /*====================================================================================== */
        
        header{
            height: 150px;/*바꾸면 안 됨*/
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
            
        }


          #nutirition{
           color: black;
           text-decoration: none;
        }
        /* 메뉴바 호버시 글자색 변경 */
        #menubar>li:hover, #menubar>li>button:hover, #nutirition:hover{
            color: #98fe86;
        }
        
        /* donut worry 메인로고 */
        #main_logo1{
            width: 120px;
            height: 110px;
            vertical-align: middle;
            
            
        }

        /* 로그인 로고 */
        #main_logo2{
            /* margin-left: -50px; */
            width: 80px;
            height: 80px;
            vertical-align: middle;
            
        }

        /* 장바구니 로고 */
        #main_logo3{
            margin-left: -50px;
            width: 80px;
            height: 80px;
            vertical-align: middle;
            
        }

        /* 마이페이지 로고 */
        #main_logo4{
            margin-right: 30px;
            margin-left: -50px;
            width: 80px;
            height: 80px;
            vertical-align: middle;
            
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
            
        }

        /* 마이페이지 하위 리스트(회원정보수정, 주문내역조회, 나의건의사항) */
        #list_hidden2{
            margin-top: -20px;
            margin-left: -120px;
            line-height: 50px;
            font-size: 15px;
            display: none;
            
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
	#HELP{
	color: black;
	 text-decoration: none;
	}
	#HELP:hover {
	color: #98fe86;
	 text-decoration: none;
	}


    </style>
</head>






<body>

	<script>
		
		const msg = "<%= (String)session.getAttribute("alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.
			// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
    
    <header class="territory">
        <ul id="menubar">
            <li><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/img/logo.png" id="main_logo1"></a></li>
            <br>
             <li onclick="pageOpen();">상품</li>
            <li><a id="nutirition" href = "<%=contextPath%>/nutritionlist.do">영양성분</a></li>
            <li>
                <a id="HELP">HELP</a>
                              <ul id="list_hidden1">
                    <li><a href="<%=contextPath %>/list.no">공지사항</a></li>
                    <li><a href="<%=contextPath %>/list.bo">건의사항</a></li>
                    <li><a href="<%=contextPath %>/views/chat/chat.jsp">1:1 채팅</a></li>
                </ul>
            </li>

            <br><br>
			<%-- "<%= request.getContextPath()%>/login.me" --%>
			
			<%if(loginUser == null){ %>
            	<li><a href="<%=contextPath%>/login.me"><img src="<%=request.getContextPath()%>/resources/img/login (2).png" id="main_logo2"></a></li>
            <% } else { %>
            	<li><a href="<%=contextPath%>/logout.me"><img src="<%=request.getContextPath()%>/resources/img/logout.png" id="main_logo2"></a></li>
            <% } %>
            <li><img src="<%=request.getContextPath()%>/resources/img/cart (2).png" id="main_logo3" onclick="goCart()" ></li>
            <li>
                <img src="<%=request.getContextPath()%>/resources/img/mypage (2).png" id="main_logo4">
                <ul id="list_hidden2">
                    <% if(loginUser != null){ %>
                    <li><a href="<%=contextPath%>/beforeupdate.me">회원정보수정</a></li>
                    <li><a href="<%=contextPath%>/list.od?uno=<%=loginUser.getUserNo()%>">주문내역조회</a></li>
                    <li><a href="">나의건의사항</a></li>
                <%} %>
                </ul>
            </li>
            
        </ul>
    </header>
    
     <script>
		function pageOpen(){
			location.href = "<%=request.getContextPath()%>/product.do";
		}	
		
		function goCart(){
			<%if(loginUser == null){%>
				alert("로그인 후 이용해주세요.");
				event.preventDefult();
				return;
			<%}%>
			location.href = "<%=request.getContextPath()%>/cart.do";
		}
	</script>


 
    
</body>
</html>