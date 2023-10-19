<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.member.model.vo.Member"%>
<%
    String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/jsp1/resources/css/bootstrap.css">
<link rel="stylesheet" href="/jsp1/resources/css/custom.css">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <title>Document</title>
   <style>
   
        body{
            background-color: #fdfee5;/*바꾸면 안 됨*/ 
            box-sizing: border-box;/*바꾸면 안 됨*/
            text-align: center;/*바꾸면 안 됨*/
            width: 1500px;/*바꾸면 안 됨*/
        }

        .territory{/*헤더, 푸터 가로 길이 설정*/
/*             border: 1px solid red; */
            width: 1400px;/*바꾸면 안 됨*/
            margin: auto;
        }

        #menubar img{
            width: 120px;
            height: 110px;
            vertical-align: middle;
            
        }
        
        #login img{
            width: 80px;
            height: 89px;
        }

        /*===============헤더*/
        header{
            height: 150px;/*바꾸면 안 됨*/
        }
        
        #menubar{
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around;
            font-weight: 600;
            font-size: 25px;
            line-height: 150px;
            
        }
        
          #list_hidden1>li>a{
            text-decoration: none;
            color: black;
        }
        
         #menubar>li:hover ul{
            display: block;
        }
        
         #list_hidden1{
            margin-top: -50px;
            /* margin-left: -10px; */
            padding-left: 0px;
            line-height: 50px;
            font-size: 15px;
            color: black;
            text-decoration: none;
            display: none;
            /* border: 1px solid pink; */
        }
        

       /*===============컨텐츠*/
        .content{
/*             border: 1px solid red; */
            height: 1100px; /*컨텐츠 영역 사이즈*/
            width: 1400px;/*바꾸면 안 됨*/
            margin: auto;
            text-align: center;
           /*  display: flex;
  			justify-content: center; */
        }
        
        #menubar a{
        	text-decoration:none;
        	color: black;
        }
        
         #list_hidden1>li>a:hover{
            color: #98fe86;
        }
        
        ul>li{
            list-style-type: none;
        }
        
        #menubar a:hover{
        	cursor: pointer;
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
            <li><a href="<%=contextPath%>/list.od?uno=<%=loginUser.getUserNo()%>">결제관리</a></li>
            <li><a href="<%=contextPath %>/adproduct.no">상품관리</a></li>
            <li><a href="<%=contextPath %>/adlist.us">회원관리</a></li>
            <li>
	            <a>HELP</a>
		            <ul id="list_hidden1">
		                <li><a href="<%=contextPath %>/adlist.no">공지사항</a></li>
		                <li><a href="<%=contextPath %>/adlist.co">건의사항</a></li>

		                
					</ul>
			</li>
            <div id="login">
            <li><a href="<%=contextPath%>/logout.me"><img src="<%=request.getContextPath()%>/resources/img/logout.png"><a></a></li> <!-- 로그인 이미지 클릭 시 로그인 창으로 -->
<%--             <a href="<%=contextPath%>/login.me"></a> --%>
            </div>
        </ul>
    </header>
</body>
</html>