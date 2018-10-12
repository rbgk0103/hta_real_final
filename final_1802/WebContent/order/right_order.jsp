<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='right_order'>
	<span id='order_list'>주문서</span>
	<div id='order_status'>
		<form name='right_frm' id='right_frm' method='post'>
		<table  class='table'>
			<tbody id='tableZone'>
				<tr><th>메뉴</th><th>수량</th><th style="">가격</th><th style="width: 10px"></th></tr>
			</tbody>
		</table>
		</form>	
	</div>
	<div id='pre_order'>
		<span id='previous'>이전 주문 금액:</span>
		<span id='pre_price'>21,000원</span>
	</div>
	<div id='now_order'>
		<span id='now'>주문 금액</span>
		<span id='now_price'>7,900원</span>	
	</div>
	<div id='to_order' onclick='append_data_modal()' data-toggle="modal" data-target="#myModal">주문하기</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">주문 내용을 확인해주세요.</h4>
      </div>
      <div class="modal-body">
  	 	<table class="table" id='tableModal' style='color:black'></table>
      </div>
      <div class="modal-footer">
        <button type="button"  onclick='orderMenu()' class="btn btn-primary">주문하기</button>
        <button type="button"  class="btn btn-default" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>

<script>
function orderMenu(){
	var param = $('#right_frm').serialize();
	$('#myModal').load('orderMenu.ord', param);
	console.log("주~문");
	
}
</script>