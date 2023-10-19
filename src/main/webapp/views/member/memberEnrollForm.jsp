<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
        .content{
            height: auto; /*컨텐츠 영역 사이즈*/
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
        
        #user_id{
        	
        }
        
        
        /* 아이디 중복확인 버튼 */
        #check-id {
        	float: right;
        	background-color: rgb(240,240,240);
        	border: none;
        	border-radius: 3px;
        }
        
        #join-box button {
            padding: 6px 6px;
            margin: 5px;
        }

        #postcode-btn{
            float: right;
        }
        
        .join-btn {
            margin-left: 9px;
            width: 421px;
        }
        
        
        /* 생년월일 입력폼  */
        input[type='date'] {
            border: 1px solid lightgray; 
            position: relative; 
            width: 100%;
            padding: 5.5px;
            background: url(../../../assets/Calendar.svg) no-repeat right 10px center / 35px auto; 
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


    <div class="content">
        <!--  html 전체 영역을 지정하는 container -->
        <div id="container">
            <!--  login 폼 영역을 : join-box -->
            <form id="join-form" action="<%=contextPath %>/insert.me" method="post">
            
            <!-- 회원가입 페이지 타이틀 -->
            <div id="joinBoxTitle">회원가입</div>
                <br>
            
            <!-- 회원가입 박스 -->
            <div id="join-box">
                <div class="form-group" id="id-form">
                    <label for="user_id">아이디</label>
                    <button type="submit" id="check-id" onclick="idCheck();">중복확인</button>
                    <input type="text" class="form-control" id="user_id" name="userId" placeholder="아이디를 입력해 주세요" required>
                </div>

                <div class="form-group">
                    <label for="user_pwd">비밀번호</label>
                    <input type="password" class="form-control" id="user_pwd" name="userPwd" placeholder="비밀번호를 입력해주세요" required>
                </div>

                <div class="form-group">
                    <label for="check_pwd">비밀번호 확인</label>
                    <input type="password" class="form-control" id="check_pwd" name="checkPwd" placeholder="비밀번호를 다시한번 입력해주세요" required>
                </div>

                <div class="form-group">
                    <label for="user_name">이름</label>
                    <input type="text" class="form-control" id="user_name" name="userName" placeholder="이름을 입력해주세요" required>
                </div>

                <div class="form-group">
                    <label for="b_day">생년월일</label>
                    <input
                    	name="bDay"
                        type='date'
                        placeholder='&nbsp;날짜를 선택해 주세요.'
                        required
                        value={props.date}
                        onChange={props.changeHandler}
                        id='b_day'
                        min={props.isFullRange ? undefined : getDate()}
                        />
                </div>
                
                <div class="form-group">
                    <label for="phone">휴대전화</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="- 포함해서 입력해주세요" required>
                </div>

                <div class="form-group">
                    <label for="address" class="">주소</label>
                    <button type="button" class="btn btn-secondary m-btn--air" onclick="execDaumPostcode()" id="postcode-btn">우편번호 찾기</button>
                </div>
                
                <!-- 주소 입력 -->
                <div class="form-group">
                    <input type="text" class="form-control m-input" name="address" id="postcode" placeholder="우편번호" readonly />
                </div>


                <div class="form-group">
                    <input
                        type="text"
                        class="form-control"
                        name="address"
                        id="address"
                        placeholder="도로명 주소"
                        readonly
                    />
                </div>

                <div class="form-group">
                    <input
                        type="text"
                        class="form-control"
                        name="address"
                        id="address2"
                        placeholder="상세 주소"
                        required
                    />
                </div>

                <div class="join-btn" >
                    <button type="submit" class="btn btn-primary btn-xs" id="login-btn" onclick="return validatePwd();" style="width:100%; background-color: #98fe86; border: #98fe86;">가입하기</button>
                </div>

            </div>
        </form>
     
    </div> 
    </div>  
    
    <script>
	    function idCheck(){
			// 아이디를 입력하는 input 요소 객체 조회
			const $userId = $("#join-box>#id-form>input[name=userId]");
			
			$.ajax({
				url : "<%=contextPath%>/idCheck.me",
				data : {checkId : $userId.val()},
				success : function(result){
					if(result != "1"){
						alert("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
						$userId.focus(); 
					}else{ // 사용함
						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){ 
							$userId.attr("readonly", true); 
						}else{// 사용안함
							$userId.focus();// 아이디 재입력
						}
					}
				}
			});
	    }
    </script>
    <script>
       function validatePwd() {

      		if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val()) {
         
         		alert("비밀번호와 확인 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
         
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