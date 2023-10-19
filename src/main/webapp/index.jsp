<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.member.model.vo.Member"%>
<%
// import="com.kh.common.JDBCTemplate"
// 	JDBCTemplate.getConnection();
	Member loginUser2 = (Member)session.getAttribute("loginUser");
%>


<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .content{
          /* border: 1px solid red; */
          height: 1100px; /*컨텐츠 영역 사이즈*/
          width: 1400px;/*바꾸면 안 됨*/
          margin: auto;
          
      }

      /* 슬라이드 부분 */
      .slideshow-container {
          max-width: 1400px;
          height: 300px;
          position: relative;
          margin: auto;
          margin-top: 120px;
      }

      .fade {
          -webkit-animation-name: fade;
          -webkit-animation-duration: 3s;
          animation-name: fade;
          animation-duration: 3s;
      }

      @-webkit-keyframes fade {
          from {opacity: 0.4} 
          to {opacity: 1}
      }

      @keyframes fade {
          from {opacity: 0.4} 
          to {opacity: 1}
      }

      /* 슬라이드 이전&다음 버튼 */
      /* 이전버튼 */
      .prev {
          cursor: pointer;
          position: absolute;
          top: 60%;	
          width: auto;
          padding: 16px;
          margin-top: -22px;
          left: 0;
          color: white;
          font-weight: bold;
          font-size: 18px;
          transition: 0.6s ease;
          border-radius: 0 3px 3px 0;
      }
      /* 다음버튼 */
      .next {
          cursor: pointer;
          position: absolute;
          top: 60%;	
          right: 0;
          width: auto;
          padding: 16px;
          margin-top: -22px;
          color: white;
          font-weight: bold;
          font-size: 18px;
          transition: 0.6s ease;
          border-radius: 3px 0 0 3px;
      }

      /* 호버시 버튼 색 변경 */
      .prev:hover, .next:hover {
          background-color: rgb(152, 254, 134, 0.8);
      }


      /* 베스트 메뉴 부분 */
      /* 메뉴명, 가격 text*/
      .menu-text{
          position: absolute;
          left: 8%;
          text-align: left;
      }

      /* 메뉴 이미지 호버시 text 변경*/
      .best-img:hover + .menu-text {
          display: block;
          opacity: 0.7;
      }
      /* 메뉴 이미지 호버시 이미지에 효과 */
      .best-img:hover{
          opacity: 0.7;
      }
      
      /* 베스트메뉴 이미지 */
      #best-img-container{
          display: flex;
          justify-content: right;
      }

      /* 베스트메뉴 이미지 정렬, 크기조정 */
      .best-img a img{
          width: 290px;
          height: 290px;
          border-radius: 100%;
          margin: 0 20px;
      }
</style>
</head>
<body>

<%-- 	<% if(loginUser2.getUserId().equals("admin")){ %> --%>
<%-- 		<%@ include file="views/common/menubar2.jsp" %> --%>
<%-- 	<%}else{ %> --%>
<%--  		<%@ include file="views/common/menubar.jsp" %> --%>
<%-- 	<%} %> --%>

	<%if(loginUser2 != null && loginUser2.getUserId().equals("admin")){ %>
		<%@ include file="views/common/menubar2.jsp" %>
	<%}else{ %>
		<%@ include file="views/common/menubar.jsp" %>
	<%}%>
	<div class="content">
        
        <div class="slideshow-container">
            <div class="mySlideDiv fade active" id="content1">
                <a href="<%=request.getContextPath()%>/product.do"><img src="resources/img/banner01.png" width="1400px" height="400px"></a>
            </div>
            
            <div class="mySlideDiv fade" id="content2">
                <a href="<%=request.getContextPath()%>/product.do"><img src="resources/img/banner02.jpg"  width="1400px" height="400px"></a>
            </div>
            <div class="mySlideDiv fade" id="content2">
                <a href=""><img src="resources/img/banner06.png"  width="1400px" height="400px"></a>
            </div>

            <div class="mySlideDiv fade" id="content3">
                <a href=""><img src="resources/img/banner03.jpg "  width="1400px" height="400px"></a>
            </div>

            <div class="mySlideDiv fade" id="content3">
                <a href=""><img src="resources/img/banner04.jpg "  width="1400px" height="400px"></a>
            </div>

            <div class="mySlideDiv fade" id="content3">
                <a href=""><img src="resources/img/banner05.jpg "  width="1400px" height="400px"></a>
            </div>


            <a class="prev" onclick="prevSlide()">&#10094;</a>
            <a class="next" onclick="nextSlide()">&#10095;</a>
        </div>

        <br><br><br><br><br><br><br><br><br><br><br>

        <div class="best-menu">
            <div class="menu-text" id="menu-text1">
                <h3>OUR BEST MENU</h3>
                <br>
                <h2>EARL GREY DONUT</h2>
                <h2>얼그레이 도넛</h2>
                <h3>3500원</h3>
            </div>
            <div class="menu-text" id="menu-text2">
                <h3>OUR BEST MENU</h3>
                <br>
                <h2>SALTED CARAMEL DONUT</h2>
                <h2>솔티드 캬라멜 도넛</h2>
                <h3>4000원</h3>
            </div>
            <div class="menu-text" id="menu-text3">
                <h3>OUR BEST MENU</h3>
                <br>
                <h2>RASBERRY DONUT</h2>
                <h2>라즈베리 도넛</h2>
                <h3>3800원</h3>
            </div>


            <div class="best-img-container" id="best-img-container">
                <div class="best-img" id="best-img1">
                    <a href=""><img src="resources/img/donut01.thumb"></a>
                </div>
                <div class="best-img" id="best-img2">
                    <a href=""><img src="resources/img/donut02.thumb"></a>
                </div>
                <div class="best-img" id="best-img3">
                    <a href=""><img src="resources/img/donut03.thumb"></a>
                </div>
            </div>
        </div>

    </div>
 
 <%@ include file="views/common/footerBar.jsp" %>
 
     <script type="text/javascript">
$(function(){
	
        $(document).ready(function () {
            $(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
            
            setInterval(nextSlide, 3000); //3초(3000)마다 다음 슬라이드로 넘어감
        });
        
})
        //이전 버튼 슬라이드 
        function prevSlide() {
            $(".mySlideDiv").hide(); //모든 div 숨김
            var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
            var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
            
            //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
            $(".mySlideDiv").each(function(index,item){ 
                if($(this).hasClass("active")) {
                    currentIndex = index;
                }
                
            });
            
            //새롭게 나타낼 div의 index
            var newIndex = 0;
            
            if(currentIndex <= 0) {
                //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
                newIndex = allSlide.length-1;
            } else {
                //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
                newIndex = currentIndex-1;
            }
        
            //모든 div에서 active 클래스 제거
            $(".mySlideDiv").removeClass("active");
            
            //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
            $(".mySlideDiv").eq(newIndex).addClass("active");
            $(".mySlideDiv").eq(newIndex).show();
        
        }
        
        //다음 슬라이드
        function nextSlide() {
            $(".mySlideDiv").hide();
            var allSlide = $(".mySlideDiv");
            var currentIndex = 0;
            
            $(".mySlideDiv").each(function(index,item){
                if($(this).hasClass("active")) {
                    currentIndex = index;
                }
                
            });
            
            var newIndex = 0;
            
            if(currentIndex >= allSlide.length-1) {
                //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
                newIndex = 0;
            } else {
                //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
                newIndex = currentIndex+1;
            }
        
            $(".mySlideDiv").removeClass("active");
            $(".mySlideDiv").eq(newIndex).addClass("active");
            $(".mySlideDiv").eq(newIndex).show();
            
        }
        
    </script>


        <!-- 콘텐츠 영역 베스트메뉴 텍스트변경  -->
    <script>
        function showText(textId) {
        const menuTexts = document.querySelectorAll(".menu-text");
        menuTexts.forEach((text) => {
            text.style.display = "none";
        });
        document.getElementById(textId).style.display = "block";
        }

        document.addEventListener("DOMContentLoaded", function () {
        showText("menu-text1");
        });

        document.getElementById("best-img1").addEventListener("mouseover", function () {
        showText("menu-text1");
        });

        document.getElementById("best-img2").addEventListener("mouseover", function () {
        showText("menu-text2");
        });

        document.getElementById("best-img3").addEventListener("mouseover", function () {
        showText("menu-text3");
        });
     </script>
</body>
</html>