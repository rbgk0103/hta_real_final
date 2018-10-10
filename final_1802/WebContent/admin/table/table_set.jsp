<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h4 class="modal-title" id="myModalLabel">TABLE NO.${param.tbl_no}</h4>
</div>
<div class="modal-body">
	<div id = 'set_gender' >
		<label>성별</label>
		<select id ='guest_gender' class="guest_gender form-control">
			<option value = 'man'>남자</option>
			<option value = 'woman'>여자</option>
			<option value = 'seam'>합석</option>
		</select>
	</div>
	<div id = 'set_count'>
		<label>인원수</label>
		<input type ='text' id='guest_cnt' class="form-control">
	</div>
	<input type='hidden' id = 'table_no' value = '1'>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary btn_table_set">Setting</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>

