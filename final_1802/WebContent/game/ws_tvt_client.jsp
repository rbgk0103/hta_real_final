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
var tvtMsg;					// 대전신청시 사용
var tvtMsgArr;				// 대전신청 사용(쪼갠 배열)

$(document).ready(function(){
var ftc = document.frm_tvt_client;

// 타이머용
var count = 30;
var timerId = 0;

	/* 웹소켓 */
	var tvtWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

		tvtWebSocket.onopen = function() {
		$('#result').html("연결 성공!!!!");

		}
	
		
		// webSocket으로 msg 받으면
		tvtWebSocket.onmessage = function(msg) {
			
			// 도전자 테이블번호, 도전받는 테이블번호,게임타이틀이미지,게임타이틀이름, 메뉴이미지, 메뉴이름, 수락여부('accept')
			tvtMsg = msg.data;
			tvtMsgArr = msg.data.split(',');
			
			// 자기 테이블 번호에게 대전신청이 들어오면
			if (tvtMsgArr[1] == '${tblVo.tbl_no}' && tvtMsgArr[6] != 'accept') {	
				
				$('#modal_tvt_tblNoA').text(tvtMsgArr[0]);	
			
				$('#modal_tvt_gt_img').attr("src", './img/game_img/' + tvtMsgArr[2]);
				$('#modal_tvt_gtName').text(tvtMsgArr[3]);
				
				$('#modal_tvt_menu_img').attr("src", './admin/menu/menuImg/' + tvtMsgArr[4]);
				$('#modal_tvt_menuName').text(tvtMsgArr[5]);
			
				// 모달을 띄운다
				$('#btn_tvt_modal').click();
				
					//타이머 가동
					timerId = setInterval(function() {
						console.log('이봉기');
						count--;
						$('#modal_tvt_timer_area').text(count);
						
						// 남은시간 0초 되면
						if (count === 0) {
							clearInterval(timerId);
							$('#modal_call_tvt_footer_cancel').click();
						}
						
					}, 1000);
					
			}
			
			
		}
	
		
		tvtWebSocket.onclose = function() {
			$('#result').html("연결 종료");
		}
		
				
	
	// [도전수락]버튼을 눌렀을 때
	$('#modal_call_tvt_footer_accept').click(function(){
		var tvtAcceptMsg = tvtMsg + ',accept';
		
		tvtWebSocket.send(tvtAcceptMsg);
		
		ftc.tvtAcceptMsg.value = tvtAcceptMsg;
		ftc.method = 'GET';
		ftc.action = './tvtPlay2.game';
		ftc.submit();
		
	});
		
		
		
	/* 타이머 */
	// textarea에 포거스가 되면 타이머 작동
	$('#btn_timer_start').click(function() {
		timerId = setInterval(function() {
			console.log('이봉기');
		}, 1000);
	});

	// textarea에서 포커스를 잃으면 타이머 중지
	$('#btn_timer_stop').click(function() {
		clearInterval(timerId);
	});
	
	
});	// End of jQuery
	
	
</script>

	<div id='ws_tvt_client'>
		
		<input type='hidden' id='msg'  /> 
		<input type='hidden' value='send' id='btnSend' />
		
		<a href='#' data-toggle='modal' data-target='#modal_call_tvt'>
			<input type='hidden' value='모달띄우기' id='btn_tvt_modal' />
		</a>
		
		<form name='frm_tvt_client'>
			<input type='hidden' name='tvtAcceptMsg'>
		</form>
			
	</div>
	
	<%@ include file='/game/modal_call_tvt.jsp' %>
	<!-- 이 밑으로는 modal_call_tvt -->