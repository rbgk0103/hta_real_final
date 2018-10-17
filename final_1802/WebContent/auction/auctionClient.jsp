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
window.onload=function(){ 
// 	$('#auction').load('auction_client.auc');	

	//웹 소켓 생성 주소
	var webSocketAuc = new WebSocket('ws://192.168.0.29:7080/final_1802/WebSocketAuction'); 
	var stDate = new Date().toLocaleTimeString();

	//socket open 시 호출되는 event
	webSocketAuc.onopen = function(){
		setInterval(function() {
				po=a
			}, 1000);
		
// 		if(stDate ){
			
// 		}else{
			
// 		}
// 		for( i = 0; i <= ${list} ;i++){
//             alert(${i.ae_date } );
// 		} 
		
		
		alert("open 성공");	
	}
	
	//socket send(입찰) 시 호출되는 event
	webSocketAuc.onmessage = function(msg){
		/*  $('#result').append('<div>' + msg.data + '</div>');  */
		
	}
	
	//socket close 시 호출되는 event
	$('#btnBidding').click(function(){
		webSocketAuc.onclose(alert("Auction 연결종료"));
	})
	
	$('#btnSend').click(function(){
		webSocketAuc.send($('#msg').val());
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
		<span>IP 주소 : ${auctionIp }</span>
	</div>
	<div id='auction_menu'>
		<img src='' width='280px' height='280px'/>
	</div>
		<label class='menu_name'>첨처럼</label><br/>
		<label class='now_price' >현재가 : 10,000</label><br/>
		<strong><label class='start_price'>시작가 : 4,000</label></strong>
			<p/>
			<input type='button' id='btnBat_one' value='+pct1' class='btn'/><br/> <!-- 송신버튼 1 -->
			<input type='button' id='btnBat_two' value='+pct2' class='btn'/>	  <!-- 송신버튼2 -->
			<p/> 
 			<input type='button' id='btnBidding' value='입찰' class='btn_two' /> <!-- 종료버튼 --> 
			<input type='button' id='btnGiveup'  value='포 기' class='btn_two' data-dismiss ='modal'/> 
		<p/> 	
		<p>남은시간 : <span id="timer"></span></p>
	</div>
</form> 
</body>
</html>