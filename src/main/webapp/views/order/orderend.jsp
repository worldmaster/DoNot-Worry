<%@ page import = "com.kh.order.model.vo.*, java.util.ArrayList, java.util.Iterator" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	Order o = (Order)request.getAttribute("o");
	Delivery d = (Delivery)request.getAttribute("d");
	String month = d.getDelDate().toString().substring(5, 7);
	String date = d.getDelDate().toString().substring(8, 10);
	ArrayList<OrderProduct> op = (ArrayList<OrderProduct>)request.getAttribute("op");%>

	
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
    <style>
         body{
            background-color: #fdfee5;
            box-sizing: border-box;
            text-align: center;
            width: 1500px;
            opacity: 0;
            margin: 0;
            padding: 0;
        }
        body div{
           box-sizing: border-box; 
        }
        .territory{
            border: 1px solid red;
            width: 1400px;
            margin: auto;
        }

       

        /*===============컨텐츠*/
        .wrap{
            width: 1400px;
            margin: auto;
            border: 1px solid blue;
            padding: 0;
            margin-top:50px;
            margin-bottom:50px;
        }
        .wrap div{
            border: 1px solid green;
            margin: 30px 0 30px 0;
            padding: 0;
        }

        .wrap1 a{
            display: inline-block;
            border:none;
            border-radius: 500px;
            background-color: #98fe86;
            height: 50px;
            width: 200px;
            margin: 0 30px 0 30px;
            text-decoration: none;
            color: #1e7304;
            font-size: 20px;
            font-weight: 600;
            line-height: 50px;
            margin-bottom: 50px;
        }
        .wrap1 a:hover{
            background-color: #fdfee5;
            color: #98fe86;
            transition-duration: 300ms;
        }    

    </style>
</head>
<body>



	<%@ include file="/views/common/menubar.jsp"%>



 <!--컨텐츠-->
    <div class="wrap">
        <div class="territory wrap1">
            <div><h2>결제 완료</h2></div>
            <div>
                <h3>주문 결제가 정상적으로 완료되었습니다.</h3>
                <p>주문번호 : <%=o.getOrderNo()%></p>
            </div>
            <div><h3><%= loginUser.getUserName() %>님의 도넛은 <%=month%>월 <%=date %>일 배송될 예정입니다.</h3></div>
            <div>
                <a href="<%=contextPath %>/product.do">계속 쇼핑하기</a>
                <a href="<%=contextPath%>/list.od?uno=<%=loginUser.getUserNo()%>">주문 내역 보기</a>
            </div>
        </div>
    </div>
    
    
    <script>
        $(function(){
            $(document).ready(function(){
                $("body").css({
                    "opacity": "1",
                    "transition-duration":"1000ms"});
                
                let carts = getAllItemsFromLocalStorage();
                let orders = productOrderInfoMethod();
                <%Iterator<OrderProduct> it = op.iterator();
                
                	while(it.hasNext()){%>
	                	carts.forEach(function(item){
	                    	let pNo = item.productNo;
	                    	if(pNo == <%=it.next().getProductNo()%>){
	                    		localStorage.removeItem("productNo_"+pNo);
	                    		localStorage.removeItem("productName_"+pNo);
	                    		localStorage.removeItem("productPrice_"+pNo);
	                    		localStorage.removeItem("productImg_"+pNo);
	                    		localStorage.removeItem("productAmount_"+pNo);
	                    		localStorage.removeItem("productNoOrder_"+pNo);
	                    		localStorage.removeItem("productNameOrder_"+pNo);
	                    		localStorage.removeItem("productPriceOrder_"+pNo);
	                    		localStorage.removeItem("productImgOrder_"+pNo);
	                    		localStorage.removeItem("productAmountOrder_"+pNo);
	                    		/* 
	                    		alert(localStorage.getItem("productNo_"+pNo));
	                    		alert(localStorage.getItem("productNoOrder_"+pNo)); */
	                    		
	                    		
	                    	}
	                    });
                	<%}%>
                
                
            })
        })
        
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
    
    </script>



	<%@ include file="/views/common/footerBar.jsp"%>




</body>
</html>