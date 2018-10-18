<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
// 타이머용 시간 설정

$(document).ready(function(){
var count = 30;
var timerId = 0;
	
	var tvtWebSocket = new WebSocket(
	'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

	tvtWebSocket.onopen = function() {
		$('#tvt_ready_wrap #result').html("연결 성공!!!!");
	}

	tvtWebSocket.onmessage = function(msg) {
		var tvtAcceptMsgArr = msg.data.split(',');
		if (tvtAcceptMsgArr[0] == '${tblVo.tbl_no}' && tvtAcceptMsgArr[6] == 'accept') {
			alert(tvtAcceptMsgArr[1] + '번 테이블로부터  수락을 받앗다');
			location.href = './tvtPlay.game';
		}
	}

	tvtWebSocket.onclose = function() {
		$('#tvt_ready_wrap #result').html("연결 종료");
	}

	
	// [대전신청] 버튼을 누르면
	$('#tvt_ready_wrap #btn_req').click(function() {
		// 내 테이블번호,상대 테이블번호,게임타이틀이미지,게임타이틀이름, 메뉴이미지, 메뉴이름
		tvtMsg = '${tblVo.tbl_no},'				// 내 테이블번호
		 	   + '${tbl_u},'	 				// 상대 테이블번호
		 	   + '${gtVo.gtImage},'				// 게임타이틀이미지	
		 	   + '${gtVo.gtName},'				// 게임타이틀이름
		 	   + '${menuVo.menu_image},'		// 메뉴이미지
		 	   + '${menuVo.menu_name}';			// 메뉴이름
	   	tvtWebSocket.send(tvtMsg)
		 	   
	   	
	   	// 타이머 가동
		timerId = setInterval(function() {
			console.log('이봉기');
			count--;
			$('#timer_text').val(count);
			
			// 남은시간 0초 되면
			if (count === 0) {
				clearInterval(timerId);
			}
			
			
		}, 1000);
	   	
	   	
	}) // End of [도전신청] 클릭

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

	}); // End of jQuery


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
				<input type='button' id='btn_req' name='btn_req' value='대전신청' />
				<input type='button' id='btn_req' name='btn_cancel' value='취소' />
			</div>
			
			<div id='timer_area'>
			<label>${tbl_u}로부터 응답을 기다리는 중...(30초 제한)</label>&nbsp;
			<input type='text' id='timer_text' />
			</div>
			
		</div>
	</form>
</div>
