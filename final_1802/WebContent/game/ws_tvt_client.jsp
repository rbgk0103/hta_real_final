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
var tvtMsgArr;

$(document).ready(function(){
	
	
	/*
	1,1,gt_pacman.png,팩맨,fury_2.jpg,치즈콘비엔날레
	*/
	/* 웹소켓 */
	var tvtWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

		tvtWebSocket.onopen = function() {
		$('#result').html("연결 성공!!!!");

		}

		tvtWebSocket.onmessage = function(msg) {
			
			// 도전자 테이블번호, 도전받는 테이블번호,게임타이틀이미지,게임타이틀이름, 메뉴이미지, 메뉴이름 
			tvtMsgArr = msg.data.split(',');	
			
			if (tvtMsgArr[1] === '${tblVo.tbl_no}') {	// 자기 테이블 번호에게 대전신청이 들어오면
				
				$('#modal_tvt_tblNoA').text(tvtMsgArr[0]);	
			
				$('#modal_tvt_gt_img').attr("src", './img/game_img/' + tvtMsgArr[2]);
				$('#modal_tvt_gtName').text(tvtMsgArr[3]);
				
				$('#modal_tvt_menu_img').attr("src", './admin/menu/menuImg/' + tvtMsgArr[4]);
				$('#modal_tvt_menuName').text(tvtMsgArr[5]);
				
			
				// 모달을 띄운다
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
		
		<input type='text' id='msg' style='display:hidden' /> 
		<input type='button' value='send' id='btnSend' style='display:hidden' />
		
		<a href='#' data-toggle='modal' data-target='#modal_call_tvt'>
			<input type='button' value='모달띄우기' id='btn_tvt_modal' style='display:hidden' />
		</a>
		
	</div>
	
	<%@ include file='/game/modal_call_tvt.jsp' %>
	<!-- 이 밑으로는 modal_call_tvt -->