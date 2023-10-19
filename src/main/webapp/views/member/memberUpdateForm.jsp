<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<style>

        .content{
            height: 1200px; /*컨텐츠 영역 사이즈*/
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

        #join-form {
            width: 450px;
            text-align: left;
            background-color: #fdfee5;
        }

        .form-group{
            margin: 15px;
        }
        
        
        #joinBoxTitle {
            color:#000000;
            font-weight: bold;
            font-size: 35px;
            text-transform: uppercase;
            padding: 5px;
            margin-bottom: 20px;
            text-align: center;
            
        }
        
        #join-box button {
            padding: 6px 6px;
            margin: 5px;
        }

        #postcode-btn{
            float: right;
        }

        #withdraw-btn{
            border: none;
            text-decoration: underline;
            background-color:transparent;
            float: right;
        }
        
        .join-btn {
            margin-left: 9px;
            width: 421px;
        }
        
        #change-btn{
        	width:100%; 
        	background-color: #98fe86; 
        	border: #98fe86; 
        	font-size:15px; 
        	padding: 5px 0;
        }
        
        
        /* 생년월일 입력폼  */
        input[type='date'] {
            border: 1px solid lightgray; 
            position: relative; 
            width: 100%;
            padding: 5.5px;
            background: url(../../../assets/Calendar.svg) no-repeat right 10px center / 35px auto; 
            /* // 배경에 커스텀 아이콘을 넣어주자! x축은 오른쪽에서부터 10px 떨어지게 하고, y축은 가운데 정렬하고, width 35px에 height auto라는 크기를 부여한다. */
            background-color: white;
            border-radius: 4px;
            text-align: center;
            font-size: 100%;
        }
        
        /* // 실제 캘린더 아이콘을 클릭하는 영역을 의미하는 선택자 */
        /* // 이 영역을 확장해서 input의 어떤 곳을 클릭해도 캘린더를 클릭한 것과 같은 효과를 만들자! */
        input[type='date']::-webkit-calendar-picker-indicator {
            position: absolute; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: transparent; 
            color: transparent; 
            cursor: pointer;
        }
        
        /* // type이 date인 input의 placeholder를 커스텀하기 위한 선택자
        // 기본적으로 type date인 input은 placeholder가 먹히지 않기 때문이다! */
        input[type='date']::before {
            content: attr(placeholder); 
            width: 100%;
            height: 100%;
            text-align: left;
            color: rgb(108 , 117, 125);
        }
        
        /* // input에 어떠한 유효값이 입력된 상태인지 확인하는 선택자
        // 날짜를 선택하면 유효값이 입력된다.
        // 이 속성을 활용하고자 한다면 반드시 태그에 required 속성을 달아줘야한다. */
        input[type='date']:valid::before {
            display: none; 
        }


</style>
</head>

<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<%
		// address ,로 나눠서 value값에 넣기! 
		String address = loginUser.getAddress();
		String[] addressArr = address.split(",");
		String ad0 = addressArr[0];
		String ad1 = addressArr[1];
		String ad2 = addressArr[2];
		
		// String userName = loginUser.getUserName();
		
	%>

    <div class="content">
        <!--  html 전체 영역을 지정하는 container -->
        <div id="container">
            
            <div id="join-form">
            
            
            <div id="joinBoxTitle">회원정보 수정</div>
                <br>
            
            <!-- 회원정보 수정 박스 -->
            <form id="update-box" action="<%=contextPath %>/update.me" method="post">
                <div class="form-group" >
                    <label for="user_id">아이디</label>
                    <input type="text" class="form-control" id="user_id" name="userId" value="<%=loginUser.getUserId() %>" readonly/> 
                    <!-- readonly : 폼으로 전송 가능 & disabled : 폼으로 전송 불가  -->
                </div>
                
                <div class="form-group">
                    <label for="user_pwd">기존 비밀번호</label>
                    <input type="password" class="form-control" id="user_pwd" name="userPwd" value="<%=loginUser.getUserPwd() %>"readonly>
                </div>
                

                <div class="form-group">
                    <label for="new_pwd">새 비밀번호</label>
                    <input type="password" class="form-control" id="new_pwd" name="newPwd" placeholder="새로운 비밀번호를 입력하세요">
                </div>

                <div class="form-group">
                    <label for="check_pwd">새 비밀번호 확인</label>
                    <input type="password" class="form-control" id="check_pwd" name="checkNewPwd" placeholder="새로운 비밀번호를 다시한번 입력하세요">
                </div>

                <div class="form-group">
                    <label for="user_name">이름</label>
                    <input type="email" class="form-control" id="user_name" name="userName" value="<%=loginUser.getUserName() %>" readonly/>
                </div>

                <div class="form-group">
                    <label for="b_day">생년월일</label>
                    <input
                    	value="<%=loginUser.getbDay() %>"
                    	name="bDay"
                        type='date'
                        required
                        placeholder="&nbsp;생년월일을 입력하세요"
                        onChange={props.changeHandler}
                        id='b_day'
                        min={props.isFullRange ? undefined : getDate()}
                        />
                </div>
                
                <div class="form-group">
                    <label for="phone">휴대전화</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="<%=loginUser.getPhone() %>" placeholder="핸드폰 번호를 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="address" class="">주소</label>
                    <button type="button" class="btn btn-secondary m-btn--air" onclick="execDaumPostcode()" id="postcode-btn">우편번호 찾기</button>
                </div>
                
                <!-- 주소 입력 -->
                <div class="form-group">
                    <input type="text" class="form-control m-input" name="address"  id="postcode" value="<%=ad0 %>" placeholder="우편번호" readonly />
                </div>


                <div class="form-group">
                    <input
                        type="text"
                        class="form-control"
                        name="address"
                        id="address"
                        placeholder="도로명 주소"
                        value="<%=ad1 %>"
                        readonly
                    />
                </div>

                <div class="form-group">
                    <input
                        type="text"
                        class="form-control"
                        name="address"
                        placeholder="상세 주소"
                        value="<%=ad2 %>"
                        required
                    />
                </div>

                <div class="form-group">
                    <button type="button" id="withdraw-btn" onclick="deletePage()">탈퇴하기</button>
                </div>

                <div class="join-btn" >
                    <button type="submit" class="btn btn-primary btn-xs" id="change-btn" onclick="return validatePwd();">수정하기</button>
                </div>

            </form>
        </div>
     
    </div>  
    
    <script>
    	function deletePage(){
    		location.href = "<%=contextPath%>/delete.me";
    	}
    	
    </script> 
    
    <script>
       function validatePwd() {

      		if($("input[name=newPwd]").val() != $("input[name=checkNewPwd]").val()) {
         
         		alert("새비밀번호와 새비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
         
        		return false;
            }
        }
    </script>

    <script>
    /** 우편번호 찾기 */
    function execDaumPostcode() {
        daum.postcode.load(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                $("#postcode").val(data.zonecode);
                $("#address").val(data.roadAddress);
                }
            }).open();
        });
    }
    </script>
	
	
	
	<%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>