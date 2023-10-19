<%@page import="com.kh.contact.model.vo.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   PageInfo1 pi1 = (PageInfo1) request.getAttribute("pi");
   ArrayList<Contact> list  = (ArrayList<Contact>)request.getAttribute("list");
      
   int currentPage = pi1.getCurrentPage();
   int startPage   = pi1.getStartPage();
   int endPage     = pi1.getEndPage();
   int maxPage     = pi1.getMaxPage(); 
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   #concat-table>tbody>tr:hover{
      background:gray;
      cursor:pointer;
   }
   #concat-table>tbody>tr:Last-Child:hover{
      background:#fdfee5;
      cursor:pointer;
   }
   
   text-align: center;
    background-color: #337ab7;
    color: #fff;
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>




   <div class="container">
   
            <form method="post" name="search" action="searchbbs.jsp">
            <table class="pull-right">
               <tr>
                  <td><select class="form-control" name="searchField">
                        <option value="0">선택</option>
                        <option value="bbsTitle">제목</option>
                        <option value="userID">작성자</option>
                  </select></td>
                  <td><input type="text" class="form-control"
                     placeholder="검색어 입력" name="searchText" maxlength="100"></td>
                  <td><button type="submit" class="btn btn-primary pull-right" style="background-color: #98fe86; color: black;" >검색</button></td>
               </tr> 

            </table>
         </form>
         <br><br><br><br><br>
   
   <table class="table table-bordered table-hover" id="concat-table" style="text-align:center; border:1px solid #dddddd">
   <thead>
   <tr>
      <th colspan="5" style="text-align: center; background-color: #98fe86 ; color: #black;"><h4>건의사항</h4></th>
   </tr>
   <tr>
      <th style="background-color : #fafafa; color:#000000; width:70px;"><h5>번호</h5></th>
      <th style="background-color : #fafafa; color:#000000;"><h5>제목</h5></th>
      <th style="background-color : #fafafa; color:#000000;"><h5>작성자</h5></th>
      <th style="background-color : #fafafa; color:#000000; width:100px;"><h5>작성날짜</h5></th>
   </tr>
   </thead>
   <tbody>
         <% if(list.isEmpty()) { %>
               <tr>
                  <td colspan="6">조회된 리스트가 없습니다.</td>
               </tr>
            <% } else { %>
               <% for(Contact c : list) { %>
                  <tr>
                     <td><%=c.getContNo()  %></td>
                     <td><%=c.getContTitle()  %></td>
                     <td><%=c.getContWriter()  %></td>                     
                     <td><%= c.getContDate() %></td>
                  </tr>
               <% } %>
            <% } %>
      <tr>
         <td colspan="5">
         <% if(loginUser != null){ %>
         <a href="<%=contextPath %>/insert.bo" class="btn btn-primary pull-right" type="submit" style="background-color: #98fe86; color: black;">글 작성</a>
         <%} %>
         </td>
      </tr>

      </tbody>
     </table>
     <!--  페이징바  -->
      <div align="center" class="paging-area">
         <% if(currentPage != 1) { %>
            <button onclick="location.href= '<%=contextPath %>/list.bo?currentPage=<%= currentPage -1 %>' " >&lt;</button>
         <% } %>
         
         <% for(int p = startPage; p<= endPage; p++){ %>
         
            <% if(p != currentPage) {%>
               <button onclick="location.href='<%=contextPath %>/list.bo?currentPage=<%=p %>'" ><%= p %></button>
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
            <button onclick="location.href = '<%=contextPath %>/list.bo?currentPage=<%= currentPage+1 %>'">&gt;</button>
         <% } %>
         
      </div>
   </div>

   <script>
      $(function(){
         $("#concat-table>tbody>tr").click(function(){
            location.href="<%= contextPath %>/detail.bo?bno="+$(this).children().eq(0).text();
         })
      });
   </script>
</body>
</html>