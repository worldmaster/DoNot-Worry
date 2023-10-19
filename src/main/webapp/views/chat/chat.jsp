<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
        .content{
            height: 700px; /*컨텐츠 영역 사이즈*/
            width: 1400px;/*바꾸면 안 됨*/
            margin: auto;
        }
		#icon_img{
       width: auto; height: auto;
      max-width: 40px;
    max-height: 80px;
   
		}

#portlet-title{
background-color: #2980b9;
}

#media-heading{
   text-align: left;
   font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#header_bar{
   margin-top: 0px;
    margin-bottom: 10px;
}
#row{
   
   margin: 8px
}
#portlet-footer{
   background-color: #E2E2E2;
   margin: 8px
}
#form-group{
   margin-left: 15px;
   margin-bottom: 15px;
}
#header_bar1{
	background: #98fe86;
	margin-top: 0px;
	color: black;
}

#portlet-heading{
	overflow: hidden;
	display: inline-block;
}
</style>
</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>
<script type="text/javascript">

var lastId = 0;

function submitFunction(){
	var chatName = $('#chatName').val();
	var chatContent = $('#chatContent').val();
	console.log(chatName);
	console.log(chatContent);
	
	$.ajax({
		type:"POST",
		url:"<%=contextPath %>/chatSubmitServlet",
		data : {
			chatName:chatName,
			chatContent : chatContent
		},
		success : function(result){
			if(result == 1){
				autoClosingAlert('#successMessage',2000);
			}else if(result == 0){
				autoClosingAlert("#dangerMessage",2000);
			}else{
				autoClosingAlert("#warningMessage",2000);
			}
		}
	})
		$('#chatContent').val('');
}

	function autoClosingAlert(selector,delay){
		/* var alert = $(selector).alert(); */
		
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function(){alert.hide()},delay);
		
		
	}
	function chatListFunction(type){


		
		$.ajax({
			type:"POST",
			url:"<%=contextPath %>/chatListServlet",
			data : {
				listType: type,
			},
			success:function(data){
				if(data == "")return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i =0; i<result.length; i++){
					addChat(result[i][0].value, result[i][1].value,result[i][2].value);
				}
				lastID = Number(parsed.last);
				
			}
		});
			
	}
	function addChat(chatName, chatContent, chatTime) {

		$('#chatList').prepend(

						'<div class="row">'

								+ '<div class="col-lg-12">'

								+ '<div class="media">'

								+ '<a class="pull-left" href="#">'

								+ '<img class="media-object img-circle" id = "icon_img" src="<%=contextPath%>/resources/img/icon.png" alt="">'

								+ '</a>' + '<div class="media-body">'

								+ '<h4 class="media-heading" id="media-heading" >' + chatName

								+ '<span class="small pull-right">' + chatTime

								+ '</span>' + '</h4>' + '<p id="media-heading">' + chatContent

								+ '</p>' + '</div>' + '</div>' + '</div>'

								+ '</div>' + '<br>');

		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
		
		

	}
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		},500);
	}




</script>
<br><br>





      <div class="container">
         <div class="row">
            <div class="col-xs-12" id="col-xs-12">
               <div class="portlet portlet-default">
                  <div class="portlet-heading1">
                     <div id = "portlet-title1" class="portlet-title1">
                        <h4 id="header_bar1"><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
                     </div>
               
                  </div>
                  <div id="chatList" class="panel-collapse collapse in">
                     <div class="portlet-body chat-widget" style="overflow-y : auto; width: auto; height: 400px;">
                     <div class="row">
                        <div class="col-lg-12">
                           <p class="text-center text-muted small">2017년 5월 30일</p>
                        </div>
                     </div>
                     
   
                     
             
                     
                     
                     
                          <div class="portlet-footer" id="portlet-footer">
                             <div class="row" id="row">
                                <div class="form-group col-xs-2">
                                   <input type="hidden" name="chatId" value="">
                                   <input style="height: 40px;" type="text" id="chatName" name="chatName" class="form-control" placeholder="이름" maxlength="20">
                                      </div>
                                </div>
                             	<div class="row" style="height:90px">
                                <div class="form-group col-xs-8" id="form-group">
                                   <textarea style="height:80px;" id="chatContent" name="chatContent" class="form-control" placeholder="내용을 입력하세요."></textarea>
                                </div>   
                                <div class="form-group col-xs-2">
                                   <button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
                                   <div class="clreafix"></div>
                                </div>
                    </div>   
                    
                    
                        
                  </div> 
               </div>
            </div>
         </div>
      </div> 
      </div>
      </div>
	
	<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메시지 전송에 성공하였습니다.</strong>
	</div>     
      
    <div class="alert alert-danger" id="dangerMessage" style="display: none;">
    	<strong>이름과 내용을 모두 입력해주세요.</strong>
    </div>
    
    
    <div class="alert alert-warning" id="warningMessage" style="display: none;">
    	<strong>데이터베이스 오류가 발생했습니다</strong>
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		chatListFunction('ten');
    		getInfiniteChat();
    	})
    
    </script>

      
      


<%@ include file="/views/common/footerBar.jsp" %>

</body>
</html>