<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>web socket client</title>
<script src="../lib/jquery-3.3.1.min.js"></script>
<script>

<%
// 이 파일(webSocketTVTClient)을 실행한 컴퓨터의 IP 얻어내기
InetAddress local = InetAddress.getLocalHost();
String localIp = local.getHostAddress();

// 아이피 끝번호만 얻어내기
String thisIP = localIp.substring(10);

request.setAttribute("thisIP", thisIP);
%>



function tvtClientPageLoad() {
	
	var tvtWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

		tvtWebSocket.onopen = function() {
		$('#result').html("연결 성공!!!!");

	}

		tvtWebSocket.onmessage = function(msg) {
		$('#result').append('<div>' + msg.data + '</div>');

	}
	
		tvtWebSocket.onclose = function() {
		$('#result').html("연결 종료");

	}

	$('#btnSend').click(function() {
		tvtWebSocket.send('${thisIP}: ' +   $('#msg').val());

	})
}
</script>

</head>

<body>
	<div id='web_client'>
		<h3>지금 이 컴퓨터의 IP 끝자리: ${thisIP}</h3>
	
	
		<input type='text' id='msg' /> <input type='button' value='send' id='btnSend' />
		<p />

		<div id='result'></div>

	</div>
<script>
tvtClientPageLoad();
</script>

</body>
</html>
