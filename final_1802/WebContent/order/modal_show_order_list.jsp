<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-body">
	<div id ='modal_call_employee_text' style='color:black'>
		주문 내역뽜뽜
	</div>
	
	<div id ='modal_call_employee_check' style='color:black'>
		<table class='table'>
			<tbody id='listZone'>
				<tr><th>메뉴</th><th>수량</th><th style="">가격</th><th style="width: 10px"></th></tr>
				<c:forEach var='ol' items='${orderList }'>
					<tr><td>${ol.menu_name }</td><td>${ol.os_qty }</td><td>${ol.os_price }</td><td style="width: 10px"></td></tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="modal-footer" id ="modal_show_order_list_footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>

