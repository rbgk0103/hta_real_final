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
<%
 if(request.getParameter("tblIp") != null){
	 request.setAttribute("tblIp", (String)request.getParameter("tblIp"));
 }
%>
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
	var webSocketAuc = new WebSocket('ws://192.168.0.29:7080/final_1802/WebSocketAuction'); 
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
		$("#now_price").val($("#now_price").val() + $("#ae_max").val());
		
		webSocketAuc.send($("#now_price").val());
	})
	$('#btnBat_two').click(function(){
		$("#now_price").val($("#now_price").val() + $("#ae_min").val());
		
		webSocketAuc.send($("#now_price").val());
	})
	
}
</script>
</head>
<body>
<div id = 'auction'>
	<input type = 'hidden' id = 'auction' />
	<input type = 'button' value = 'send' id = 'btnSendAuc' style = 'visibility: hidden' />
	<a href = '#' data-toggle = 'modal' data-target = '#modal_auction'>
	<!-- <input type = 'button' value = '모달 업' id = 'btn_auction_modal' /> -->
	</a>
</div>
<%@include file = '/modal_auction.jsp' %>
</body>
</html>