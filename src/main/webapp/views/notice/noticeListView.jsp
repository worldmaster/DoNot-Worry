<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #noticeTable > tr{
    text-align: center;
    background-color: #337ab7;
    color: #fff;
    }

</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>


   <div class="container">
   <div class="row">

         
      </div>

   <br><br><br><br>
   
   <table class="table table-bordered table-hover" id="noticeTable"style="text-align:center;  border:1px solid #dddddd">
   <thead>
   <tr>
      <th colspan="5" style="text-align: center; background-color: #98fe86 ; color: black"><h4>공지사항</h4></th>
   </tr>
   <tr>
      <th style="background-color : #fafafa; color:#000000; width:70px;"><h5>번호</h5></th>
      <th style="background-color : #fafafa; color:#000000;"><h5>제목</h5></th>
      <th style="background-color : #fafafa; color:#000000;"><h5>작성자</h5></th>
      <th style="background-color : #fafafa; color:#000000; width:100px;"><h5>작성날짜</h5></th>
   </tr>
   </thead>
   <tbody>
<!--       <tr>
      <td>1</td>
      <td>안녕하세요</td>
      <td>홍길동</td>
      <td>2018-01-01</td>
      <td>1</td>   
      </tr> -->
      
      <% if(list.isEmpty()) { %>
               <!-- 리스트가 비어있을 경우 -->
               <tr>
                  <td colspan="5">존재하는 공지사항이 없습니다</td>
               </tr>
            <% } else { %>
               
               <% for( Notice n  :   list   ) { %>
                  <tr>
                     <td><%= n.getNoticeNo() %></td>
                     <td><%= n.getNoticeTitle() %></td>
                     <td><%= n.getNoticeWriter() %></td>
                     <td><%= n.getNoticeDate() %></td>
                  </tr>
               <% } %>
            <% } %>
      
      <!--       
      <tr>
         <td colspan="5"><a href="boordWrite.jsp" class="btn btn-primary pull-right" type="submit">글 작성</a>
      </tr>    -->
      

   </tbody>
   
   </table>
   </div>
   
   
   <script>
      $(function(){
            
         $("#noticeTable>tbody>tr").click( function(){
             console.log("클릭됨");
            // 클릭했을때 해당 공지사항의 공지사항번호(기본키값)도 함께 넘겨줘야한다.
            // 해당 tr요소의 자손중에서도 첫번째 td태그 내부의 내용이 필요하다 ==> 공지사항번호
            // console.log($(this).children().eq(0).text());
            const nno = $(this).children().eq(0).text();
            
            
            // 요청할url(/detail.no)?키=밸류&키=밸류...
            // ?뒤의 내용들을 쿼리스트링이라고 부름 => 직접만들어서 넘겨줘야함.
            
            //  /jsp2/detail.no?nno=글번호
            location.href ="<%= contextPath%>/detail.no?nno="+nno;
         })
         
         
         
         
         
         
         
         
         
      })
   </script>




</body>
</html>