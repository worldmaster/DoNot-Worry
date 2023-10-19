<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
	 
    .content{
        height: 600px; /*컨텐츠 영역 사이즈*/
        width: 1400px;/*바꾸면 안 됨*/
        margin: auto;
    }

    #container {
	    display: flex;
	    flex-direction: row;
	    justify-content: center;
	    align-items: center;
	    height: 100%;
    	
    }

    #loginBox {
	    width: 400px;
	    text-align: center;
	    background-color: #fdfee5;
    }
    .input-form-box {
	    border: 0px solid #ff0000;
	    display: flex;
	    margin: 5px;
    }
    .input-form-box > span {
	    display: block;
	    text-align: left;
	    padding-top: 5px;
	    min-width: 65px;
    
    }
    .button-login-box {
    	margin: 10px 0;
    }
    #loginBoxTitle {
	    color:#000000;
	    font-weight: bold;
	    font-size: 35px;
	    text-transform: uppercase;
	    padding: 5px;
	    margin-bottom: 20px;
	    }
    
    #inputBox {
    	margin: 10px;
    }

    #inputBox button {
	    padding: 6px 5px;
	    margin: 5px;
    }

</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	
    <div class="content" >
        <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
        <!--  login 폼 영역을 : loginBox -->
        <form id="loginBox" action="<%=request.getContextPath()%>/login.me" method="POST">
        
        
          <!-- 로그인 페이지 타이틀 -->
          <div id="loginBoxTitle">Login</div>
  
          <div id="welcome">Welcome to Donut worry!</div>
          <!-- 아이디, 비번, 버튼 박스 -->
          <div id="inputBox">
            <div class="input-form-box"><span>아이디 </span><input type="text" name="userId" class="form-control"></div>
            <div class="input-form-box"><span>비밀번호 </span><input type="password" name="userPwd" class="form-control"></div>
            <div class="button-login-box" >
              <button type="submit" class="btn btn-warning btn-xs" id="login-btn" style="width:100%; background-color: #98fe86; border: #98fe86;">로그인</button>
              
              <button type="button" class="btn btn-secondary btn-xs" id="join-btn" onclick="enrollPage();" style="width:100%">회원가입</button>
              
            </div>
          </div>
          
        </form>
      </div>
  
     </div>  
     
     <script>
         function enrollPage() {
            
            <%--location.href = "<%=contextPath%>/views/member/memberEnrollform.jsp";--%>
            // 웹 애플리케이션의 디렉토리 구조가 url에 노출되면 보안에 취약하다.
            
            // 단순한 정적인 페이지 요청일지라도 반드시 servlet을 거쳐가도록 작성할것.
            // 즉, url의 서블릿 매핑값만 노출되도록 하기.
            location.href = "<%=contextPath%>/enrollForm.me";
            
         }
      </script>  	
	
	
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>