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

#tp_wrap #tp_user1, #tp_wrap #tp_user2 {
	display:inline-block;
	width: 46%;
	margin: 0.5%;
}

</style>

<script>
var tpInfoArr = '${tvtAcceptMsg}'.split(','); 

$(document).ready(function(){
	
	$('#user1_tblNo').text(tpInfoArr[0]);
	$('#user2_tblNo').text(tpInfoArr[1]);
	
	
 	var tvtPlayWebSocket = new WebSocket(
		'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

	tvtPlayWebSocket.onopen = function() {
	}
	
	tvtPlayWebSocket.onmessage = function(msg) {
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
					<h4><span id='user1_tblNo'></span>번 테이블</h4>
				</div>
				<div class='tp_user_game'>
					<%@ include file='./pacman_mod_bong/pacman_index.jsp' %>
				</div>
				<div class='tp_user_status'>
				</div>
			</div>
			<div id='tp_user2'>
				<div class='tp_user_title'>
					<h4><span id='user2_tblNo'></span>번 테이블</h4>
				</div>
				<div class='tp_user_game'>
				</div>
				<div class='tp_user_status'>
				</div>
			</div>
		</div>
		<div id='tp_bottom'>
		</div>
	</div>
</div>


