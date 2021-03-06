<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>**채팅방**</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="./css/chat.css?ver=1">
</head>
<body>
<%
	if(request.getAttribute("openTableList") == null) {
		out.print("<h1>index리스트(List)가 비었음.</h1>");
	} else {
		request.setAttribute("openTableList", request.getAttribute("openTableList"));
	}
%>
	<!-- table no를 id로, guest gender를 value로 만들었습니다. -->
		<c:forEach var='i' items='${allTableList}'>
			<input type="hidden" id="${i.table_no }" value="${i.guest_gender}">
		</c:forEach>
		<input type='hidden' id="ip" value='${ip }' />
		<input type='hidden' id="tableNo" value='${tableNo }' />
		<input type='hidden' id='receiverNo' value='a'/>
		
	<div class="container" id="chatBody">
		<div id='chatHeader' class='col-md-12 col-xs-12'>
		</div>
		<hr class="col-md-12 col-xs-12" id="whiteLine" />
		<div id='chatWrap' class='col-md-12 col-xs-12'>
			<div id="chatNotice"
				class="col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-10">
			</div>
			<div id='chatContent' class='col-md-12 col-xs-12'>
			</div>
		</div>
		<%@ include file="./chat/chatFooter.jsp"%>
	</div>
	<div id='model'></div>
	<%	
		//index.jsp에서 채팅을 눌렀을 때 parameter로 ip를 받습니다.
		if(request.getParameter("ip") != null) {
			request.setAttribute("ip", (String)request.getParameter("ip"));
		}
	%>
	<script>
		var ip = "${param.ip}";		//index.jsp에서 채팅 버튼을 눌렀을 때 getIp.chat 컨트롤러에서 modelAndView에 addObject로 보낸 값
		var ipCut = ip.substr(ip.length-2, ip.length);	//ip 뒤 두 자리
		var reqAttrMyNo = "${tableNo}";	//getIp.chat 컨트롤러에서 modelAndView에 addObject로 보낸 값
		var webSocket = new WebSocket('ws://192.168.0.26:7080/final_1802/broadcasting');	//웹소켓, broadcasting은 서버의 ServerEndpoint와 같아야함
		console.log("ipCut : " + ipCut);
		var list = "${allTableList}";	//
		
		$('#chatHeader').load("header.chat", "ip=" + ip + "&nowPage=1&receiveNo=a");
		$('#chatContent').load("content.chat", "msg=" + reqAttrMyNo + "a");
		$('#chatNotice').load("notice.chat");
		
		webSocket.onopen = function() {
			console.log("연결중...")
			webSocket.send(reqAttrMyNo + "a" + ipCut);	//4자리
			console.log("연결 성공 ㅋ");
		}
		
		webSocket.onmessage = function(msg) {
			var msgSenderNo = msg.data.substring(0, 1);
			var msgReceiverNo = msg.data.substring(1, 2);
			var msgGetGender = document.getElementById(msgSenderNo).value;
			var msgData = msg.data.substring(2, msg.data.length-2);
			var idReceiveNoValue = document.getElementById('receiverNo').value;
			console.log("msg : " + msgData);
			console.log("idReceiveNoValue : " + idReceiveNoValue);
				if (msgSenderNo === reqAttrMyNo && idReceiveNoValue === msgReceiverNo) {
					switch (msgGetGender) {
					case "man" : 
						$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="send">'
						+ '<h6>No. ' + reqAttrMyNo + '</h6>'
						+ '<div class="chatManBox">'
						+ msg.data.substring(2, msg.data.length-2) + '</div></div></div>');
						break;
						
					case "woman" : 
						$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="send">'
						+ '<h6>No. ' + reqAttrMyNo + '</h6>'
						+ '<div class="chatWomanBox">'
						+ msg.data.substring(2, msg.data.length-2) + '</div></div></div>');
						break;
						
					case "seam" : 
						$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="send">'
						+ '<h6>No. ' + reqAttrMyNo + '</h6>'
						+ '<div class="chatSeamBox">'
						+ msg.data.substring(2, msg.data.length-2) + '</div></div></div>');
						break;
					}
				} else {
					switch (msgGetGender) {
					case "man" : 
						$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="receive">'
						+ '<h6>No. ' + msgSenderNo + '</h6>'
						+ '<div class="chatManBox">'
						+ msg.data.substring(2, msg.data.length-2) + '</div></div></div>');
						break;
						
					case "woman" : 
						$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="receive">'
						+ '<h6>No. ' + msgSenderNo + '</h6>'
						+ '<div class="chatWomanBox">'
						+ msg.data.substring(2, msg.data.length-2) + '</div></div></div>');
						break;
						
					case "seam" : 
						$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="receive">'
						+ '<h6>No. ' + msgSenderNo + '</h6>'
						+ '<div class="chatSeamBox">'
						+ msg.data.substring(2, msg.data.length-2) + '</div></div></div>');
						break;
					}
				}
			
			$("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
		}
	
		webSocket.onclose = function() {
			console.log("연결 종료");
		}
		
		document.getElementById("btnChatSend").onclick = sendMessage;
		document.getElementById('msg').onkeyup = function(e) {
			if (e.keyCode === 13) {
				sendMessage();
			}
		};
	
		function sendMessage() {
			var message = document.getElementById('msg').value;
			var receiveNo = document.getElementById('receiverNo').value;
			console.log("sendMessage receiveNo : " + receiveNo);
			$('#model').load("insert.chat", "msg=" + reqAttrMyNo + receiveNo + message + ipCut);	//메세지 DB 저장용
			console.log("메세지 : " + message);
			if ($.trim(message) !== "") {
				webSocket.send(reqAttrMyNo + receiveNo + message + ipCut);
				document.getElementById('msg').value = "";	//textarea 지움
			}
		}
		document.getElementById("btnNoticeSend").onclick = function() {
			var noticeMessage = document.getElementById('msg').value;
			console.log("noticeMessage : " + noticeMessage);
			$('#chatNotice').load("noticeInsert.chat", "noticeMessage=" + noticeMessage);
		}
	</script>
</body>
</html>