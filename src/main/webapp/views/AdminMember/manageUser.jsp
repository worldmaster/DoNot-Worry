<%@ page import = "java.util.ArrayList, com.kh.AdminMember.model.vo.AdminManageUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<AdminManageUser> list = (ArrayList<AdminManageUser>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.table-bordered th, td, tr{
            border: 1px solid #dddddd;
            border-collapse : collapse;
            margin:auto;
            height: 50px;
            text-align: center;
        }
	
	  .table-bordered button{
            border-radius :4px;
            border: 1px solid lightgray;
            background-color: lightgray;
            background-color: rgba( 255, 255, 255, 0.4 );
            color: black;
            height: 35px; 
            
            background-color: #fafafa;
        	border-radius: 4px;
        	border: 1px solid #dddddd;
        	height: 35px;
        }
        
        .table-bordered button>a{
        	color: black;
        	text-decoration: none;
        }
        
        
</style>
</head>
<body>

	<%@ include file="/views/common/menubar2.jsp" %>
	
		<div class="content">
        <br><br><br>
        <!-- <div id="member-manage"> -->
            <table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd">
            <thead>
            	<tr>
        			<th colspan="8" style="text-align: center"><h4>회원관리</h4></th>
        		</tr>
        		<tr>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"><h5>회원번호</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"><h5>아이디</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"><h5>이름</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"><h5>전화번호</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"><h5>생년월일</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:230px;"><h5>주소</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"><h5>회원상태</h5></th>
	                <th style="background-color : #fafafa; color:#000000; width:130px;"></th>
                </tr>
                </thead>
                <tbody>
               
                <% if(list.isEmpty()){ %>
					<tr>
						<td colspan="8">조회된 사용자가 없습니다</td>
					</tr>                
                <%} else{%>
                	<%for(AdminManageUser amu : list){ %>
                		<tr>
                			<td><%=amu.getUserNo() %></td>
                			<td><%=amu.getUserId() %></td>
                			<td><%=amu.getUserName() %></td>
                			<td><%=amu.getPhone() %></td>
                			<td><%=amu.getbDay() %></td>
                			<td><%=amu.getAddress() %></td>
                			<td><%=amu.getStatus() %></td>
                			<td><button class="btn-update">회원수정/삭제</button></td>
                		</tr>
                	<%} %>
                <%} %>
                <tr></tr>
                </tbody>
            </table>
        </div>
	<%@ include file="/views/common/footerBar.jsp" %>
	
	<script>
		$(function(){
			$(".btn-update").click(function() {
				const status = $(this).closest("tr").find("td:nth-child(7)").text(); 
			    const uno = $(this).closest("tr").find("td:first-child").text();
			    const url = "<%= request.getContextPath() %>/adupdate.us?uno=" + uno+ "&status=" + status;
			    location.href = url;
			  });
		});
	</script>
</body>
</html>