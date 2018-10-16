<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

#ws_tvt_client {
	text-align: right;
}
#ws_tvt_client input{
	color: black;
}

</style>

<script>
$(document).ready(function(){
	
	var tvtWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

		tvtWebSocket.onopen = function() {
		$('#result').html("연결 성공!!!!");

		}

		tvtWebSocket.onmessage = function(msg) {
			
			// alert(msg.data);
		
		}
	
		tvtWebSocket.onclose = function() {
		$('#result').html("연결 종료");

	}

	$('#btnSend').click(function() {
		tvtWebSocket.send('${thisIP}: ' +   $('#msg').val());

	})
});
	
	
</script>

	<div id='ws_tvt_client'>
		<span>이 컴퓨터 IP끝자리: ${tblIp}</span>
		
		<input type='text' id='msg' /> <input type='button' value='send' id='btnSend' />
		<div id='result'></div>

	</div>
