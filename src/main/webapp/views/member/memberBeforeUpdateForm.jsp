<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            background-color: hwb(62 90% 0%);
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

        #next-btn{
            width: 370px;
            background-color: #98fe86;
            border: #98fe86; 
            color: white;
            font-weight: bold;

        }
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	
    <div class="content">
        
    <div id="container">
        
        <form id="loginBox" action="<%=request.getContextPath()%>/beforeupdate.me" method="POST">
        
          	  <!-- 회원가입 전 비밀번호 재확인 타이틀 -->
	          <div id="loginBoxTitle">회원정보 수정</div>
	  
	          <div id="welcome">회원님의 정보보호를 위해 <br> 비밀번호를 재확인하고 있습니다.</div>
	          
	          <br>
	          <!-- 아이디, 비번, 버튼 박스 -->
	          <div id="inputBox">
	          	  <div class="input-form-box"><span>아이디 </span><input type="text" id ="userIdInput" name="userId" class="form-control" value="<%=loginUser.getUserId() %>" readonly></div>
	            
	              <div class="input-form-box"><span>비밀번호 </span><input type="password" name="userPwd" class="form-control"></div>
	            
	              <div class="button-login-box" >
	                  <button type="submit" class="btn btn-warning btn-xs" id="next-btn" >다&nbsp;&nbsp;&nbsp;음</button>
	              </div>
	          
	          </div>
          
        
        </form>
    </div>
  
      <!-- Bootstrap Bundle with Popper -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </div>    
	
	
	
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>