<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="modal_call_employee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id ='modal_call_employee_header'>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">직원 호출</h4>
			</div>
			<div class="modal-body">
				<div id ='modal_call_employee_text'>
					필요하신 것을 체크해 주세요...
				</div>
				
				<div id ='modal_call_employee_check'>
					<form name='call_employee_frm' method='post'>
						<label><input type="checkbox" name='request' value='물'>물</label>
						<label><input type="checkbox" name='request' value='수저'>수저</label>
						<label><input type="checkbox" name='request' value='젓가락'>젓가락</label>
						<label><input type="checkbox" name='request' value='물티슈'>물티슈</label>
						<label><input type="checkbox" name='request' value='휴지'>휴지</label>
					</form>
				</div>
				
				
			</div>
			<div class="modal-footer" id ="modal_call_employee_footer">
				<button type="button" class="btn btn-primary" id='modal_call_employee_footer_commit'>호출하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
  </div>

</div>


<script>

$().ready(function(){
	var req = '';
	var tableNo = ${tblVo.tbl_no};
	var tableIp = ${tblIp};
	var delete_row = 0;
	console.log("테이블: " + tableNo);
	
	var webSocket_request = new WebSocket('ws://192.168.0.21:7080/final_1802/request');
	
	webSocket_request.onopen = function() {
// 		$('#chatContent').append("연결 성공!!!!, tableNo : " + tableNo + " ipCut : " + ipCut);
	
		console.log(${tblIp} + "번이 " + ${tblVo.tbl_no} + "테이블에서  연결성공");
	}

	webSocket_request.onmessage = function(msg) {
		//msg.data.substring(0, 1) : 자신의 table 번호
		//자기 자신이 보낸 메세지일 경우 div class=send, TableNo 사용
		
		$('#call_employee').append(msg.data);
		//메세지 오면 스크롤 아래로
// 		$("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
	}

	webSocket_request.onclose = function() {
// 		$('#chatContent').append("연결 종료");
		console.log("연결종료");
	}
	
	
	function sendMessage() {
		delete_row++;
		var message = "<li class = 'call_employee_row"+delete_row+"' onclick='delete_row("+delete_row+")'><label>[ TABLE NO."+tableNo+" ]</label><span>"+ req +"요청</span></li>";
		if ($.trim(message) !== "") {
			webSocket_request.send(message);
		}
 		console.log(message);
	}

	$('#modal_call_employee_footer_commit').click(function(){
		var chkbox = document.getElementsByName("request");
		req = '';
		for (var i=0 ; i<chkbox.length ; i++){
			if (chkbox[i].checked){
				req += chkbox[i].value + '  ';
			}
		}

		sendMessage();
	});

// window.onload = function() {
	
// 	console.log("스크립틀릿의 ip : " + $('#ip').val());
// 	var ip = $('#ip').val();
// 	var ipCut = ip.substr(ip.length-2, ip.length);
	
// 	//자신의 ip로 테이블 번호를 데이터베이스에서 꺼내옴 = tableNo
// 	var tableNo = ${tblVo.tbl_no};
// 	console.log("테이블: " + tableNo);
// 	var webSocket = new WebSocket('ws://192.168.0.26:7080/final_1802/request_list');
	
// 	console.log("도큐멘트 tableNo의 value = " + document.getElementById(tableNo).value);
// 	console.log("자른 ip : " + ipCut);
	



// 	function sendMessage() {
// 		var message = $('#msg').val();
// 		if ($.trim(message) !== "") {
// 			webSocket.send(tableNo + message + ipCut);
// 		}
// 		$('#msg').val("");	//textarea 지움
// 	}
// }
})

	
</script>
