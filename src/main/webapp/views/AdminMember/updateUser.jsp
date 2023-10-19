<%@ page import = "com.kh.AdminMember.model.vo.AdminManageUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	AdminManageUser aaa = (AdminManageUser)request.getAttribute("aaa");
 
 	String address = aaa.getAddress();
	String[] addressArr = address.split(",");
	String ad0 = addressArr[0];
	String ad1 = addressArr[1];
	String ad2 = addressArr[2];
%>
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	 #userUpdate>input{
            width: 300px;
            height: 40px;
            border-radius :5px;
            border: 1px solid lightgray;
        }
	
	 #userUpdate_btn>button{
           /*  border-radius :4px;
            border: 1px solid lightgray;
            background-color: lightgray;
            background-color: rgba( 255, 255, 255, 0.4 );
            color: black;
            height: 35px; */
            
            background-color: #fafafa;
        	border-radius: 4px;
        	border: 1px solid #dddddd;
        	color: black;
        	height: 40px;
        	width: 50px; 
        }
        
        .form-group{
        	margin-left: 210px;
        }
        
        .Adminaddress{
        	margin-left: 370px;
        }
        
        #userUpdate>#postcode-btn{
        	margin-left: 43px;
        }
	
	
</style>
</head>
<body>

	<%@ include file="/views/common/menubar2.jsp" %>
	
	<div class="content">
        <br><br><br>
        <h4>회원정보 수정</h4>
        <br>
        <form method="post" id="userUpdate" action="<%=request.getContextPath()%>/adupdate.us">
        
       		<input type="hidden" name ="uno" value="<%=(int)request.getAttribute("uno")%>"> 
       		
            <input type="hidden" name="status" value="<%=aaa.getStatus()%>">
        	
            이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName" value="<%=aaa.getUserName()%>"><br><br>
            
            생년월일&nbsp;&nbsp;<input type="date" name="bDay" value="<%= aaa.getbDay() %>"><br><br>

            휴대전화&nbsp;&nbsp;<input type="text" name="phone" value="<%= aaa.getPhone() %>" placeholder="- 포함해서 입력"><br><br>
            
<%--             주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" value="<%=aaa.getAddress()%>"><br><br><br> --%>
            
            
            
            <div class="form-group" id="userUpdate">
                    <button type="button" class="btn btn-secondary m-btn--air" onclick="execDaumPostcode()" id="postcode-btn">우편번호 찾기</button>
<!--                     <label for="address" class="">주소</label> -->
                </div>
                
                <div class="Adminaddress">
                <!-- 주소 입력 -->
                <div class="form-group" id="userUpdate">
                    <input type="text" class="form-control m-input" name="address"  id="postcode" value="<%=ad0 %>" placeholder="우편번호" readonly />
                </div>

			
                <div class="form-group" id="userUpdate">
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

                <div class="form-group" id="userUpdate">
                    <input
                        type="text"
                        class="form-control"
                        name="address"
                        placeholder="상세 주소"
                        value="<%=ad2 %>"
                        required
                    />
                </div>
                </div>
            
            
            
            <div id="userUpdate_btn">
            <button type="submit" id="userUpdate_btn" style="width: 150px;">회원정보 수정</button>&nbsp;&nbsp;
            <button type="submit" id="delete_btn" style="width: 150px;">회원정보 삭제</button>
<%--             <a href="<%=request.getContextPath() %>/addelete.us?uno=<%=amu.getUserNo() %>" class="btn btn-primary" id="delete-btn" style="background-color: #fafafa; border:1px solid #dddddd; color: black;">회원정보 삭제</a> --%>
            
            </div>
        </form>
    </div>
    <%@ include file="/views/common/footerBar.jsp" %>
    
    <script>
    
	    $(function(){
	    	
	    	$("#userUpdate_btn>#delete_btn").click(function(){
	    		const userId = "<%= aaa.getUserId() %>";
	    		const userNo = "<%=request.getAttribute("uno")%>";
	    		const status = "<%=aaa.getStatus()%>";
	    		const confirmResult = confirm(userId + "회원을 삭제하시겠습니까?");
	    		
	    		if (confirmResult) {
	                // 예를 선택한 경우, 회원정보 삭제를 수행하는 URL로 이동
	                const deleteUrl = "<%= request.getContextPath() %>/addelete.us?uno="+userNo + "&status=" + status;
	                window.location.href = deleteUrl;
	            } else {
	            	const listUrl = "<%= request.getContextPath() %>/adlist.us";
	                window.location.href = listUrl;
	            }
	    	})
	    });
    
    
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
    
    
    
    
</body>
</html>