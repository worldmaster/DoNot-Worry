<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member"%>
<%
	String userNa = ((Member)session.getAttribute("loginUser")).getUserName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=userNa%>님의 장바구니</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
	/* border: 1px solid red; */
	width: 1400px;
	margin: auto;
}

/*===============컨텐츠*/
.wrap {
	width: 1400px;
	margin: auto;
	/* border: 1px solid blue; */
}

.wrap div {
	/* border: 1px solid green; */
	
}

.wrap1 {
	width: 100%;
}

.wrap1 div {
	padding-top: 50px;
}
/*타이틀*/
.title {
	width: 100%;
	display: flex;
	justify-content: center;
	margin: 50px 0 0 0
}

.title #arrow {
	width: 20px
}

.title .arrow-appear {
	font-size: 30px;
	font-weight: 600;
	color: #1e7304;
}

.title td>.colored {
	box-sizing: border-box;
	padding: 0;
	padding-top: 10px;
	width: 60px;
	height: 60px;
	border-radius: 450px;
	background-color: #98fe86;
	color: #1e7304;
	font-size: 15px;
	font-weight: 600;
}

.title #main {
	padding: 0;
	width: 150px;
	height: 150px;
	font-size: 25px;
	font-weight: 600;
	line-height: 150px;
}
/*공지*/
.notice {
	width: 100%;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.notice table {
	width: 80%;
	height: 100px;
	text-align: start;
	border: 8px solid #98fe86;
	border-radius: 50px;
	padding-left: 100px;
	color: #1e7304;
	font-size: 17px;
	font-weight: 600;
	opacity: 0;
}

.notice img {
	width: 200px;
}

.notice p {
	padding-left: 50px;
}
/*장바구니 현황*/
.wrap2 {
	width: 100%;
}

.wrap2 table {
	box-sizing: border-box;
	margin: 50px 0 0 0;
	padding: 15px 0 40px 0;
	width: 100%;
	align: center;
	/* border: 3px solid #1e7304; */
}

.wrap th {
	color: #1e7304;
	font-weight: 600;
	text-align: center;
}

.wrap2 th, .wrap2 td {
	padding: 30px 0 30px 0;
	margin: auto;
}

.wrap2 img {
	width: 100px;
}
/*체크박스*/
.chk {
	display: block;
}

.chk1, .chk2 {
	appearance: none;
	cursor: pointer;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	outline: none;
	background: no-repeat center center;
	background-image:
		url("<%=request.getContextPath()%>/resources/img/chk01(real).png");
}

.chk_img {
	position: relative;
	width: 100px;
	height: 100px;
	z-index: 999;
}

.wrap2 img {
	display: inline-block;
	width: 50%;
	border-radius: 500px;
	margin: 0;
	border: 5px solid #98fe86;
}

/*수량 선택 버튼*/
.amount {
	display: block;
	box-sizing: border-box;
	width: 70px;
	height: 40px;
	margin: auto;
	padding: 0;
	border: 3px solid #98fe86;
	border-radius: 200px;
	text-align: center;
}

/*주문, 삭제 버튼 */
.cart-button {
	display: block;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 50px;
	background-color: #98fe86;
	width: 100px;
	height: 40px;
	line-height: 40px;
	padding: 0;
	margin: auto;
	margin-bottom: 15%;
	color: #1e7304;
	font-size: 15px;
	font-weight: 600;
	border: none;
}

.cart-button:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
}

/*하단 버튼 영역*/
.bottom-button {
	display: flex;
	justify-content: space-between;
	padding: 0 20px 0 20px;
	margin-top: 30px;
}

.bottom-button>button {
	display: block;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 50px;
	background-color: #98fe86;
	width: 150px;
	height: 30px;
	line-height: 35px;
	padding: 0;
	margin-bottom: 15px;
	font-size: 15px;
	font-weight: 600;
	color: #1e7304;
	line-height: 30px;
	border: none;
}

.bottom-button>a:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
}
/*최종 주문 버튼*/
.last-button {
	display: flex;
	justify-content: space-between;
	width: 35%;
	margin: auto;
	padding-left: 10px;
	margin-bottom: 100px;
	margin-top: 50px;
}

.last-button>button {
	display: block;
	box-sizing: border-box;
	border: none;
	border-radius: 50px;
	background-color: #98fe86;
	width: 200px;
	height: 50px;
	line-height: 50px;
	padding: 0;
	margin: 30px 0 0 10px;
	font-size: 20px;
	font-weight: 600;
	color: #1e7304;
	line-height: 30px;
}

.last-button>button:hover {
	background-color: #fdfee5;
	color: #98fe86;
	transition-duration: 300ms;
	cursor: pointer;
}
}
</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
	<!--컨텐츠-->
	<div class="wrap">
		<!--타이틀-->
		<div class="wrap1">
			<div class="title">
				<table>
					<tr>
						<td id="circle">
							<div></div>
						</td>
						<td id="arrow"></td>
						<td id="circle">
							<div></div>
						</td>
						<td id="arrow"></td>
						<td id="circle">
							<div id="main" class="colored">장바구니</div>
						</td>
						<td id="arrow" class="arrow-appear">></td>
						<td id="circle">
							<div class="colored">
								매장<br>설정
							</div>
						</td>
						<td id="arrow" class="arrow-appear">></td>
						<td id="circle">
							<div class="colored">
								날짜<br>설정
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="notice">
				<table>
					<tr>
						<td><img
							src="<%=request.getContextPath()%>/resources/img/microphone.png"
							style="margin-left: 50px;" alt="공지사항"></td>
						<td>
							<p>
								Donut Worry의 배송비는 5000원으로 모든 지역 동일합니다. <br> <br> 일주일
								이내로 배송 날짜를 지정하실 수 있습니다.<br> <br> 원하는 날짜에 맞추어
								배송해드립니다.<br> <br> 따로 여러번
								결제 시 배송비가 중복 결제됩니다.
							</p>
						</td>
					</tr>

				</table>
			</div>
		</div>



		<!--select-->
		<div class="wrap2">
			<form action="/store.do" method="post">
				<table id="item-table">
					<thead>
						<tr>
							<td colspan="7"
								style="padding: 0; margin: 0; border: none; height: 3px; background-color: #98fe86;"></td>
						</tr>
						<tr>
							<th style="width: 10%;"><label for="chkAll" class="chk">
									<input type="checkbox" id="chkAll" class="confirm chk1">
							</label></th>
							<th style="width: 25%;"></th>
							<th style="width: 25%;">상품정보</th>
							<th style="width: 10%;">가격</th>
							<th style="width: 10%;">수량</th>
							<th style="width: 10%;">배송비</th>
							<th style="width: 10%;">선택</th>
						</tr>

						<tr>
							<td colspan="7"
								style="padding: 0; margin: 0; border: none; height: 3px; background-color: #98fe86;"></td>
						</tr>
					</thead>



					<tbody>

					</tbody>

					<tr>
						<td colspan="7"
							style="padding: 0; margin: 0; border: none; height: 3px; background-color: #98fe86;"></td>
					</tr>

				</table>
				<div class="bottom-button">
					<button type="button" onclick="clearChk()">선택 상품 삭제</button>
					<button type="button" onclick="clearCart();">장바구니 비우기</button>
				</div>
				<div class="last-button">
					<button type="button" onclick="orderChk(this);">선택 상품 주문</button>
					<button type="button" onclick="orderAll();">전체 상품 주문</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="/views/common/footerBar.jsp"%>

	<script>
	
	<%-- ==================localStorage 연관 함수==================== --%>
		function getAllItemsFromLocalStorage() {
	 		  let allItems = [];
	
	 		  // 로컬 스토리지의 모든 키를 가져옴
	 		  let keys = Object.keys(localStorage);
	
	 		  // 각 키를 반복하면서 데이터 추출
	 		  keys.forEach(function(key) {
	 		    // 키 형식을 확인하여 상품 데이터인 경우만 처리
	 		    if (key.indexOf('productName_') === 0) {
	 		        let productNo = key.split('_')[1]; // 상품 번호 추출
	 		        let productName = localStorage.getItem('productName_' + productNo);
	 		        let productPrice = localStorage.getItem('productPrice_' + productNo);
	 		        let productImg = localStorage.getItem('productImg_' + productNo);
					let productAmount = localStorage.getItem('productAmount_' + productNo);
	 		      // 추출한 데이터를 객체로 저장
	 		      let item = {
	 		        productNo: productNo,
	 		        productName: productName,
	 		        productPrice: productPrice,
	 		        productImg: productImg,
	 		        productAmount: productAmount
	 		      };
	
	 		      allItems.push(item);
	 		    }
	 		  });
	
	 		  return allItems;
	 		}
		
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
		}
		
		
	   	
	   	window.onload = function() {
	   		  let allItems = getAllItemsFromLocalStorage();
	   		  // 가져온 데이터를 활용하여 작업 수행
	   		  let str = "";
	   		  let count = 0;
	   		  // 예: 콘솔에 상품 정보 출력
	   		  allItems.forEach(function(item, index) {
	   			  str +=  
	   				 "<tr id='"+ index +"' class='item-tr'>"
 			  		+"<td>"
   			  		+"<label for='chk2' class='chk'>"
   			  		+"<input type='checkbox' name='' id='chk2' value='' class='confirm chk2' data-productNo='" + item.productNo+"'>"
   			  		+"</label>"
   			  		+"</td>"
   			  		+"<td>"
   			  		+"<img src='<%=request.getContextPath()%>/" + item.productImg +  "'>"
   			  		+"</td>"
   			  		+"<td>" + item.productName +"</td>"
   			  		+"<td>" + item.productPrice +"</td>"
   			  		+"<td>" + "<input type='number' class='amount' id='amount' name='amount' value='" + item.productAmount + "' ' data-productNo='" + item.productNo+ "' value='1' min='1' max='20'>" +"</td>"
   			  		+(index === 0 ? ("<td rowspan='" + allItems.length + "' class='delivery-fee'>" + "5,000원" + "</td>") : "")
   		    		+"<td>"
   		    		+"<button class='cart-button' type='button' id='"+item.productNo+"' onclick='orderOne(this);'>주문하기</button>"
                     +"<button class='cart-button' type='button' id='"+item.productNo+"' onclick='clearOne(this);'>삭제</button>"
                     +"</td>"
                     +"</tr>";
                   
	   			console.log('ProductNo:', item.productNo);
	   		    console.log('ProductName:', item.productName);
	   		    console.log('ProductPrice:', item.productPrice);
	   		    console.log('ProductImg:', item.productImg);
	   		    console.log('productAmount:', item.productAmount);
	   		  });
	   		  
	   		  document.querySelector("#item-table tbody").innerHTML = str;
	   		  
	   		
	   		$(document).on("input", ".amount", function(e) {
	   		 	let productNo = $(e.target).data("productno");
	   		    
	   			localStorage.setItem("productAmount_"+productNo, $(e.target).val());
	   		});
	   		};
	
	   		$(document).ready(function(){
	   			
	   			removeAllProductOrderItems();
	   			
	   		});
	   		
	   		
	   		//전체 product xxx Order 데이터 삭제 함수
	   		function removeAllProductOrderItems(){
				let allItems = productOrderInfoMethod();
		   		
		   		allItems.forEach(function(item){
		   			localStorage.removeItem("productNoOrder_" + item.productNoOrder);
		   			localStorage.removeItem("productNameOrder_" + item.productNoOrder);
		   			localStorage.removeItem("productPriceOrder_" + item.productNoOrder);
		   			localStorage.removeItem("productAmountOrder_" + item.productNoOrder);
		   			localStorage.removeItem("productImgOrder_" + item.productNoOrder);
		   			
		   		});
	   		}
	
			<%-- ==================결제 전 삭제 함수==================== --%>
	    function clearCart(){
	    	let allItems = getAllItemsFromLocalStorage();
	    	if(!(allItems && allItems.length > 0)){
	    		alert("장바구니가 비어있습니다.");
	    		return;
	    	}
	    	let answer = confirm("장바구니를 비우시겠습니까?", "네", "아니오");
	    	
	    	if(answer){
				localStorage.clear();
				location.href="<%=contextPath%>/cart.do";
	    		
	    	} else {
	    		event.preventDefault();
	    	}
		}
	    
	    function clearOne(button){
	    	
	    	
			let answer = confirm("정말 삭제하시겠습니까?", "네", "아니오");
	    	
	    	if(answer){
				
		    	let row = button.parentNode.parentNode;

		        
		        let productNo = button.id;
		        
		        
		        // localStorage에서 해당 상품 정보를 삭제
		        localStorage.removeItem('productName_' + productNo);
		        localStorage.removeItem('productPrice_' + productNo);
		        localStorage.removeItem('productImg_' + productNo);

		        // 테이블에서 해당 행 제거
		        row.remove();
		        location.href="<%=contextPath%>/cart.do";
		        
	    	} else {
	    		event.preventDefault();
	    	}
	    	
	        
	    }
	    
	    function clearChk(){
	    	

	    	if (document.querySelector("#chk2") == null) {
	            alert("장바구니가 비어있습니다.");
	            return;
	        }

			let answer = confirm("정말 삭제하시겠습니까?", "네", "아니오");
	    	
	    	if(answer){
	    		let chks = document.querySelectorAll("#chk2");
		    	
		    	chks.forEach(function(chk){
		    		if(chk.checked){
		    			let row = chk.parentNode.parentNode.parentNode;
			    		
		    			let productNo = chk.getAttribute("data-productNo");
			    		
			    		localStorage.removeItem("productName_" + productNo);
			    		localStorage.removeItem("productPrice_" + productNo);
			    		localStorage.removeItem("productImg_" + productNo);
			    		
			    		row.remove();
			    		location.href="<%=contextPath%>/cart.do";
		    		} else {
		    			event.preventDefault();	
		    		}
		    		
		    	});
	    	}
	    	
	    }
	    
	    <%-- ==================결제 전 결제 이동 함수==================== --%>
	    
	    function orderAll(){
	    	let allItems = getAllItemsFromLocalStorage();
	    	
	    	allItems.forEach(function(item){
	    		localStorage.setItem("productNoOrder_"+item.productNo, item.productNo);
	    		localStorage.setItem("productNameOrder_"+item.productNo, item.productName);
	    		localStorage.setItem("productPriceOrder_"+item.productNo, item.productPrice);
	    		localStorage.setItem("productImgOrder_"+item.productNo, item.productImg);
	    		localStorage.setItem("productAmountOrder_"+item.productNo, item.productAmount);
	    		
	    		
	    		});
	    	
	    	
	    	 location.href = "<%=contextPath%>/store.do"; 
	    }
	    
	    function orderOne(button) {

	    	removeAllProductOrderItems();
	    	
	    	 let answer = confirm("해당 제품만 주문하시겠습니까?", "네", "아니오");

	    	    if (answer) {
	    	        let productNo = button.id;

	    	        // 선택한 상품 정보를 localStorage로 저장
	    	        let productName = localStorage.getItem("productName_" + productNo);
	    	        let productPrice = localStorage.getItem("productPrice_" + productNo);
	    	        let productImg = localStorage.getItem("productImg_" + productNo);
	    	        let productAmount = localStorage.getItem("productAmount_" + productNo);

	    	        localStorage.setItem("productNoOrder_" + productNo, productNo);
	    	        localStorage.setItem("productNameOrder_" + productNo, productName);
	    	        localStorage.setItem("productPriceOrder_" + productNo, productPrice);
	    	        localStorage.setItem("productImgOrder_" + productNo, productImg);
	    	        localStorage.setItem("productAmountOrder_" + productNo, productAmount);

	    	        location.href = "<%=contextPath%>/store.do";
	    	    }
	    }
	    
	    
	    
	    function orderChk(button) {
	    	
	    	if (document.querySelector("#chk2") == null) {
	            alert("장바구니가 비어있습니다.");
	            return;
	        }
			
	    	removeAllProductOrderItems();
	    	
	    	
	    	let chks = document.querySelectorAll("#chk2");
	    	if(chks != null){
	    		let alarm = confirm("선택한 상품들을 주문하시겠습니까?");
	    		if(!alarm){
	    			return;
	    		}
	    		chks.forEach(function(chk){
		    		
		    		if(chk.checked){
			    		let productNo = chk.getAttribute("data-productNo");
			    		
			    		let allItem = getAllItemsFromLocalStorage();
			    		
			    		allItem.forEach(function(item){
			    			if(item.productNo == productNo){
			    				localStorage.setItem("productNoOrder_" + productNo, item.productNo);
			    				localStorage.setItem("productNameOrder_" + productNo, item.productName);
			    				localStorage.setItem("productPriceOrder_" + productNo, item.productPrice);
			    				localStorage.setItem("productImgOrder_" + productNo, item.productImg);
			    				localStorage.setItem("productAmountOrder_" + productNo, item.productAmount);
			    				console.log(localStorage.getItem("productNoOrder_" + productNo));
			    				console.log(localStorage.getItem("productNameOrder_" + productNo));
			    				console.log(localStorage.getItem("productPriceOrder_" + productNo));
			    				console.log(localStorage.getItem("productImgOrder_" + productNo));
			    				console.log(localStorage.getItem("productAmountOrder_" + productNo));
			    				
			    				location.href = "<%=contextPath%>/store.do";
			    			} else {
			    				event.preventDefault();
			    			}
			    		});
		    		}
		    		
		    	});
	    	} else {
	    		event.prevetnDefault();
	    	}
	    	
	    	
	    }
	    
	    
	    
	    
        $(function(){

            $(".chk1").click(function(){
                if($(this).prop("checked")){
                    $(".confirm").prop("checked", true);
                    $(".confirm").css("background-image", "url('<%=request.getContextPath()%>/resources/img/chk02(real).png')")
                } else {
                    $(".confirm").prop("checked", false);
                    $(".confirm").css("background-image", "url('<%=request.getContextPath()%>/resources/img/chk01(real).png')")
                }
            })

            $(".chk2").click(function(){
                let total = $(".chk2").length;
                let checked = $(".chk2:checked").length;
                console.log(checked);

                if ($(this).prop("checked") ) {
                    $(this).prop("checked", true);
                    $(this).css("background-image", "url('<%=request.getContextPath()%>/resources/img/chk02(real).png')");
 
                } else {
                    $(this).prop("checked", false);
                    $(this).css("background-image", "url('<%=request.getContextPath()%>/resources/img/chk01(real).png')");
                
                }
                if(total == checked){
                    $(".chk1").prop("checked", true);
                    $(".chk1").css("background-image", "url('<%=request.getContextPath()%>/resources/img/chk02(real).png')")
                } else {
                    $(".chk1").prop("checked", false);
                    $(".chk1").css("background-image", "url('<%=request.getContextPath()%>/resources/img/chk01(real).png')")
								}

							})

			$(document).ready(function() {
				$(".title table").css({
					"position" : "relative",
					"left" : "100px"
				});

				$(".title table").animate({
					"left" : "0"
				}, 1000); // 이동에 걸리는 시간 (1초 = 1000ms)

				$(".notice table").css({
					"transition-duration" : "1500ms",
					"opacity" : 1

				});

			});

		})
	</script>
	<%@ include file="/views/common/footerBar.jsp" %>

</body>
</html>