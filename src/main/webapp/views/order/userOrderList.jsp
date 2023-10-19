<%@ page import="java.util.ArrayList, com.kh.orderMyPage.model.vo.OrderListMyPage, com.kh.common.model.vo.PageInfo1" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo1 pi = (PageInfo1) request.getAttribute("pi");
	ArrayList<OrderListMyPage> list = (ArrayList<OrderListMyPage>) request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage   = pi.getStartPage();
	int endPage     = pi.getEndPage();
	int maxPage     = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
   .content {
       height: 700px;
       /*컨텐츠 영역 사이즈*/
       width: 1400px;
       /*바꾸면 안 됨*/
       margin: auto;
   }

   .contact_tb{
       /* border: 1px solid black; */
       text-align: center;
       margin: auto;
       border-collapse: collapse;
   }
   
   .contact_tb th{
		text-align: center;
   }

   
   
   .contact_tb tr{
       height: 50px;
       border-bottom: 1px solid black;
   }

   .content>p{
       font-weight: 600;
       font-size: 20px;
   }

   .contact_tb>tbody>tr:hover{
       background-color: white;
       background-color: rgba( 255, 255, 255, 0.4 );
       cursor: pointer;
      }
      
</style>
</head>
<body>

 <%@ include file="/views/common/menubar.jsp" %>
 
	<div class="content">
        <br><br>
        <p>나의 결제내역</p>
        <table class="contact_tb">
            <thead>
                <tr>
                    <th width="100">주문날짜</th>
                    <th width="100">주문지점</th>
                    <th width="250">선택한 상품</th>
                    <th width="200">주문번호</th>
                    <th width="200">배송상황</th>
                </tr>
            </thead>
            <tbody>
            <tbody>
				<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="5">조회된 리스트가 없습니다.</td>
					</tr>
				<% } else { %>
					<% for(OrderListMyPage ol : list) { %>
						<tr>
							<td><%= ol.getOrderDate() %></td>
							<td><%= ol.getStName() %></td>
							<td><%= ol.getProductName() %></td>							
							<td><%= ol.getOrderNo() %></td>
							<%if(ol.getOrderCancel().equals("Y")){ %>
							<td><%= ol.getDeliveryStatus() %><b>[결제취소신청]</b></td>
							<%}else if(ol.getOrderCancel().equals("N")){ %>
							<td><%= ol.getDeliveryStatus() %></td>
							<%} %>
						</tr>
					<% } %>
				<% } %>
				
				
                <!-- <tr class="order_tr">
                    <td>2023.05.22</td>
                    <td>강남점</td>
                    <td>플레인도넛,초코도넛,민초..</td>
                    <td>202305222345</td>
                    <td>배송중</td>
                </tr>
                <tr class="order_tr">
                    <td>2023.05.22</td>
                    <td>강남점</td>
                    <td>플레인도넛,초코도넛,민초..</td>
                    <td>202305222345</td>
                    <td>배송완료</td>
                </tr>
                <tr class="order_tr">
                    <td>2023.05.22</td>
                    <td>강남점</td>
                    <td>플레인도넛,초코도넛,민초..</td>
                    <td>202305222345</td>
                    <td>배송완료</td>
                </tr>
                <tr class="order_tr">
                    <td>2023.05.22</td>
                    <td>강남점</td>
                    <td>플레인도넛,초코도넛,민초..</td>
                    <td>202305222345</td>
                    <td>배송완료</td>
                </tr> -->
            </tbody>
        </table>
        
        <br><br>
		
		<!--  페이징바  -->
		<div align="center" class="paging-area">
			<% if(currentPage != 1) { %>
				<button onclick="location.href= '<%=contextPath %>/list.od?uno=<%=loginUser.getUserNo()%>&currentPage=<%= currentPage -1 %>' " >&lt;</button>
			<% } %>
			
			<% for(int p = startPage; p<= endPage; p++){ %>
			
				<% if(p != currentPage) {%>
					<button onclick="location.href='<%=contextPath %>/list.od?uno=<%=loginUser.getUserNo()%>&currentPage=<%=p %>'" ><%= p %></button>
				<% } else { %>
					<!-- 현재 내가 보고있는 페이지일 경우 클릭이 안되게끔  -->
					<button disabled><%= p %></button>
				<% } %>
				
			<% } %>
			<!-- <button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>6</button>
			<button>7</button>
			<button>8</button>
			<button>9</button>
			<button>10</button> -->
			
			<% if(currentPage != maxPage) { %>
				<button onclick="location.href = '<%=contextPath %>/list.od?currentPage=<%= currentPage+1 %>'">&gt;</button>
			<% } %>
			
		</div>
        
        
        
	</div>
	
	<script>
		$(function(){
			$(".contact_tb>tbody>tr").click(function(){
				location.href="<%= contextPath %>/detail.od?ono="+$(this).children().eq(3).text();
			})
		});
	</script>
	
	
	
	
	
	
	
	
	
	

 <%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>