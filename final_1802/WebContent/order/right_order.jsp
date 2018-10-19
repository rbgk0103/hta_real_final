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
        <button type="button"  class="btn btn-primary" data-dismiss="modal" onclick='orderMenu()'>주문하기</button>
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


// $().ready(function(){
// 	var wantToPay = '';
// 	var tableNo = ${tblVo.tbl_no};
// 	var tableIp = ${tblIp};
// 	var delete_row = 0;
// 	console.log("테이블: " + tableNo);

// 	var webSocket_request = new WebSocket('ws://192.168.0.28:7080/final_1802/request');
	
// 	webSocket_request.onopen = function() {
	
// 		console.log(${tblIp} + "번이 " + ${tblVo.tbl_no} + "테이블에서  연결성공");
// 	}

// 	webSocket_request.onmessage = function(msg) {
// 		//msg.data.substring(0, 1) : 자신의 table 번호
// 		//자기 자신이 보낸 메세지일 경우 div class=send, TableNo 사용
		
// 		$('#call_employee').append(msg.data);
// 		//메세지 오면 스크롤 아래로
// // 		$("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
// 	}

// 	webSocket_request.onclose = function() {
// 		console.log("연결종료");
// 	}
	
	
// 	function sendMessage() {
// 		delete_row++;
// 		var message = "<li class = 'call_employee_row"+delete_row+"' onclick='delete_row("+delete_row+")'><label>[ TABLE NO."+tableNo+" ]</label><span>"+ wantToPay +"요청</span></li>";
// 		if ($.trim(message) !== "") {
// 			webSocket_request.send(message);
// 		}
//  		console.log(message);
// 	}
// }


function orderMenu(){
	var param = $('#right_frm').serialize();
	if (param === ""){
		alert("메뉴를 선택해주세요.");
	} else{
		$('#content').load('orderMenu.ord', param);
	}
}


$('#all_order').click(function(){
// 	var param = $('#right_frm').serialize();
// 	$('#listZone').load('viewList.ord', param);
    $('div.hey123').modal({remote : 'viewList.ord?tbl_no='+${tblVo.tbl_no}+'&g_no='+${tblVo.guest_no}, backdrop: 'static'});
 
});

$('#now_order').click(function(){
	var wantToPay = '결제하기를 선택하시면 태블릿 서비스 이용이 제한됩니다. \n 결제하시겠습니까?'
	if(confirm(wantToPay)){
		$('#header_menu').css('display', 'none');
// 		sendMessage();
		$('#content').load('./order/to_want_to_pay.jsp');
	}
});




</script>