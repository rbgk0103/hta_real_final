<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Insert title here</title>
		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.js"
			integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA="
			crossorigin="anonymous"></script>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				var webSocket = new WebSocket("ws://192.168.0.26:7080/final_1802/client");
				
				webSocket.onopen = function() {
					//logger.info('New websocket connection from %s:%d', ws._socket.remoteAddress, ws._socket.remotePort);
					$('#chatContent').append("환영합니다!");
				}
				
				webSocket.onmessage = function(msg) {
					$('#chatContent').append(msg.data);
					$("#chatContent").scrollTop($('#chatContent').height());
				}
				
				webSocket.onerror = function(event) {
					console.log(event);
				}
				
				webSocket.onclose = function(event) {
					var reason;
					if (event.code == 1000)
			            reason = "Normal closure, meaning that the purpose for which the connection was established has been fulfilled.";
			        else if(event.code == 1001)
			            reason = "An endpoint is \"going away\", such as a server going down or a browser having navigated away from a page.";
			        else if(event.code == 1002)
			            reason = "An endpoint is terminating the connection due to a protocol error";
			        else if(event.code == 1003)
			            reason = "An endpoint is terminating the connection because it has received a type of data it cannot accept (e.g., an endpoint that understands only text data MAY send this if it receives a binary message).";
			        else if(event.code == 1004)
			            reason = "Reserved. The specific meaning might be defined in the future.";
			        else if(event.code == 1005)
			            reason = "No status code was actually present.";
			        else if(event.code == 1006)
			           reason = "The connection was closed abnormally, e.g., without sending or receiving a Close control frame";
			        else if(event.code == 1007)
			            reason = "An endpoint is terminating the connection because it has received data within a message that was not consistent with the type of the message (e.g., non-UTF-8 [http://tools.ietf.org/html/rfc3629] data within a text message).";
			        else if(event.code == 1008)
			            reason = "An endpoint is terminating the connection because it has received a message that \"violates its policy\". This reason is given either if there is no other sutible reason, or if there is a need to hide specific details about the policy.";
			        else if(event.code == 1009)
			           reason = "An endpoint is terminating the connection because it has received a message that is too big for it to process.";
			        else if(event.code == 1010) // Note that this status code is not used by the server, because it can fail the WebSocket handshake instead.
			            reason = "An endpoint (client) is terminating the connection because it has expected the server to negotiate one or more extension, but the server didn't return them in the response message of the WebSocket handshake. <br /> Specifically, the extensions that are needed are: " + event.reason;
			        else if(event.code == 1011)
			            reason = "A server is terminating the connection because it encountered an unexpected condition that prevented it from fulfilling the request.";
			        else if(event.code == 1015)
			            reason = "The connection was closed due to a failure to perform a TLS handshake (e.g., the server certificate can't be verified).";
			        else
			            reason = "Unknown reason";

			        $("#chatContent").append("<br />" + "The connection was closed for reason: " + reason);
					$('#chatContent').append("연결 끊김");
					
				}
				$('#msg').keyup(function(e) {
					if(e.keyCode === 13) {
						sendMessage();
					}
				})
				
				$('#btnChatSend').click(function() {
					sendMessage();
				})
				
				function sendMessage() {
					webSocket.send($('#msg').val());
					$('#msg').val("");
				}
			})
		</script>
		
		<!-- fond-awesome 아이콘 -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		
		<style>
			#chatBody {
				width: 560px;
				height: 800px;
				border: 6px solid #FF7E71;
				border-radius: 30px;
				background: #030303;
				color: #ffffff;
			}
			#chatContent {
				height: 477px;
				overflow: auto;
				padding: 15px;
			}
			
			#chatWrap {
			}
			#chatFooter {
			}
			
			#chatHeader {
				height: 73px;
				overflow: hidden;
				text-align: center;
				margin: 15px 0 15px 0;
				padding: 6px;
			}
			#chatNotice {
				background: #333333;
				border-radius: 20px;
				text-align: center;
				padding-top: 16px;
				overflow: visible;
				margin-top: 7px;
			}
			#msgForm {
				color: #000000;
			}
			#btnChatSend {
				padding: 32px 12px;
				border-radius: 11px;
			}
			#msg {
				padding: 2px 12px;
				width: 75%;
			}
			#marginBottomZero {
				margin-bottom: 0px;
			}
			#chatBox{
				border-radius: 20px;
				background: #857393;
				padding-top: 10px;
				padding-left: 10px;
			}
			#allCircleBorder{
				border-radius: 100px;
				border: 1px solid #888888;
				width: 13.333333%;
				cursor: pointer;
			}
			#circleBorder {
				border-radius: 100px;
				border: 1px solid #888888;
				margin-right: 4px;
				width: 27.666667%;
				cursor: pointer;
			}
			#circleBorder p {
				padding-top: 14px;
			}
			#allCircleBorder p {
				padding: 24px 0 11px 0;
			}
			#userList {
				overflow: hidden;
			}
			#whiteLine{
				background: #dfdfdf;
				margin-top: 10px;
				padding: 0;
			}
			.receive {
				float: left;
				text-align: left;
			}
			.chatReceiveBox {
				background: #952389;
				padding: 12px 12px 9px 12px;
				border-radius: 20px;
			}
			.send {
				float: right;
				text-align: left;
			}
			.send > h6 {
				text-align: right;
			}
			.chatSendBox {
				background: #239589;
				padding: 12px 12px 9px 12px;
				border-radius: 20px;
			}
			#angleLeftIcon {
				margin-top: 12px;
				margin-right: 17px;
				cursor: pointer;
			}
			#angleRightIcon {
				margin-top: 12px;
				float: right;
				cursor: pointer;
			}
			
		</style>
	</head>
	<body>
		<div class="container" id="chatBody">
			<div id='chatHeader' class='col-md-12 col-xs-12'>
				<div class="col-md-1 col-xs-1" id="allCircleBorder">
					<p>전체</p>
				</div>
				<!-- 전체채팅목록, 유저목록, 아이콘 -->
				<div class="col-md-10 col-xs-10" id="userBox">
					<i class="fa fa-angle-left fa-3x col-md-1 col-xs-1" id="angleLeftIcon"></i>		<!-- 왼쪽 화살표 아이콘 -->
					<!-- 개개인의 유저 목록 -->
					<div class="col-md-8 col-xs-8" id="userList">
						<div class="col-md-2 col-xs-2" id="circleBorder">
							<p>No. 1</p>
						</div>
						<div class="col-md-2 col-xs-2" id="circleBorder">
							<p>No. 2</p>
						</div>
						<div class="col-md-2 col-xs-2" id="circleBorder">
							<p>No. 3</p>
						</div>
						<!-- 테이블 목록이 많을 경우 한 줄로 정렬되지 않는 문제를 고쳐야합니다. -->
						<!-- <div class="col-md-2 col-xs-2" id="circleBorder">
							<p>No. 4</p>
						</div>
						<div class="col-md-2 col-xs-2" id="circleBorder">
							<p>No. 5</p>
						</div> -->
						
					</div>
					<!-- 개개인의 유저목록 끝 -->
					<i class="fa fa-angle-right fa-3x col-md-1 col-xs-1" id="angleRightIcon"></i>	<!-- 오른쪽 화살표 아이콘 -->
				</div>
				<!-- 전체채팅목록, 유저목록, 아이콘 끝 -->
				<%-- <c:forEach begin="1" end="3">
					<span class="i"></span>
				</c:forEach> --%>
			</div>
			<hr class="col-md-12 col-xs-12" id="whiteLine"/>
			<div id='chatWrap' class='col-md-12 col-xs-12'>
				<!-- 공지 -->
				<div id="chatNotice" class="col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-10">
					<form class="form-horizontal">
						<div id="marginBottomZero" class="form-group">
							<label for="notice" class="col-md-2 col-xs-2 text-center">공지</label>
							<div class="col-md-10 col-xs-10 text-left">
								<p><strong>어쩌저쩌 어쩌구</strong></p>
							</div>
						</div>
					</form>
				</div>
				<!-- 공지 끝 -->
				<!-- 대화내용 -->
				<div id='chatContent' class='col-md-12 col-xs-12'>
					<div class="textBlock col-md-12 col-xs-12">	<!-- textBlock : 대화 하나가 한 줄을 차지함 -->
						<div class="receive">	<!-- receive : 받은 메세지, 왼쪽으로 정렬 -->
							<h6>No. 1</h6>
							<div class='chatReceiveBox'>반가워 진심이야</div>		<!-- chatReceiveBox : border-radius, background 색상 -->
						</div>
					</div>
					<div class="textBlock col-md-12 col-xs-12">
						<div class="send">	<!-- send : 보낸 메세지, 오른쪽으로 정렬 -->
							<h6>No. ?</h6>
							<div class="chatSendBox">나도 반가워 진심이야 알고 있니?</div>
						</div>
					</div>
				</div>
				<!-- 대화내용 끝 -->
			</div>
			<!-- wrap 끝 -->
			<!-- 대화 입력 창 -->
			<div id='chatFooter' class='col-md-12 col-xs-12'>
				<form id="msgForm" class='form-horizontal col-md-12 col-xs-12'>
					<div class="form-group">
						<textarea id="msg" rows="4" class='form-control col-md-9 col-xs-9'></textarea>
						<input type='button' class="btn col-md-offset-1 col-md-2 col-xs-offset-1 col-xs-2" id='btnChatSend' value="전송"/>
					</div>
				</form>
			</div>
			<!-- 대화 입력 끝 -->
		</div>
	</body>
</html>