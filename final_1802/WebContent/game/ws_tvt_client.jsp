<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file='/game/modal_call_tvt.jsp' %>


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
	
	/* 웹소켓 */
	var tvtWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

		tvtWebSocket.onopen = function() {
		$('#result').html("연결 성공!!!!");

		}

		tvtWebSocket.onmessage = function(msg) {
			
			var tbl_noA = msg.data.substring(0,1);	// 대전신청한 테이블번호
			var tbl_noB = msg.data.substring(2,3);	// 대전신청받은 테이블번호
			
			if (tbl_noB === '${tblVo.tbl_no}') {	// 자기 테이블 번호에게 대전신청이 들어오면
				$('#btn_tvt_modal').click();
			}
		
		}
	
		tvtWebSocket.onclose = function() {
		$('#result').html("연결 종료");

	}

	$('#btnSend').click(function() {
		tvtWebSocket.send('${thisIP}: ' +   $('#msg').val());

	})
	
	
	/* 모달 */
	$('#btn_tvt_modal').click(function(){

		
	})
	
	
});	// End of jQuery
	
	
</script>

	<div id='ws_tvt_client'>
		<span>이 컴퓨터 IP끝자리: ${tblIp}</span>
		
		<input type='text' id='msg' /> 
		<input type='button' value='send' id='btnSend' />
		
		<a href='#' data-toggle='modal' data-target='#modal_call_tvt'>
			<input type='button' value='모달띄우기' id='btn_tvt_modal' />
		</a>
		
		<div id='result'></div>

	</div>
