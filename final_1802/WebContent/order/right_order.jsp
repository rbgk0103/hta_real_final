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
<!-- 	<div id='now_order'> -->
<!-- 		<span id='now'>주문 금액</span> -->
<!-- 		<span id='now_price'>7,900원</span>	 -->
	</div>
	<div id='to_order' onclick='append_data_modal()' data-toggle="modal" data-target="#myModal" >주문하기</div>
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
function orderMenu(){
	var param = $('#right_frm').serialize();
	if (param === ""){
		alert("메뉴를 선택해주세요.");
	} else{
		$('#content').load('orderMenu.ord', param);
	}
}


$('#all_order').click(function(){
	var param = $('#right_frm').serialize();
	$('#all_order').load('viewList.ord');
  	tbl_no = ${tblVo.tbl_no};
    guest_no = ${tblVo.guest_no};
	alert("얍얍");
    $('div.hey123').modal({remote : './order/modal_show_order_list.jsp', backdrop: 'static'});
 
})
</script>