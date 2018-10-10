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
				? "./chat/chatContent.jsp"
				: (String) request.getParameter("chatContent");
	%>
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
	<script>
	/* $(document).ready(function() {
		$('#chatContent').load("onOpen.chat", document.getElementById("ipAddress"));
	})
	
	/////////////////////////////////////////////////////
	$("#chatContent").scrollTop($('#chatContent').height());
	
	$('#msg').keyup(function(e) {
		if(e.keyCode === 13) {
			sendMessage();
		}
	});
	
	$('#btnChatSend').click(function() {
		sendMessage();
	});
	
	function sendMessage() {
		$('#chatContent').load("sendMessage.chat");
	} */
	
		window.onload = function() {
			var webSocket = new WebSocket('ws://localhost:7080/final_1802/broadcasting');
	
			webSocket.onopen = function() {
				$('#chatContent').append("연결 성공!!!!");
			}
	
			webSocket.onmessage = function(msg) {
				if (true) {
					$('#chatContent').append('<div class="textBlock col-md-12 col-xs-12">'
						+ '<div class="receive">'
						+ '<h6>No. ' + '1' + '</h6>'
						+ '<div class="chatReceiveBox">'
						+ msg.data
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
					webSocket.send(message);
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