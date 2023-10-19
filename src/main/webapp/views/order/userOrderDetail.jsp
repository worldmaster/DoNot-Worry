<%@ page import="java.util.ArrayList, com.kh.orderMyPage.model.vo.OrderProductMyPage, com.kh.orderMyPage.model.vo.OrderMyPage, java.sql.Date,
             com.kh.orderMyPage.model.vo.StoreMyPage, com.kh.member.model.vo.Member, com.kh.orderMyPage.model.vo.Delivery" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   ArrayList<OrderProductMyPage> list = (ArrayList<OrderProductMyPage>) request.getAttribute("list");
   OrderMyPage o = (OrderMyPage)request.getAttribute("o");
   StoreMyPage st =(StoreMyPage)request.getAttribute("st");
   Member m = (Member)request.getAttribute("m");
   Delivery d = (Delivery)request.getAttribute("d");
   int priceSum = 0;


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
            height: 600px;
            /*컨텐츠 영역 사이즈*/
            width: 1400px;
            /*바꾸면 안 됨*/
            margin: auto;
        }

        .order_product{
            width: 1200px;
            margin: auto;
            /* background-color: #98fe86; */
            background-color: rgb(228, 238, 207);
        }

        

        .order_info{
            margin: auto;
            margin-top: 20px;
            width: 1200px;
            display: flex;
            justify-content: space-between;
        }

        .order_box{
            margin: 0px 0px;
            /* background-color: #98fe86; */
            background-color: rgb(228, 238, 207);
            width: 590px;
        }

        .order_tb{
            border-collapse: collapse;
            border-top: 1px solid black;
            width: 100%;
        }

        .order_tb th {
            border-bottom: 1px solid rgb(187, 180, 180);
            text-align: center;
        }
        
        .order_tb td {
            border-bottom: 1px solid rgb(187, 180, 180);
        }


        .btn_box{
            width: 800px;
            margin: auto;
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
            
        }
        
        .btn_box input{
            background-color: #98fe86;
            /* background-color: rgb(176, 230, 216); */
            font-size: 25px;
            width: 200px;
            height: 50px;
            border-radius: 50px;
        }

        .btn_box input:hover{
            cursor: pointer;
        }

        .w150{
            width: 150px;
        }
        
        #list-img{
           width : 100px;
           height : 100px;
        }
</style>
</head>
<body>
 <%@ include file="/views/common/menubar.jsp" %>

<div class="content">
        <div class="order_product">
            
            <p>주문상품</p>
            <table class="order_tb" style="margin: auto;">
                <thead>
                    <tr>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>상품금액</th>
                        <th>결제금액</th>
                    </tr>
                </thead>
                <tbody>
                   <% if(list.isEmpty()) { %>
               <tr>
                  <td colspan="5">조회된 리스트가 없습니다.</td>
               </tr>
            <% } else { %>
               <% for(OrderProductMyPage op : list) { %>
                  <tr>
                     <td><img src="<%= op.getUpLoadDir()%>" id="list-img"> </td>
                     <td><%= op.getProductName() %></td>
                     <td><%= op.getProductQcy() %></td>                     
                     <td><%= op.getProductPrice() %></td>
                     <td><%= op.getAmountPayment() %></td>
                     <% priceSum += op.getAmountPayment(); %>
                  </tr>
               <% } %>
            <% } %>
                    
                    
                </tbody>
            </table>
        </div>
        <div class="order_info">

            <div class="order_box">
                <p>결제상세정보</p>
                <table class="order_tb">
                    <colgroup>
                        <col class="w150">
                        <col class="tb_c2">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>총주문금액</th>
                            <td><%= priceSum+5000 %></td>
                        </tr>
                        <tr>
                            <th>총상품금액</th>
                            <td><%= priceSum %></td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>5000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="order_box">
                <p>주문상세정보</p>
                <table class="order_tb">
                    <colgroup>
                        <col class="w150">
                        <col class="tb_c2">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>주문번호</th>
                            <td><%= o.getOrederNo() %></td>
                        </tr>
                        <tr>
                            <th>주문일시</th>
                            <td><%= o.getOrderDate() %></td>
                        </tr>
                        <tr>
                            <th>주문지점</th>
                            <td><%= st.getStName() %></td>
                        </tr>
                        <tr>
                            <th>결제방법</th>
                            <td><%= o.getOrderWay() %></td>
                        </tr>
                        
                    </tbody>
                </table>
                
            </div>
        </div>
        <div class="order_info">
            <div class="order_box">
                <p>주문자 상세정보</p>
                <table class="order_tb">
                    <colgroup>
                        <col class="w150">
                        <col class="tb_c2">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>이름</th>
                            <td><%= m.getUserName() %></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%= m.getPhone() %></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><%= m.getAddress() %></td>
                        </tr>
                        
                        <%-- <% if( loginUser.getUserNo == 1) { %>
                        <tr>
                           <th>취소신청</th>
                           <td></td>
                        </tr>
                        <%} %> --%>
                    </tbody>
                </table>
    
            </div>
            <div class="order_box">
                <p>배송 상세정보</p>
                <table class="order_tb">
                    <colgroup>
                        <col class="w150">
                        <col class="tb_c2">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>받으시는 분</th>
                            <td><%= d.getReceiverName() %></td>
                        </tr>
                        <tr>
                            <th>휴대폰 번호</th>
                            <td><%= d.getReceiverPhone() %></td>
                        </tr>
                        <tr>
                            <th>배송지</th>
                            <td><%= d.getReceiverAddress() %></td>
                        </tr>
                        <tr>
                            <th>배송 메세지</th>
                            <td><%= d.getMSG() %></td>
                        </tr>
                        <tr>
                            <th>배송상황</th>
                            <% if(d.getDeliveryStatus().equals("Y")){ %>
                            <td> 배송중 </td>
                            <%} else if(d.getDeliveryStatus().equals("N")){ %>
                            <td> 배송중 </td>
                            <%} %>
                        </tr>
                    </tbody>
                </table>
    
            </div>
            
        </div>
        
        <div class="btn_box">
            <input id="btn_list" type="button" onclick="goBack();" value="뒤로가기">
            <% if( loginUser.getUserNo() ==1){ %>
            <input id="admin_btn_cancel" type="button" value="결제취소">
            <%}else{ %>
            <input id="btn_cancel" type="button" value="결제취소 신청">
            <%} %>
        </div>

    </div>

    <script>
        
       

        $(function(){
         $("#admin_btn_cancel").click(function(){
            var question = window.confirm('결제취소 하시겠습니까?');
            if(question){
            
            
            $.ajax({
               url  : "cancelrq.od",
               data : { 
                  userNo : <%= loginUser.getUserNo()%>,
                  ono : <%= o.getOrederNo() %>
               },
               type : "get",
               success : function(result){ // 요청 성공시 실행할 콜백함수 정의
                  // result : 서블릿으로부터 전달받은 값(xhr.responseText와 동일)
                  alert('결제취소')
                  location.href = "<%=contextPath%>/list.od?uno=<%=loginUser.getUserNo()%>";
               },
               error : function(){
                  alert('오류 결제취소 실패')
               }
            })
            
             
            
            }else{
               alert('취소되었습니다.');
            }
            
            
         });
      });
        
        
        $(function(){
         $("#btn_cancel").click(function(){
            var question = window.confirm('결제취소 신청하시겠습니까?');
            if(question){
            
            
            $.ajax({
               url  : "cancelrq.od",
               data : { 
                  userNo : <%= loginUser.getUserNo()%>,
                  ono : <%= o.getOrederNo() %>
               },
               type : "get",
               success : function(result){ // 요청 성공시 실행할 콜백함수 정의
                  // result : 서블릿으로부터 전달받은 값(xhr.responseText와 동일)
                  alert('결제취소신청완료')
                  location.href = "<%=contextPath%>/list.od?uno=<%=
                  loginUser.getUserNo()%>";
               },
               error : function(){
                  alert('오류 결제취소신청 실패')
               }
            })
            
             
            
            }else{
               alert('취소되었습니다.');
            }
            
            
         });
      });
        
        function goBack() {
          history.back();
        }
        
    </script>
 
 <%@ include file="/views/common/footerBar.jsp" %>
</body>
</html>