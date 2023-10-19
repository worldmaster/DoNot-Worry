<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/menubar2.jsp" %>

   <form action="<%= contextPath %>/insert.pr" id="form1" method="post" enctype="multipart/form-data">
        <!-- 파일업로드를 위해 추가하는 타입 -->
        <h2>상품등록</h2>
        <br><br><br>
            <div style="float: left; width: 43%; text-align: left; padding-left: 30px;">
                상품명:
                <input type="text" name="prName" placeholder="상품명을 입력하세요."><br><br><br>
                가격:
                <input type="text" name="price" placeholder="가격 입력하세요."><br><br><br>
                <div>
                    상품설명
                </div>
                <textarea cols="50" rows="5" maxlength="1000" placeholder="상품을 설명해주세요" name="prContent"></textarea>
                
                <div>
                    원산지설명
                </div>
                <textarea cols="50" rows="5" maxlength="1000" placeholder="원산지를 설명해주세요" name="origin"></textarea>
                
                
                <div>대표 이미지</div>
                <input type="file" name="upfile">

            </div>
  
            <div style="float: left; width: 43%; ">
                열량:
                <input type="text" name="kcal" placeholder="내용을 입력하세요."><br><br>
                1회제공량:
                <input type="text" name="servingSize" placeholder="내용을 입력하세요."><br><br>
                당류:
                <input type="text" name="sugar" placeholder="내용을 입력하세요."><br><br>
                단백질:
                <input type="text" name="protein" placeholder="내용을 입력하세요."><br><br>
                포화지방:
                <input type="text" name="fat" placeholder="내용을 입력하세요."><br><br>
                나트륨:
                <input type="text" name="na" placeholder="내용을 입력하세요."><br><br>
                알레르기성분:
                <input type="text" name="allergy" placeholder="내용을 입력하세요."><br><br>
            </div><br>
            <input type="submit" class="btn btn-primary pull-right" style="background-color: #98fe86; color: black;" value="상품등록">
    </form>

</body>
</html>