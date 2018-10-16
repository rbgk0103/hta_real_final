<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <!-- Modal -->
<%

%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h4 class="modal-title" id="myModalLabel">TABLE NO.${param.tbl_no }</h4>
</div>
<form id = 'frm_table_detail' >
<input type='hidden' id = 'tbl_no' name ='tbl_no' value = '${param.tbl_no }'>
<input type='hidden' id = 'guest_no' name ='guest_no' value = '${param.guest_no }'>
	<div class="modal-body">
		<table class="table">
		    <tr>
		        <th style="width: 10px">No</th>
		        <th>Menu</th>
		        <th>Quantity</th>
		        <th style="">Price</th>
		    </tr>
		    <c:set var = "cnt" value = "0"/>
			<c:forEach var="item" items="${list_orders}">
				<c:set var = "cnt" value = "${cnt+1}"/>
			    <tr>
			        <td>${cnt }</td>
			        <td>${item.menu_name }</td>
			        <td>
			           ${item.os_qty }
			        </td>
			        <td>${item.os_price }</td>
			    </tr>
		    </c:forEach>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" id = 'btn_delete'>삭제하기</button>
		<button type="button" class="btn btn-primary" id = 'btn_submit'>결제하기</button>
		<button type="button" class="btn btn-default" id ='modal_cancel' data-dismiss="modal">Close</button>
	</div>
</form>
<script>
/* $('#btn_submit').click(function(){
	var param = $('#frm_table_detail').serialize();
	alert("param = " + param);
	$("#frm_table_set").attr("action","table_set.adm?"+param).submit();
});
 */
$('#btn_delete').click(function(){
	var param = $('#frm_table_detail').serialize();
	alert("param = " + param);
	$("#frm_table_detail").attr("action","table_set_delete.adm?"+param).submit();
});




$('#modal_cancel').click(function(){
	window.location.reload();
});
</script>