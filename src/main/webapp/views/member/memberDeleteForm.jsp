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

        #deleteBox {
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
        .button-delete-box {
        	margin: 10px 0;
        }

        #deleteBoxTitle {
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

        #delete-btn{
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
        
        <form id="deleteBox" action="<%= contextPath %>/delete.me" method="post">
        
          <!-- 로그인 페이지 타이틀 -->
          <div id="deleteBoxTitle">회원탈퇴</div>
  
          <div id="text">진행중인 주문이 있는 경우 <br> 모든 주문처리 완료 후 탈퇴 가능합니다.</div>
          <br>
          <div id="text">회원탈퇴시 모든 정보는 복원되지 않습니다.</div>
          <br>
          <!-- 아이디, 비번, 버튼 박스 -->
          <div id="inputBox">
            <div class="input-form-box"><span>아이디 </span><input type="text" name="userId" class="form-control" value="<%=loginUser.getUserId() %>" readonly></div>
            
            <div class="input-form-box"><span>비밀번호 </span><input type="password" name="userPwd" class="form-control"></div>
            
            <div class="button-delete-box" >
              <button type="submit" class="btn btn-warning btn-xs" id="delete-btn" >잘가(가지마)행복해(떠나지마..)</button>
            </div>
          
        </div>
          
        
      </form>
      </div>
  
    </div>
      
	
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>