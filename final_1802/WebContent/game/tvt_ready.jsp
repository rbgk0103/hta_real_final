<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

$(document).ready(function(){
var ftr = document.frm_tvt_ready;

// 타이머용 시간 설정
var count = 30;		
var timerId = 0;

	
	var tvtWebSocket = new WebSocket(
	'ws://192.168.0.7:7080/final_1802/gameBroadcasting');

	tvtWebSocket.onopen = function() {
		$('#tvt_ready_wrap #result').html("연결 성공!!!!");
	}

	tvtWebSocket.onmessage = function(msg) {
		var tvtAcceptMsgArr = msg.data.split(',');
		
		// 상대로부터 [도전수락] 받은 경우
		if (tvtAcceptMsgArr[0] == '${tblVo.tbl_no}' && tvtAcceptMsgArr[6] == 'accept') {
			
			ftr.tvtAcceptMsg.value = msg.data;
			ftr.method = 'GET';
		    ftr.action = './tvtPlay.game';
		    ftr.submit();
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
			$('#timer_text').text('${tbl_u}번 테이블로부터 수락여부를 기다리는 중... ' + count +'초');
			
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
	<h3>대전신청할 준비가 되었습니다</h3>
	
	<form id='frm_tvt_ready' name='frm_tvt_ready'>
		<div id='tvt_ready_view'>
			<div id='tvt_info_tbl'>
					<h3>${tbl_u}번 테이블에 대전신청 하시겠습니까?</h3>
			</div>
			<div id='tvt_info_gt_and_menu'>
				<div id='tvt_info_gt'>
					<img src='img/game_img/${gtVo.gtImage}' width='400' height='400' />
					<h4>${gtVo.gtName}</h4>
				</div>
				<div id='tvt_info_menu'>
					<img src='admin/menu/menuImg/${menuVo.menu_image}' />
					<h4>${menuVo.menu_name}</h4>
				</div>
			</div>
			<div id='tvt_info_notice'>
			</div>
			
			<div id='tvt_req'>
				<input type='button' id='btn_req' name='btn_req' value='대전신청' />
				<input type='button' id='btn_req' name='btn_cancel' value='취소' />
			</div>
			
			<div id='timer_area'><p/>
			<h4><span id='timer_text'></span></h4>
			</div>
			
			<div>
				<input type='hidden' name='tvtAcceptMsg' />
			</div>
						
		</div>
	</form>
</div>
