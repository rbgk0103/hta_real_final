<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$().ready(function(){
	var wa = new WebSocket('ws://192.168.0.20:7080/final_1802/auction/auction_chat');
	
	wa.onopen = function(){
		
	}
	
	wa.onmessage = function(msg){
		$("#now_price").val(parseInt(msg.data()) + parseInt($('#now_price').val()));
	}
	
	$("#btn_close").click(function(){
		alert($('#max').val());
	})

	$("#btn_max").click(function(){
		wa.send($('#max').val());
	})

	$("#btn_min").click(function(){
		wa.send($('#min').val());
	})
})
</script>
</head>
<body>
<div id = 'auc_chat'>
	<Strong>현재 가격</Strong><br>
	<input type = 'text' id = 'now_price' name = 'now_price' value = '0'/><br/>
	<hr/>
	<input type = 'hidden' id = 'max' name = 'max' value = '1000'/>
	<input type = 'hidden' id = 'min' name = 'min' value = '500'/>
	<input type = 'button' id = 'btn_max' name = 'btn_max' value = 'MAX'/>
	<input type = 'button' id = 'btn_min' name = 'btn_min' value = 'MIN'/><br/>
	<hr/>
	<input type = 'button' name = 'btn_close' id = 'btn_close' value = 'Close'/>
</div>
</body>
</html>