<%@ page import="com.kh.order.model.vo.Store, java.util.ArrayList"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<title>매장 선택</title>

<style>
body {
   background-color: #fdfee5; /*바꾸면 안 됨*/
   box-sizing: border-box; /*바꾸면 안 됨*/
   text-align: center; /*바꾸면 안 됨*/
   width: 1500px; /*바꾸면 안 됨*/
}

div {
   /* border: 1px solid red; */
   
}

.store {
   width: 1400px; /*바꾸면 안 됨*/
   margin: auto;
   margin-bottom: 150px;
}

.store>div {
   width: 100%;
}

  /*타이틀*/


.title{
    width: 100%;
    display: flex;
    justify-content: center;
    margin: 100px 0 0 0;
}

.title #arrow{
    width: 20px
}
.title .arrow-appear{
    font-size: 30px;
    font-weight: 600;
    color: #1e7304;
}
.title td>.colored{
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
.title #main{
    padding: 0;
    width: 150px;
    height: 150px;
    font-size: 25px;
    font-weight: 600;
    line-height: 150px;
}

/*매장 선택*/
.store-check {
   display: flex;
}

#choicestore {
   width: 40%;
   text-align: center;
   position: relative;
   padding-right: 50px;
}

#store-form{
	height : 500px;
}

#store-img {
   width: 300px;
   height: 150px;
   margin: auto;
   margin-bottom: 15px;
}

#store-img>img {
   width: 300px;
   height: 150px;
}

#choicestore>p {
   font-size: 20px;
   font-weight: 500;
}

.address-box {
   display: flex;
   width: 100%;
   height: 70px;
   margin-bottom: 30px;
}

.address-box>div {
   width: 100%;
   text-align: center;
}

.address-box>div>div {
   height: 50%;
}

#choicebtn {
   width: 25%;
   line-height: 65px;
}

.storechoicebtn {
   border: none;
   border-radius: 500px;
   background-color: #98fe86;
   color: #1e7304;
   width: 100px;
   height: 50px;
   font-size: 15px;
   font-weight: 600;
   line-height: 50px;
}

.storechoicebtn:hover {
   background-color: #fdfee5;
   color: #98fe86;
   cursor: pointer;
   transition-duration: 300ms;
}

#apimap {
   position: relative;
   width: 60%;
   border-left: 3px solid #98fe86;
}

#map {
   width: 650px;
   height: 500px;
   position: absolute;
   top: 50%;
   left: 50%;
   margin: -210px 50px 50px -300px;
}

#store_add {
   font-size: 12px;
}

.store {
   opacity: 0;
}
</style>
</head>


<body>



   <%
   Store s = (Store) request.getAttribute("s");
   ArrayList<Store> sList = (ArrayList<Store>)request.getAttribute("sList");
   %>

   <%@ include file="/views/common/menubar.jsp"%>

   <!--타이틀-->
   <div class="store">
      <div class="title">
         <table>
            <tr>
                <td id="circle">
                    <div class="colored">장바<br>구니</div>
                </td>
                <td id="arrow"  class="arrow-appear">></td>
                <td id="circle">
                    <div id="main" class="colored">매장설정</div>
                </td>
                <td id="arrow"  class="arrow-appear">></td>
                <td id="circle">
                    <div class="colored">날짜<br>설정</div>
                </td>
                <td id="arrow"></td>
                <td id="circle">
                    <div></div>
                </td>
                <td id="arrow"></td>
                <td id="circle">
                    <div></div>
                </td>
            </tr>
        </table>
      </div>
      <div class="store-check">
         <div id="choicestore">
            <h3>선택 가능 매장</h3>
            <br>
            <form action = "<%=contextPath%>/datechoice.do" method="post">
            <div id="store-form">
            
            
            
            </div>
            </form>
            
         </div>
         
         
         <div id="apimap">
            <div id="map">
               <!-- api이미지? -->
            </div>
         </div>
         
         
         
      </div>
   </div>


   <%@ include file="/views/common/footerBar.jsp"%>

   
   
   <script>
      

   $(function() {
      $(document).ready(function() {
         $(".store").css({
            "opacity" : "1",
            "transition-duration" : "1000ms"
         });
         
         <% if(loginUser == null){ %>
         alert("로그인 후 이용하실 수 있습니다.");
         location.href ='<%=contextPath %>/login.me';
      <% } %>

      });
   });
   </script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2965b875d610c4b2407daf7815a1872"></script>
   <script>
      <%--!!!!!!!!!!!!!!!!!!!!!!!!지도 api !!!!!!!!!!!!!!!!!!!! --%>
      $(function(){
         if ("geolocation" in navigator) {
              navigator.geolocation.getCurrentPosition(
                function (position) {
                  const latitude = position.coords.latitude;
                  const longitude = position.coords.longitude;


                  // 위치 정보를 활용하여 지도 생성 및 표시
                  var mapContainer = document.getElementById('map');
                  var mapOption = {
                    center: new kakao.maps.LatLng(latitude, longitude),
                    level: 5
                  };
                  var map = new kakao.maps.Map(mapContainer, mapOption);
                /*   map.setZoomable(false);
                  map.setDraggable(false);  */
                  
                  var positions = [];
                  <%for (Store store : sList) {%>
                   var po = {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                         id : "<%=store.getStoreId()%>",
                         title : "<%=store.getStoreName()%>",
                        latlng : new kakao.maps.LatLng(<%=store.getLatitude()%>,<%=store.getLongitude()%>),
                         address: `<%=store.getStoreAddress()%>`
                         };
                  console.log(po);
                  positions.push(po);
               <%}%>
         // 마커 이미지의 이미지 주소입니다
               var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

               for (var pp of positions) {

                  // 마커 이미지의 이미지 크기 입니다
                  var imageSize = new kakao.maps.Size(24, 35);

                  // 마커 이미지를 생성합니다    
                  var markerImage = new kakao.maps.MarkerImage(
                        imageSrc, imageSize);

                  // 마커를 생성합니다
                  var marker = new kakao.maps.Marker({
                     map : map, // 마커를 표시할 지도
                     position : pp.latlng, // 마커를 표시할 위치
                     title : pp.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                     image : markerImage
                  // 마커 이미지 
                  
                  });
                  
                  
                  
                     var str = "<div class='store-info'>"
                          + "<div id='" + pp.img + "'>"
                          + "<img src='resources/logout.png' alt=''>"
                          + "</div>"
                          + "<div class='address-box'>"
                          + "<div id='choicebtn'></div>"
                          + "<div>"
                          + "<div id='store_name'>"
                          + "<b>" + pp.title + "</b>"
                          + "</div>"
                          + "<div id='store_add'>" + pp.address + "</div>"
                          + "</div>"
                          + "<div id='choicebtn'>"
                          + "<input type='hidden' name = 'storeId' value='" + pp.id + "'>"
                          + "<input type='submit' class='storechoicebtn' id='" +pp.id+"' onclick='storeSet(this)' value='매장 선택'>"
                          + "</div>"
                          + "</div>"
                          + "</div>";
      
                     
                     document.querySelector("#store-form").innerHTML += str;
                  
               }

            }, function(error) {
               console.error("위치 정보를 가져오는데 실패했습니다: "
                     + error.message);
            });
         } else {
            console.error("Geolocation이 지원되지 않습니다.");
         }
         
      })
      
      function storeSet(button){
         let storeId = button.id;
         localStorage.setItem("storeIdOrder", storeId);
         /* alert(localStorage.getItem("storeIdOrder")); */
      };
      
   </script>

</body>
</html>