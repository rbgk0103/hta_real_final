<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css" />
<script src='../lib/jquery-3.3.1.js'></script>
<title>Insert title here</title>
<script>
	$().ready(function(){
		var webSocket_request = new WebSocket('ws://192.168.0.21:7080/final_1802/request');
		
		webSocket_request.onopen = function() {
			console.log("오픈임");
		}
		webSocket_request.onmessage = function(msg) {
			$('#call_employee').append(msg.data);
			console.log("msg : " + msg.data);
			
		}
		webSocket_request.onclose = function() {
			console.log("소켓 꺼짐");
		}
		
/* 		$('#call_employee').click(function(){
			window.open("", "message", "_blank", 'width=120, height=400');
			var df = document.message_form;
			df.action="./admin/admin_call_employee.jsp?msg=asdf";
			df.submit();
		}) */
	});
</script>
<style>
body{font-family: 'Lato', sans-serif;}
#call_employee_header{font-size: 25px;height:50px;width:100%;text-align:center;background-color: #283744;color:#fff;line-height:2;}
#call_employee{height:900px;list-style: none;padding: 0;margin: 0;background-color:#39435C;color:#fff;}
#call_employee > li{padding: 10px;font-size: 17px;}
#call_employee > li:hover{background-color:#425164;}
#call_employee > li > label{margin-right: 15px;font-weight:100;}
</style>

<script>

$('#call_employee').children('.call_employee_row').click(function(){
	var result = confirm('처리 하셨습니까?');
	if(result) { //yes 
		alert('삭제되었습니다.')
		$(this).css('display','none');	
	} 
	else {
		return;
	}
})
function delete_row(cnt){
	var result = confirm('삭제하시겠습니까?');
	if(result) { //yes 
		$('.call_employee_row'+cnt).css('display','none');	
		alert('삭제되었습니다.')
	} 
	else {
		return;
	}	
}
</script>
</head>
<body>
<div>
	<div id = "call_employee_header">
		직원 호출
	</div>
	<ul id = "call_employee">
		
	</ul>
</div>
</body>
</html>