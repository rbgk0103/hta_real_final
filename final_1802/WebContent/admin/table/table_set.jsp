<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal -->

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h4 class="modal-title" id="myModalLabel">TABLE NO.${param.tbl_no}</h4>
</div>
<form id = 'frm_table_set' >
	<div class="modal-body">
		<div id = 'set_gender' >
			<label>성별</label>
			<select name = 'guest_gender' id ='guest_gender' class="guest_gender form-control">
				<option value = 'man' selected>남자</option>
				<option value = 'woman'>여자</option>
				<option value = 'seam'>합석</option>
			</select>
		</div>
		<div id = 'set_count'>
			<label>인원수</label>
			<input type ='text' name = 'guest_cnt' id='guest_cnt' class="form-control">
		</div>
		<input type='hidden' name = 'tbl_no' id = 'tbl_no' value = '${param.tbl_no}'>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary btn_table_set" id ='btn_submit'>Setting</button>
		<button type="button" class="btn btn-default" id = 'modal_cancel' data-dismiss="modal">Close</button>
	</div>
</form>
<SCRIPT>
	$('#btn_submit').click(function(){
		var param = $('#frm_table_set').serialize();
		$("#frm_table_set").attr("action","table_set.adm?"+param).submit();
	});
	
	$('#modal_cancel').click(function(){
		window.location.reload();
	});
</SCRIPT>

