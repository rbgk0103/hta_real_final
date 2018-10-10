<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Modal -->

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h4 class="modal-title" id="myModalLabel">TABLE NO.${param.tbl_no }</h4>
</div>
<form id = 'frm_table_detail' >
<input type='hidden' id = 'tbl_no' value = '${param.tbl_no }'>
	<div class="modal-body">
		<table class="table">
		    <tr>
		        <th style="width: 10px">No</th>
		        <th>Menu</th>
		        <th>Quantity</th>
		        <th style="">Price</th>
		    </tr>
		    <tr>
		        <td>1.</td>
		        <td>제육볶음</td>
		        <td>
		           3
		        </td>
		        <td>13000</td>
		    </tr>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" id = 'btn_delete'>삭제하기</button>
		<button type="button" class="btn btn-primary" id = 'btn_submit'>결제하기</button>
		<button type="button" class="btn btn-default" id ='modal_cancel' data-dismiss="modal">Close</button>
	</div>
</form>
<script>
$('#btn_submit').click(function(){
	var param = $('#frm_table_set').serialize();
	alert("param = " + param);
	$("#frm_table_set").attr("action","table_set.adm?"+param).submit();
});

$('#modal_cancel').click(function(){
	window.location.reload();
});
</script>