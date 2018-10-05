<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="modal_call_employee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id ='modal_call_employee_header'>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">직원 호출</h4>
			</div>
			<div class="modal-body">
				<div id ='modal_call_employee_text'>
					필요하신 것을 체크해 주세요...
				</div>
				
				<div id ='modal_call_employee_check'>
					<label><input type="checkbox">물</label>
					<label><input type="checkbox">수저</label>
					<label><input type="checkbox">젓가락</label>
					<label><input type="checkbox">물티슈</label>
					<label><input type="checkbox">휴지</label>
				</div>
				
				
			</div>
			<div class="modal-footer" id ="modal_call_employee_footer">
				<button type="button" class="btn btn-primary" id='modal_call_employee_footer_commit'>호출하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
  </div>
</div>