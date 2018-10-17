<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
	var tvtWebSocket = new WebSocket(
	'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

	tvtWebSocket.onopen = function() {
		$('#tvt_ready_wrap #result').html("연결 성공!!!!");
	}

	tvtWebSocket.onmessage = function(msg) {
		$('#tvt_ready_wrap #result').append('<div>' + msg.data + '</div>');
	}

	tvtWebSocket.onclose = function() {
		$('#tvt_ready_wrap #result').html("연결 종료");
	}

	// 보내는 메시지
	$('#tvt_ready_wrap #btn_req').click(function() {
		// 내 테이블번호,상대 테이블번호,게임타이틀이미지,게임타이틀이름, 메뉴이미지, 메뉴이름
		tvtMsg = '${tblVo.tbl_no},'				// 내 테이블번호
		 	   + '${tbl_u},'	 				// 상대 테이블번호
		 	   + '${gtVo.gtImage},'				// 게임타이틀이미지	
		 	   + '${gtVo.gtName},'				// 게임타이틀이름
		 	   + '${menuVo.menu_image},'			// 메뉴이미지
		 	   + '${menuVo.menu_name}';			// 메뉴이름
	   tvtWebSocket.send(tvtMsg);
	})	
});

</script>    
    


<div id='tvt_ready_wrap'>
	<h3>tvt_ready</h3>
	
	<form id='frm_tvt_ready' name='frm_tvt_ready'>
		<div id='tvt_ready_view'>
			<div id='tvt_info_tbl'>
				<ul>
					<li>내 테이블번호: ${tblVo.tbl_no}</li>
					<li>상대 테이블번호: ${tbl_u}</li>
				</ul>
			</div>
			<div id='tvt_info_gt_and_menu'>
				<div id='tvt_info_gt'>
					<ul>
						<li>게임타이틀명: ${gtVo.gtName}</li>
					</ul>
					<img src='img/game_img/${gtVo.gtImage}' />
				</div>
				<div id='tvt_info_menu'>
					<ul>
						<li>메뉴명: ${menuVo.menu_name}</li>
					</ul>
					<img src='admin/menu/menuImg/${menuVo.menu_image}' />
				
				</div>
			</div>
			<div id='tvt_info_notice'>
			</div>
			
			<div id='tvt_req'>
				<input type='text' id='tvt_req_msg' />
			
				<input type='button' id='btn_req' name='btn_req' value='대전신청' />
				<input type='button' id='btn_req' name='btn_cancel' value='취소' />
			</div>
			<div id='result'></div>
			
		</div>
	</form>
</div>


