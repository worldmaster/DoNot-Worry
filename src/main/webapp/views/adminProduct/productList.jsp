<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.AdminProduct.model.vo.AdminProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

ArrayList<AdminProduct> list = (ArrayList<AdminProduct>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>상품등록</title>


    <style>
       

        #product > .cart > form > table {
            width: 100%;
            border-bottom: 1px solid #d3d3d3;
            border-collapse: collapse;
            border-spacing: 0;
        }

        #product > .cart > form > table tr { border-bottom: 1px solid #d3d3d3 ;}

        #product > .cart > form > table th:first-child {width: 60px;}

        #product > .cart > form > table th {
            padding: 12px 0;
            border-top: 2px solid #000;
            border-bottom: 1px solid #d3d3d3;
            background: #fff;
            color: #383838;
            font-size: 0.95em;
            text-align: center;
            letter-spacing: -0.1em;
        }

        #product > .cart > form > table .empty { display: none ;}

        #product > .cart > form > table td { text-align: center;}

        #product > .cart > form > table td:last-child {
            color: #ff006c;
            font-weight: bold;
        }

        #product > .cart > form > table th > input {}

        

        #product > .cart > form > table tr > td > input {}

        #product > .cart > form > table td > article {
            padding: 6px;
            overflow: hidden;
        }

        #product > .cart > form > table td > article > a {
            float: left;
            display: inline-block;
        }

        #product > .cart > form > table td > article > a > img { width: 80px;}

        #product > .cart > form > table td > article > div {
            float: left;
            margin-left: 10px;
        }

        #product > .cart > form > table td > article > div > h2 { text-align: left; }

        #product > .cart > form > table td > article > div > p {
            text-align: left;
            color: #777;
            margin-top: 4px;
        }

        #product > .cart > form > input[name=del] {
            border-color: #bdbdbd;
            border-bottom-color: #828282;
            background: #fafafa;
            color: #4d4d4d;
            padding: 6px 11px;
            border-width: 1px;
            margin-top: 6px;
        }

        #product > .cart > form > .total {
            float: right;
            width: 360px;
            height: 412px;
            padding: 20px;
            margin-top: 12px;
            background: #fff;
            border: 1px solid #d3d3d3;
            box-sizing: border-box;
        }

        #product > .cart > form > .total > h2 {
            width: 100%;
            font-weight: bold;
            font-size: 16px;
            border-bottom: 1px solid #111;
            margin-bottom: 10px;
            padding-bottom: 10px;
            box-sizing: border-box;
            color: #1e1e1e;
        }

        #product > .cart > form > .total > table { width: 100%; }

        #product > .cart > form > .total > table tr:nth-last-child(1) td {
            font-size: 20px;
        }

        #product > .cart > form > .total > table tr:nth-last-child(1) td:last-child {
            color: #ff006c;
            font-size: 20px;
            font-weight: bold;
        }

        #product > .cart > form > .total > table td {
            padding: 10px 0;
            font-size: 14px;
            color: #555;
        }

        #product > .cart > form > .total > table td:last-child { text-align: right; }

        #product > .cart > form > .total > input[type=submit] {
            width: 100%;
            height: 56px;
            font-size: 26px;
            border-width: 1px;
            border-color: #d81818;
            border-bottom-color: #9e1212;
            background: #ed2f2f;
            background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
            color: #fff;
            box-sizing: border-box;
            margin-top: 10px;
        }


    </style>
</head>
<%@ include file="/views/common/menubar2.jsp" %>

<body>
    <div id="wrapper">
        <main id="product">
            <aside>       
                </ul>
            </aside>
            <section class="cart">
                <nav>
                    <h1>상품관리</h1>
          
                </nav>
               <form action="#">
                    <table border="1" id="product-table">
                        <tr>
                            <th style="background-color: #98fe86; color: black;">상품번호</th>
                            <th style="background-color: #98fe86; color: black;">상품명</th>
                            <th style="background-color: #98fe86; color: black;">상품설명</th>
                            <th style="background-color: #98fe86; color: black;">가격</th>
                        </tr>
                        <tr class="empty">
                            <td colspan="7">장바구니에 상품이 없습니다.</td>
                        </tr>
                        
                        <%for(AdminProduct c : list){ %>
                        <tr><%if(c.getProductStatus().equals("Y")) { %>
                            <td><%=c.getProductNo() %></td>
                            <td><article>
                                <a href="#">		
                               <%--  <img src="<%= contextPath %>/<%= list.get(0).getFilePath() + list.get(0).getChangeName() %>" width="500" height="300"> --%> 
                                    <img src="<%=contextPath%>/<%=c.getFileNo()%>" class="productImg" alt="1" onclick="location.href='<%=contextPath %>/detail.pr?bno=<%=c.getProductNo() %>'">
                                </a>
                                <div>
                                    <h2><%=c.getProductName() %></h2>
                                </div>
                            </article></td>
                            <td><%=c.getProductExplain() %></td>
                            <td><%=c.getProductPrice()%></td>
                        </tr>
                        <% } else {%>
                       
                        <%  } %>
					<% } %>

                    </table>
                	<br><br>
                
                 	<a href="<%=contextPath%>/insert.pr" class="btn btn-primary pull-right" type="submit" style="background-color: #98fe86; color: black;">상품등록</a>
               </form>
            </section>
        </main>
        
   
    </div>
    

</body>
</html>