<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='right_order'>
	<span id='order_list'>주문서</span>
	<div id='order_status'>
		<form name='right_frm' id='right_frm' method='post'>
			<input type='hidden' name='ord_tbl_no' value='${tblVo.tbl_no}'/>
			<input type='hidden' name='guest_no'   value='${tblVo.guest_no}'/>
		<table  class='table'>
			<tbody id='tableZone'>
				<tr><th>메뉴</th><th>수량</th><th style="">가격</th><th style="width: 10px"></th></tr>
			</tbody>
		</table>
		</form>	
	</div>
	<div id='all_order'>
		<span id='previous'>총 주문 내역</span>
	</div>
	<div id='to_order' onclick='append_data_modal()' data-toggle="modal" data-target="#myModal" >주문하기</div>
	<div id='now_order'>
		<span id='now'>결제하기</span>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style='color:black'>주문 내용을 확인해주세요.</h4>
      </div>
      <div class="modal-body">
  	 	<table class="table" id='tableModal' style='color:black'></table>
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-primary" data-dismiss="modal" id='orderMenu'>주문하기</button>
        <button type="button"  class="btn btn-default" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade hey123">
	<div class="modal-dialog">
		<div class="modal-content">
		</div>
  	</div>
</div>
<script>


$(document).ready(function(){
	var ment = '';
	var tableNo = ${tblVo.tbl_no};
	var tableIp = ${tblIp};
	var delete_row = 0;
	console.log("테이블: " + tableNo);

	var AdminWebSocket = new WebSocket('ws://192.168.0.26:7080/final_1802/index');
	
	AdminWebSocket.onopen = function() {
	
		console.log(${tblIp} + "번이 " + ${tblVo.tbl_no} + "테이블에서  연결성공");
	}

	AdminWebSocket.onmessage = function(msg) {
		//msg.data.substring(0, 1) : 자신의 table 번호
		//자기 자신이 보낸 메세지일 경우 div class=send, TableNo 사용
		
		$('#call_employee').append(msg.data);
		//메세지 오면 스크롤 아래로
// 		$("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
	}

	AdminWebSocket.onclose = function() {
		console.log("연결종료");
	}
	
	
	function sendMessage() {

		var message = ${tblVo.tbl_no}+ "번 테이블에서 주문이 들어왔습니다";
		if ($.trim(message) !== "") {
			AdminWebSocket.send(message);
		}
 		console.log(message);
	}

	// 결제요청
	$('#now_order').click(function(){
		var wantToPay = '결제하기를 선택하시면 태블릿 서비스 이용이 제한됩니다. \n 결제하시겠습니까?'
		if(confirm(wantToPay)){
			ment = '결제';
			$('#header_menu').css('display', 'none');
			sendMessage();
			$('#content').load('./order/to_want_to_pay.jsp');
		}
	});
	
	// 주문요청
	$('#orderMenu').click(function(){
		var param = $('#right_frm').serialize();
		if (param === ""){
			alert("메뉴를 선택해주세요.");
		} else{
			ment = '주문';
			sendMessage();
			$('#content').load('orderMenu.ord', param);
			alert('주문이 완료되었습니다.');
		}
	});
	
});



$('#all_order').click(function(){
// 	var param = $('#right_frm').serialize();
// 	$('#listZone').load('viewList.ord', param);
    $('div.hey123').modal({remote : 'viewList.ord?tbl_no='+${tblVo.tbl_no}+'&g_no='+${tblVo.guest_no}, backdrop: 'static'});
 
});





</script>