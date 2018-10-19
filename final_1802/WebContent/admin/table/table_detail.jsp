<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <!-- Modal -->
<style>
#table_detail_tot_price{width: 100%;text-align: center;font-size: 20px;font-weight: bold;padding: 10px 0;}
#table_detail_pay_type {
text-align:center;
}
#table_detail_pay_type label{
	display:inline-block;
	background-color: #fff;
    font-size: 20px;
    border-radius: 7px;
        width: 150px;
    text-align: center;
    height: 50px;
    line-height: 45px;
}
#table_detail_pay_type label input:checked+span{    
    display: inline-block;
    border: 1px solid #39435C;
    background-color: #39435C;
    color: #fff;
    font-size: 20px;
    border-radius: 7px;
    width: 150px;
    text-align: center;
    height: 50px;
    line-height: 45px;
}

#btn_submit{background-color: #39435C;}
</style>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h4 class="modal-title" id="myModalLabel">TABLE NO.${param.tbl_no }</h4>
</div>
<form id = 'frm_table_detail' >
	<c:set var = "tot_price" value = "0"/>
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
			 <c:set var = "tot_price" value = "${tot_price + item.os_price}"/>
		    </c:forEach>
		</table>
		<div id = 'table_detail_pay_type'>
			<label><input style="display:none" value ="cash" type = "radio" name = "pay_type" checked><span>현금</span></label>
			<label><input style="display:none" value ="card" type = "radio" name = "pay_type"><span>카드 </span> </label>
		</div>
		
		<div id = 'table_detail_tot_price'>
			<span>총 금액 : ${tot_price }</span>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" id = 'btn_delete'>삭제하기</button>
		<button type="button" class="btn btn-primary" id = 'btn_submit'>결제하기</button>
		<button type="button" class="btn btn-default" id ='modal_cancel' data-dismiss="modal">취소</button>
	</div>
	
	<input type='hidden' id = 'tbl_no' name ='tbl_no' value = '${param.tbl_no }'>
	<input type='hidden' id = 'guest_no' name ='guest_no' value = '${param.guest_no }'>
	<input type='hidden' id = 'tot_price' name ='tot_price' value = '${tot_price }'>
	
</form>

<script>
$('#btn_submit').click(function(){
	var param = $('#frm_table_detail').serialize();
	alert("param = " + param);
	$("#frm_table_detail").attr("action","table_pay.adm?"+param).submit();
});

$('#btn_delete').click(function(){
	var param = $('#frm_table_detail').serialize();
	alert("param = " + param);
	$("#frm_table_detail").attr("action","table_set_delete.adm?"+param).submit();
});




$('#modal_cancel').click(function(){
	window.location.reload();
});
</script>