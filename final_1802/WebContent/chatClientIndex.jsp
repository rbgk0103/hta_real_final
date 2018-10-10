<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>**채팅방**</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.js"
	integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="./css/chat.css">
</head>
<body>
	<%
		String chatNotice = request.getParameter("chatNotice") == null
				? "./chat/chatNotice.jsp"
				: (String) request.getParameter("chatNotice");

		String chatContent = request.getParameter("chatContent") == null
				? "./chat/chatContent.jsp?tableNo=" + request.getAttribute("tableNo")
				: (String) request.getParameter("chatContent") + request.getAttribute("tableNo");
	%>
		
	<input type='hidden' id="ip" value='${ip }' />
	<input type='hidden' id="tableNo" value='${tableNo }' />
	<div class="container" id="chatBody">
		<%@ include file="./chat/chatHeader.jsp"%>
		<hr class="col-md-12 col-xs-12" id="whiteLine" />
		<div id='chatWrap' class='col-md-12 col-xs-12'>
			<div id="chatNotice"
				class="col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-10">
				<jsp:include page="<%=chatNotice%>" />
			</div>
			<div id='chatContent' class='col-md-12 col-xs-12'>
				<jsp:include page="<%=chatContent%>" />
			</div>
		</div>
		<%@ include file="./chat/chatFooter.jsp"%>
	</div>
	<%
		String ip;
		if(request.getParameter("ip") != null) {
			ip = (String)request.getParameter("ip");
			System.out.println("index에서 받아온 parameter(ip)의 값은 : " + ip);
			request.setAttribute("ip", ip);
		}
	%>
	<script>
		window.onload = function() {
			console.log("스크립틀릿의 ip : " + $('#ip').val());
			var webSocket = new WebSocket('ws://192.168.0.26:7080/final_1802/broadcasting');
			
			console.log("스크립틀릿의 ip : " + $('#ip').val());
			webSocket.onopen = function() {
				$('#chatContent').append("연결 성공!!!!");
			}
	
			webSocket.onmessage = function(msg) {
				if (msg.data.substring(0, 1) === $('#tableNo').val()) {
					$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="send">'
						+ '<h6>No. ' + $('#tableNo').val() + '</h6>'
						+ '<div class="chatSendBox">'
						+ msg.data.substring(1)
						+ '</div></div></div>'
					);
					$("#chatContent").scrollTop($('#chatContent').height());
				} else {
					$('#chatContent').append
						( '<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="receive">'
						+ '<h6>No. ' + '?' + '</h6>'
						+ '<div class="chatReceiveBox">'
						+ msg.data.substring(1)
						+ '</div></div></div>'
					);
				}
			}
	
			webSocket.onclose = function() {
				$('#chatContent').append("연결 종료");
			}
	
			$('#btnChatSend').click(function() {
				sendMessage();
			})
	
			$('#msg').keyup(function(e) {
				if (e.keyCode === 13) {
					sendMessage();
				}
			});
	
			function sendMessage() {
				var message = $('#msg').val();
				if ($.trim($('#msg').val()) !== "") {
					webSocket.send($('#tableNo').val() + message);
				}
			}
		}
	
		function loadWrap() {
			$('#chatNotice').load("notice.chat");
			$('#chatContent').load("content.chat");
		}
	</script>
</body>
</html>