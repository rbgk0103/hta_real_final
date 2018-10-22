<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

#tp_wrap {
	text-align: center;
}

#tp_wrap div{
	border: 1px solid gray;
}

#tp_wrap #tp_ground {
	display:inline-block;
	width: 80%;
}

#tp_wrap #tp_middle {
	overflow:hidden;
}

#tp_wrap #tp_user1, #tp_wrap #tp_user2 {
	float: left;
	display:inline-block;
	width: 46%;
	margin: 0.5%;
}

#tp_wrap .tp_user_game {
	display: inline-block;
	height: 550px;
}

</style>

<script>
var tpInfoArr = '${tvtAcceptMsg}'.split(','); 
var tvtPlayWebSocket;

$(document).ready(function(){
	alert(tpInfoArr[0]);
	
	$('#tp_user2_game_real').show();
	$('#tp_user2_game_img').hide();
	
	
	
	$('#user1_tblNo').text(tpInfoArr[0]);
	$('#user2_tblNo').text(tpInfoArr[1]);
	
	
 	tvtPlayWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

	tvtPlayWebSocket.onopen = function() {
	}
	
	tvtPlayWebSocket.onmessage = function(msg) {
		var msgArr = msg.data.split(',')
		
		if (msgArr[0] == 'user1') {
			$('#tp_user1_final_score').text(msgArr[1]);
			
		}else if (msgArr[0] == 'user2') {
			$('#tp_user2_final_score').text(msgArr[1]);
			$('#tp_user2_game_real').hide();
			$('#tp_user2_game_img').show();
		}
		
		
		
		
		
	}
	
	tvtPlayWebSocket.onclose = function() {
	} 

}); // end of jQuery
    
</script>

<div id='tp_wrap'>
	

	<div id='tp_ground'>
		<div id='tp_top'>
			<h3>테이블 대전 - 즐겜하세요! ${tvtAcceptMsg}</h3>
		</div>
		<div id='tp_middle'>
			<div id='tp_user1'>
				<div class='tp_user_title'>
					<h4><span id='user1_tblNo'></span>번 테이블(도전 신청자)</h4>
				</div>
				<div class='tp_user_game'>
					<img src='img/game_img/pacman_playing.png' />
				</div>
				<div class='tp_user_status'>
					<h3>점수: <span id='tp_user1_final_score'></span></h3>
				</div>
			</div>
			<div id='tp_user2'>
				<div class='tp_user_title'>
					<h4><span id='user2_tblNo'></span>번 테이블(도전 수락자)</h4>
				</div>
				<div class='tp_user_game'>
					<div id='tp_user2_game_real'>
						<%@ include file='./pacman_mod_bong2/pacman_index.jsp' %>
					</div>
					<div id='tp_user2_game_img'>
						<img src='img/game_img/pacman_end.png'/>
					</div>
				</div>
				<div class='tp_user_status'>
					<h3>점수: <span id='tp_user2_final_score'></span></h3>
				</div>
			</div>
		</div>
		<div id='tp_bottom'>
		</div>
	</div>
</div>


