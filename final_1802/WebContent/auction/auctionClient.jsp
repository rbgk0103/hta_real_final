<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text /html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel='stylesheet' type='text/css' href='../css/auction.css'	/>
<title>Insert title here</title>
<script>
$().ready(function(){
	ae_view($('#ae_no').val());
})
function ae_view(ae_no){
	$('body').load("./auction_confirm.auc", ae_no);
}
window.onload=function(){  
// 	$('#auction').load('auction_client.auc');	

	//웹 소켓 생성 주소
	var webSocketAuc = new WebSocket('ws://192.168.0.20:7080/final_1802/WebSocketAuction'); 
	var stDate = new Date().toLocaleTimeString();

	//socket open 시 호출되는 event
	webSocketAuc.onopen = function(){
		
	}
	
	//socket send(입찰) 시 호출되는 event
	webSocketAuc.onmessage = function(msg){
		$("#now_price").val(msg.data());
	}
	
	//socket close 시 호출되는 event
	$('#btnBidding').click(function(){
		webSocketAuc.onclose(alert("Auction 연결종료"));
	})
	
	$('#btnBat_one').click(function(){
		$("#now_price").val(parseInt($("#now_price").val()) + parseInt($("#ae_max").val()));
		webSocketAuc.send($("#now_price").val());
	})
	
	$('#btnBat_two').click(function(){
		$("#now_price").val(parseInt($("#now_price").val()) + parseInt($("#ae_min").val()));	
		webSocketAuc.send($("#now_price").val());
	})
	
	$("#btnGiveup").click(function(){
		self.close();
	})
	
}
</script>
</head>
<body>
<form name = 'frm_auction' id = 'frm_auction' method = 'post'>
	<div id = 'auction'>
	<div id ='header'>
		<h1><label class = 'auction_header'>A U C T I O N</label></h1>
		<jsp:include page= "./auctionHeader.jsp" />
	</div>
	<div id='auction_menu'>
		<img src='../admin/menu/menuImg/fury_1.png' width='280px' height='280px'/>
	</div>
		<label class='menu_name'></label><br/>
		<h2><label><strong>현제가 : <input type = 'text' id = 'now_price' name = 'now_price' value = '0'></strong></label></h2>
			<p/>
			<input type = 'hidden' id ='ae_max' name = 'ae_max' value = '1000'>
			<input type = 'hidden' id ='ae_min' name = 'ae_min' value = '700'>
			<input type = 'hidden' id ='ae_price' name = 'ae_price'>
			<input type='button' id='btnBat_one' value='+pct1' class='btn'/><br/> <!-- 송신버튼 1 -->
			<input type='button' id='btnBat_two' value='+pct2' class='btn'/>	  <!-- 송신버튼2 -->
			<p/> 
 			<input type='button' id='btnBidding' value='입찰' class='btn_two' />
			<input type='button' id='btnGiveup'  value='포 기' class='btn_two' onclick = 'close_auction()' /> 
		<p/>
	</div>
</form> 
</body>
</html>