<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter, com.kh.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% 
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd-HHmmssSSS");
	String formattedDateTime = LocalDateTime.now().format(formatter);
	long orderNo = Long.parseLong(formattedDateTime.replace("-", "").replaceAll("\\s+", ""));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>

body {
	background-color: #fdfee5;
	box-sizing: border-box;
	text-align: center;
	width: 1500px;
}

body div {
	box-sizing: border-box;
}

.territory {
	border: 1px solid red;
	width: 1400px;
	margin: auto;
}

/*===============컨텐츠*/
.wrap {
	width: 1400px;
	margin: auto;
	border: 1px solid blue;
}

.wrap div {
	border: 1px solid green;
}

/*타이틀*/
.title {
	height: 150px;
	line-height: 150px;
	margin-top: 100px;
}

.title>h3 {
	text-align: center;
}

.wrap2>form {
	margin-bottom: 200px;
}

.wrap2 h3 {
	color: #1e7304;
	padding-left: 100px;
}

/*결제 정보*/
.order-info {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 100px;
	color: black;
}

.order-info tr {
	border-bottom: 2px solid #98fe86;
}

.order-info th {
	width: 15%;
	height: 70px;
	text-align: left;
	padding-left: 100px;
}

.order-info td {
	width: 85%;
	text-align: start;
}

.order-info input {
	text-align: center;
	line-height: 50px;
	padding-left: 10px;
	box-sizing: border-box;
	border: 3px solid #98fe86;
	border-radius: 20px;
	text-align: center;
	color: #1e7304;
	font-size: 15px;
	width: 400px;
	height: 50px;
}

.order-info input[type="tel"] {
	width: 121.5px;
}

.addressinput {
	height: 100%;
}

.addressinput>div {
	width: 70%;
	display: inline-flex;
	height: 50%;
	justify-content: space-between;
	align-items: center;
}

.addressinput button {
	display: block;
	width: 400px;
	height: 50px;
	border-radius: 500px;
	border: none;
	background-color: #98fe86;
	color: #1e7304;
	font-size: 18px;
	font-weight: 600;
	margin: 0;
}

.addressinput button:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
	cursor: pointer;
}

/*숨겨진 팝업 배송정보 입력div*/
.order-info-pop {
	background-color: lightgray;
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 100px;
	color: black;
}

.order-info-pop tr {
	border-bottom: 2px solid #98fe86;
}

.order-info-pop th {
	width: 15%;
	height: 70px;
	text-align: left;
	padding-left: 100px;
}

.order-info-pop td {
	width: 85%;
	text-align: start;
}

.order-info-pop input {
	text-align: center;
	line-height: 50px;
	padding-left: 10px;
	box-sizing: border-box;
	border: 3px solid #98fe86;
	border-radius: 20px;
	text-align: center;
	color: #1e7304;
	font-size: 15px;
	width: 400px;
	height: 50px;
}

.order-info-pop input[type="tel"] {
	width: 121.5px;
}

.order-info-pop button {
	text-align: center;
	line-height: 50px;
	padding-left: 10px;
	box-sizing: border-box;
	border: none;
	border-radius: 20px;
	text-align: center;
	color: #1e7304;
	font-size: 15px;
	width: 100px;
	height: 50px;
	background: #98fe86;
	margin: 0 25px 0 25px;
	font-weight: 600;
}

.order-info-pop button:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
	cursor: pointer;
}

/*결제 상품*/
.order-product {
	width: 100%;
	margin-bottom: 100px;
}

.order-product tr {
	border-bottom: 3px solid #98fe86;
}

.order-product th {
	height: 40px;
	text-align: center;
}

.order-product td {
	padding: 20px 0 20px 0;
}

.order-product1 {
	width: 25%;
}

.order-product2 {
	width: 22.5%;
}

.order-product3 {
	width: 15%;
}

.order-product img {
	width: 150px;
	height: 150px;
	border: 2px solid #98fe86;
	border-radius: 500px;
}

/*결제 예정 금액*/
.order-price {
	margin-bottom: 100px;
	width: 100%;
}

.order-price {
	text-align: center;
}

.order-price>tbody {
	width: 100%;
}

.order-price-flex {
	height: 100px;
	display: flex;
	width: 80%;
	justify-content: space-around;
	margin: auto;
	align-items: center;
	font-size: 18px;
	font-weight: 600;
	letter-spacing: 2px;
	margin-bottom: 50px;
}

.order-price-flex>div {
	display: table-cell;
	vertical-align: middle;
}

.order-price-flex>div>div {
	box-sizing: border-box;
	height: 40px;
}
/*결제 수단*/
.order-way {
	margin: 0 100px 100px 100px;
	display: flex;
	justify-content: space-evenly;
	font-size: 20px;
}

.order-way>div {
	box-sizing: border-box;
	line-height: 50px;
}

.order-way button {
	width: 200px;
	height: 50px;
	border: none;
	background-color: #98fe86;
	border-radius: 500px;
	font-size: 20px;
	font-weight: 600;
	color: #1e7304;
}

/*결제버튼*/
#order {
	width: 400px;
	height: 70px;
	border: none;
	background-color: #98fe86;
	border-radius: 500px;
	font-size: 30px;
	font-weight: 600;
	color: #1e7304;
}

/*버튼 호버 이벤트*/
.order-way button:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
	cursor: pointer;
}

#order:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
	cursor: pointer;
}
</style>


</head>
<title>결제 화면</title>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
	
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>


<script>

<%-- function requestPay(){
	let receiverPhone1 = document.querySelector('input[name="receiverphone1"]').value;
	let receiverPhone2 = document.querySelector('input[name="receiverphone2"]').value;
	let receiverPhone3 = document.querySelector('input[name="receiverphone3"]').value;

	let phoneNumber = receiverPhone1 + "-" + receiverPhone2 + "-" + receiverPhone3;
	
	
	let postcode = document.querySelector('input[name="postcode"]').value;
	let address = document.querySelector('input[name="address"]').value;
	let detailaddress = document.querySelector('input[name="detailaddress"]').value;

	let allAddress = postcode + "," + address + "," + detailaddress;
	
	  let orderProduct = [];
	 /*  let productAmountOrder = ""; */
	  let storeIdOrder = localStorage.getItem("storeIdOrder");
	  let orderInfos ={
			  "orderNo" : <%=orderNo%>,
		   "orderWay" : "kakaopay"
		   };
	 
	  
	  /* let orderDate = "";
	  let orderWay = ""; */
	  let receiveInfos = {
			  "recName": $("#receivername").val(),
			  "recPhone": phoneNumber,
			  "recAddress": allAddress,
			  "msg": $("msg").val(),
			  "delDate": localStorage.getItem("dateOrder")
			};
	  
	  /* let receiverPhone = "";
	  let receiverAddress = "";
	  let msg = "";
	  let receiveDate = ""; */
	
	
	  let orders = productOrderInfoMethod();
	  let price = 0;
	  let count = 0;
	  let name = "";
	  
	  orders.forEach(function(order){
		  price += parseInt((order.productPriceOrder).replace(/[^0-9]/g, "")*order.productAmountOrder);
		  count ++;
		  name = (count===1?order.productNameOrder:order.productNameOrder+"그 외 " +  (count-1) + "건");
		  let product = {
				  productNo : order.productNoOrder,
				  productAmount : order.productAmountOrder
		  };
		  orderProduct.push(product);
		  
	  });
	  
      console.log("orderProduct : ", orderProduct);
	  console.log("storeIdOrder : ", storeIdOrder);
	  console.log("orderInfos : ", orderInfos);
	  console.log("receiveInfos : ", receiveInfos);
	  
	  $.ajax({
          url: "<%= contextPath%>/orderend.do",
          traditional: true,
          method: "POST",
          dataType : "JSON",
          data: {
              "totalPrice" : price,
              "orderProduct" : JSON.stringify(orderProduct),
              "storeIdOrder" : storeIdOrder,
              "orderInfos" : JSON.stringify(orderInfos),
              "receiveInfos" : JSON.stringify(receiveInfos),
              "userNo" : <%=loginUser.getUserNo()%>
          },
          success: function(result) {
        	  if(result>0){
                  alert("결제에 성공했습니다.");
        		  location.href = "<%=contextPath%>/paylist.do";
        	  }
          },
          error: function(result) {
              alert("오류 발생");
          }
      });
	
}
 --%>












IMP.init("imp70031054");
function requestPay() {
	
	let receiverPhone1 = document.querySelector('input[name="receiverphone1"]').value;
	let receiverPhone2 = document.querySelector('input[name="receiverphone2"]').value;
	let receiverPhone3 = document.querySelector('input[name="receiverphone3"]').value;

	let phoneNumber = receiverPhone1 + "-" + receiverPhone2 + "-" + receiverPhone3;
	
	
	let postcode = document.querySelector('input[name="postcode"]').value;
	let address = document.querySelector('input[name="address"]').value;
	let detailaddress = document.querySelector('input[name="detailaddress"]').value;

	let allAddress = postcode + "," + address + "," + detailaddress;
	
	  let orderProduct = [];
	 /*  let productAmountOrder = ""; */
	  let storeIdOrder = localStorage.getItem("storeIdOrder");
	  let orderInfos ={
			  "orderNo" : <%=orderNo%>,
		   "orderWay" : "kakaopay"
		   };
	 
	  
	  /* let orderDate = "";
	  let orderWay = ""; */
	  let receiveInfos = {
			  "recName": $("#receivername").val(),
			  "recPhone": phoneNumber,
			  "recAddress": allAddress,
			  "msg": $("msg").val(),
			  "delDate": localStorage.getItem("dateOrder")
			};
	  
	  /* let receiverPhone = "";
	  let receiverAddress = "";
	  let msg = "";
	  let receiveDate = ""; */
	
	
	  let orders = productOrderInfoMethod();
	  let price = 0;
	  let count = 0;
	  let name = "";
	  
	  orders.forEach(function(order){
		  price += parseInt((order.productPriceOrder).replace(/[^0-9]/g, "")*order.productAmountOrder);
		  count ++;
		  name = (count===1?order.productNameOrder:order.productNameOrder+"그 외 " +  (count-1) + "건");
		  let product = {
				  productNo : order.productNoOrder,
				  productAmount : order.productAmountOrder
		  };
		  orderProduct.push(product);
		  
	  });
	  
      console.log("orderProduct : ", orderProduct);
	  console.log("storeIdOrder : ", storeIdOrder);
	  console.log("orderInfos : ", orderInfos);
	  console.log("receiveInfos : ", receiveInfos);
	  
  	IMP.request_pay({
	      pg:"kakaopay",
	      pay_method: "card",
	      merchant_uid: "<%=orderNo%>",   
	      name: name,
	      amount: price,                         // 숫자 타입
	      buyer_email: "gildong@gmail.com",
	      buyer_name: "<%=loginUser.getUserName()%>",
	      buyer_tel: "<%=loginUser.getPhone()%>",
	      buyer_addr: "<%=loginUser.getAddress().split(",")[1] + loginUser.getAddress().split(",")[2]%>",
	      buyer_postcode: "<%=loginUser.getAddress().split(",")[0]%>"
	    }, function (rsp) { // callback
	      if(rsp.success){
	    	  $.ajax({
          url: "<%= contextPath%>/orderend.do",
          traditional: true,
          method: "POST",
          dataType : "JSON",
          data: {
              "totalPrice" : price,
              "orderProduct" : JSON.stringify(orderProduct),
              "storeIdOrder" : storeIdOrder,
              "orderInfos" : JSON.stringify(orderInfos),
              "receiveInfos" : JSON.stringify(receiveInfos),
              "userNo" : <%=loginUser.getUserNo()%>
          },
          success: function(result) {
        	  if(result>0){
                  alert("결제에 성공했습니다.");
        		  location.href = "<%=contextPath%>/paylist.do";
        	  }
          },
          error: function(result) {
              alert("오류 발생");
          }
      });
	      }else{
              alert("결제에 실패했습니다. : " +  rsp.error_msg);
              location.href = "<%=contextPath%>/cart.do";
	      }
	    }); 
  	
		
}


	function orderInfo(){
		$.ajax({
			url : "orderInfo.do",
			data: {
				
			},
			success : function(list){
				let result = "";
				console.log(list)
				for(let reply of list){
					console.log(reply);
					result += "<tr>"
							+ "<td>" + reply.boardWriter + "</td>"
							+ "<td>" + reply.replyContent + "</td>"
							+ "<td>" + reply.createDate + "</td>"
							+ "</tr>"
				}
				$("#reply-area tbody").html(result);
			}
		});
	} 




</script>
	<% 
		String[] phone = loginUser.getPhone().split("-");
	
		String phone1 = phone[0];
		String phone2 = phone[1];
		String phone3 = phone[2];
		
		String address1 = "";
		String address2 = "";
		String address3 = "";
		if(loginUser.getAddress().contains(",")){
			String[] address = loginUser.getAddress().split(",");
			
			address1 = address[0];
			address2 = address[1];
			address3 = address[2];
		} else {
			address1 = loginUser.getAddress();
		}
		
	
	%>


	<!--컨텐츠-->
	<div class="wrap">
		<div class="territory wrap1">
			<!--결제-->
			<div class="title">
				<h2>결제</h2>
			</div>

			<div class="wrap2">
				<form action="<%=contextPath %>/buy.do" method="post">
					<table class="order-info">
						<tr>
							<h3 align="left">결제 정보</h3>
						</tr>
						<tr>
							<th>받으시는 분</th>
							<td><input type="text" id="receivername" name="receivername"
								value="<%=loginUser.getUserName() %>" required></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td id="receiverphone"><input type="tel" name="receiverphone1"
								value="<%=phone1 %>" minlength="3" maxlength="3" required>
								- <input type="tel" name="receiverphone2" value="<%=phone2 %>"
								minlength="4" maxlength="4" required> - <input
								type="tel" name="receiverphone3" value="<%=phone3 %>"
								minlength="4" maxlength="4" required></td>
						</tr>
						<tr>
							<th>배송지</th>
							<!--Daum우편번호 서비스 사용, 팝업으로 뜨게 -->
							<!--https://hgko1207.github.io/2019/01/18/javascript-postcode/ -->
							<td style="height: 150px;">
								<div class="addressinput" id="receiveraddress">
									<div>
										<input type="text" id="postcode" name="postcode"
											value="<%= address1 %>" placeholder="우편번호" readonly />
										<button type="button" onclick="execDaumPostcode()"
											style="display: none;">주소 찾기</button>
									</div>
									<div>
										<input type="text" id="address" name="address"
											value="<%=address2 %>" placeholder="도로명주소" readonly /> <input
											type="text" id="detailaddress" name="detailaddress"
											value="<%=address3 %>" placeholder="상세 주소" required />
									</div>

								</div>
							</td>
						</tr>
						<tr>
							<th>배송메시지</th>
							<td><input type="text" id="msg" name="msg" value="안전배송해주세요!"
								maxlength="50" required></td>
						</tr>
					</table>

					<%-- =============숨어있는 팝업창============== --%>
					<div class="order-info-pop" style="display: none;">
						<h2 align="center">결제 정보 수정창입니다.</h2>
						<br>
						<table>
							<tr>
								<h3 align="left">결제 정보</h3>
							</tr>
							<tr>
								<th>받으시는 분</th>
								<td><input type="text" id="receivername" name="receivername" value=""
									required></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="tel" name="receiverphone1" value=""
									minlength="3" maxlength="3" required> - <input
									type="tel" name="receiverphone2" value="" minlength="4"
									maxlength="4" required> - <input type="tel"
									name="receiverphone3" value="" minlength="4" maxlength="4"
									required></td>
							</tr>
							<tr>
								<th>배송지</th>
								<!--Daum우편번호 서비스 사용, 팝업으로 뜨게 -->
								<!--https://hgko1207.github.io/2019/01/18/javascript-postcode/ -->
								<td style="height: 150px;">
									<div class="addressinput">
										<div>
											<input type="text" id="postcode" name="postcode" value=""
												placeholder="우편번호" readonly />
											<button type="button" style="width: 400px; margin: 0;"
												onclick="execDaumPostcode()">주소 찾기</button>
										</div>
										<div>
											<input type="text" id="address" name="address" value=""
												placeholder="도로명주소" readonly /> <input type="text"
												id="detailaddress" name="detailaddress" value=""
												placeholder="상세 주소" required />
										</div>

									</div>
								</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td><input type="text" name="msg" value="" maxlength="50"
									required></td>
							</tr>
						</table>
						<br>
						<div>
							<button id="order-info-pop-cancle" type="button">수정 취소</button>
							<button id="order-info-pop-confirm" type="button">수정 완료</button>
						</div>
					</div>





					<table class="order-product">
						<thead>
							<tr>
								<h3 align="left">결제 상품</h3>
							</tr>
							<!--반복 돌려야됨-->
							<tr>
								<th class="order-product1"></th>
								<th class="order-product2">상품정보</th>
								<th class="order-product2">가격</th>
								<th class="order-product3">수량</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

					<table class="order-price">
						<thead>
							<tr>
								<h3 align="left">결제 예정 금액</h3>
							</tr>
						</thead>

						<tbody>

						</tbody>


					</table>
					<table>
							<input type="button" id="order" name="order" value="결제하기" onclick="requestPay();">
							
					</table>
				</form>
			</div>



		</div>


	</div>



	<%@ include file="/views/common/footerBar.jsp"%>


	<script>
	
	function productOrderInfoMethod(){
		let orderItems = [];
		let keys = Object.keys(localStorage);
		
		keys.forEach(function(key){
			if(key.indexOf("productNameOrder_")===0){
				let productNoOrder = key.split('_')[1];
				let productNameOrder = localStorage.getItem('productNameOrder_'+productNoOrder);
				let productPriceOrder = localStorage.getItem('productPriceOrder_'+productNoOrder);
				let productImgOrder = localStorage.getItem('productImgOrder_'+productNoOrder);
				let productAmountOrder = localStorage.getItem('productAmountOrder_'+productNoOrder);
				
				let orderItem = {
					productNoOrder: productNoOrder,
					productNameOrder: productNameOrder,
					productPriceOrder: productPriceOrder,
					productImgOrder: productImgOrder,
					productAmountOrder: productAmountOrder,
				};
				orderItems.push(orderItem);
			};
		});
		
		return orderItems;
	};
	
	
	
	
	
	
		$(function(){
			$(document).ready(function(){
				let str = "";
				
				let str2 ="";
				let priceTotal = 0;
				let orderItems = productOrderInfoMethod();
				
				orderItems.forEach(function(item){
					
					priceTotal += parseInt((item.productPriceOrder).replace(/[^0-9]/g, "")*item.productAmountOrder);
					
					str += "<td>"
	               		+ `<img src='<%=request.getContextPath()%>/` + item.productImgOrder + `'>`
						+ "</td>"
						+ "<td>"
						+ item.productNameOrder
						+ "</td>" + "<td>"
						+ item.productPriceOrder
						+ "</td>" + "<td>"
						+ item.productAmountOrder
						+ "</td>" + "</tr>";

				});

					document.querySelector(".order-product>tbody").innerHTML = str;
	
					str2 = "<tr>"
							+ "<div class='order-price-flex'>"
							+ "<div>" + "<div>총 주문 금액</div>"
							+ "<div>" + priceTotal.toLocaleString()
							+ "원 </div>" + "</div>"
							+ "<div>+</div>" + "<div>"
							+ "<div>배송비</div>"
							+ "<div>5,000원</div>" + "</div>"
							+ "<div>=</div>" + "<div>"
							+ "<div>총 결제 금액</div>" + "<div>"
							+ (priceTotal + 5000).toLocaleString()
							+ "원 </div>" + "</div>" + "</div>"
							+ "</tr>";
	
					document.querySelector(".order-price>tbody").innerHTML = str2;
	
				
			
				let keys = localStorage.key;
				console.log(keys);
			
			
			});
		});

		
		
		
		
		
		
		$(".order-info").click(function() {
			let confirmPop = confirm("수정하시겠습니까?");

			if (confirmPop) {
				$(".order-info-pop").css({
					"display" : "inline-block",
					"position" : "relative",
					"top" : "-520px",
					"margin-bottom" : "-500px",
					"padding" : "100px 0 100px 0"
				});
			} else {
				event.preventDefault();
			}

		});
		
		
		
		
		

		$("#order-info-pop-cancle").click(function() {
			$(".order-info-pop").css("display", "none");
		});
		
		
		
		
		

		$("#order-info-pop-confirm").click(
			function() {
				let $name = $('.order-info-pop input[name="receivername"]')
						.val();
	
				let $phone1 = $(
						'.order-info-pop input[name="receiverphone1"]')
						.val();
				let $phone2 = $(
						'.order-info-pop input[name="receiverphone2"]')
						.val();
				let $phone3 = $(
						'.order-info-pop input[name="receiverphone3"]')
						.val();
	
				let $postcode = $('.order-info-pop input[name="postcode"]')
						.val();
				let $address = $('.order-info-pop input[name="address"]')
						.val();
				let $detailaddress = $(
						'.order-info-pop input[name="detailaddress"]')
						.val();
	
				let $msg = $('.order-info-pop input[name="msg"]').val();
	
				$('.order-info input[name="receivername"]').val($name);
	
				$('.order-info input[name="receiverphone1"]').val($phone1);
				$('.order-info input[name="receiverphone2"]').val($phone2);
				$('.order-info input[name="receiverphone3"]').val($phone3);
	
				$('.order-info input[name="postcode"]').val($postcode);
				$('.order-info input[name="address"]').val($address);
				$('.order-info input[name="detailaddress"]').val(
						$detailaddress);
	
				$('.order-info input[name="msg"]').val($msg);
	
				$(".order-info-pop").css("display", "none");

		});

				
				
				
				
				
		function execDaumPostcode() {

			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
						$('.order-info-pop input[name="postcode"]').val(
								data.zonecode);
						$('.order-info-pop input[name="address"]').val(
								data.roadAddress);
					}
				}).open();
			});
		};
		
		
		
		  
		  
		
	</script>

</body>
</html>