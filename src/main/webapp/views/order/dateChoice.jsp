<%@ page import="java.time.LocalDate, java.time.DayOfWeek, java.time.format.DateTimeFormatter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
        LocalDate today = LocalDate.now();  // 현재 날짜를 얻는다
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE요일");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <title>날짜 설정</title>
    <style>
         body{
            background-color: #fdfee5;
            box-sizing: border-box;
            text-align: center;
            width: 1500px;
        }
        body div{
           box-sizing: border-box; 
        }
        .territory{
            /* border: 1px solid red; */
            width: 1400px;
            margin: auto;
        }

        /*===============컨텐츠*/
        .wrap{
            width: 1400px;
            margin: auto;
            /* border: 1px solid blue; */
        }
        .wrap div{
            /* border: 1px solid green; */
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

                /*날짜박스*/
        .date-box{
            display: flex;
            justify-content: space-evenly;
            margin: 50px 0 50px 0;
            padding: auto;
            opacity:0;
        }
        .date-box label{
            display: inline-block;
            box-sizing: border-box;
            padding: 25px 0 0 0;
            margin: 0 20px 0 20px;
            border: 5px solid #98fe86;
            border-radius: 50px;
            width: 150px;
            height: 150px;
            color: #1e7304;
            font-size: 20px;
            font-weight: 600;
        }
        .date-box label:hover{
            box-shadow: 0px 10px 10px #98fe86;
            transition-duration: 300ms;
        }
        .date-box input:checked+label{
            background-color: #98fe86;
            box-shadow: none;
        }
        .date-box input:disabled+label{
            background-color: none;
        }

        .date-box label:hover{
            cursor: pointer;
        }
        .date-box input[type=radio]{
            appearance: none;
        }
        

                /*날짜정보*/
        .date-info{
            letter-spacing: 4px;
        }


                /*날짜 선택*/
        .date-choice{
            margin-top: 50px;
        }
        .date-choice>input{
            box-sizing: border-box;
            width: 200px;
            height: 50px;
            border:none;
            border-radius: 200px;
            background-color: #98fe86;
            color: #1e7304;
            font-size: 15px;
            font-weight: 600;
        }    
        .date-choice>input:hover{
            cursor: pointer;
            border: 2px solid #1e7304;
            font-size: 17px;
            transition-duration: 300ms;
        }
        input[type=radio]:checked +.date-box th{
            background-color: #98fe86;
            color:aliceblue;
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
                            <div class="colored">장바<br>구니</div>
                        </td>
                        <td id="arrow"  class="arrow-appear">></td>
                        <td id="circle">
                            <div class="colored">매장<br>설정</div>
                        </td>
                        <td id="arrow"  class="arrow-appear">></td>
                        <td id="circle">
                            <div id="main" class="colored">날짜 설정</div>
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
        </div>

        <br>
        <br>
        <hr style="background-color: #98fe86; height: 3px; border: 0;">
                    <!--날짜 선택-->
        <div class="wrap2">
            <div class="date-box">
            
            	<% String formattedMonth =""; %>
				<% String formattedDate= "";%>
				<% for(int i=1; i<8; i++){ %>
				    <% formattedMonth = String.format("%02d", today.plusDays(i).getMonthValue());%>
				    <% formattedDate = String.format("%02d", today.plusDays(i).getDayOfMonth());%>
				    <input type="radio" id="dateselect<%=i%>" name="dateselect">
				    <label for="dateselect<%=i%>"><%= today.plusDays(i).getYear() %>년<br><%=formattedMonth %>월 <%=formattedDate %>일<br><%=today.plusDays(i).format(formatter) %></label>
				<% } %>   
               
            </div>
            <div class="date-info">
                <p style="height:150px; opacity:0;"></p>
            </div>
            <div class="date-choice">
                <input type="submit" id="date-choice-btn" name="datechoice" value="결제 페이지로">
            </div>
        </div>
    </div>

	<script>
		$(function(){
			$(document).ready(function() {
	            $(".title table").css({
	                "position": "relative",
	                "left": "100px"
	            });

	            $(".title table").animate({
	                "left": "0"
	            }, 1000); // 이동에 걸리는 시간 (1초 = 1000ms)
	            
	            $(".date-box").css({
	                "transition-duration":"1500ms",
	                "opacity":1
	                
	            });
	          });
			
			
			$(".date-box>input").click(function() {
			    let labelFor = $(this).attr("id");
			    let label = $("label[for='" + labelFor + "']").html();
			   
			    var $dateInfo = $(".date-info>p");
			    var newContent = "<h3>" + label + "</h3>" + "<br><h2>이 날 배송해드릴까요?</h2>";
				
			    $dateInfo.animate({ opacity: 0 }, 200, function() {
			    	 $dateInfo.html(newContent).animate({ opacity: 1 }, 200);
			    });
			});
			
			
			$("#date-choice-btn").click(function(){
				
				let labelFor = $("input[type=radio]:checked").attr("id");
				
			    let label = $("label[for='" + labelFor + "']").html();
			    let labelText = label.replace(/<br\s?\/?>/g, ' ').replace(/\s+/g, '');
			    let regex = /\d+/g;
			    let numbers = label.match(regex);
			    let date = numbers.join('');
				localStorage.setItem("dateOrder", date);
				
				/* alert(localStorage.getItem("dateOrder")); */
				
				location.href = "<%=contextPath%>/order.do";
			});
			
			
		})
        
        
        
        
    </script>

	<%@ include file="/views/common/footerBar.jsp"%>


</body>
</html>