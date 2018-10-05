<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>**채팅방**</title>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.js" integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
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
			}
			////////////////////////////////////////////////
				/* var webSocket = new WebSocket("ws://192.168.0.26:7080/final_1802/client");
				
				webSocket.onopen = function() {
					var ipAddress = $("#ip").val();
					console.log(ipAddress);
					
					$('#chatContent').append("환영합니다!");
					
					var ipAddress = $('#ip').val();
					
					$("#asdf").load("onOpen.chat", ipAddress);
				}
				
				webSocket.onmessage = function(msg) {
					if(msg.data !== "") {
						$('#chatContent').append(msg.data);
						$("#chatContent").scrollTop($('#chatContent').height());
					}
				}
				
				webSocket.onerror = function(event) {
					console.log(event);
				}
				
				webSocket.onclose = function(event) {
					$('#chatContent').append("연결 끊김");
				} */
				
		</script>
		
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="../css/chat.css">
	</head>
	<body>
		<%
			if(session.getAttribute("ipAddress") == null) {
				session.setAttribute("ipAddress", request.getRemoteHost());
			}
		%>
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