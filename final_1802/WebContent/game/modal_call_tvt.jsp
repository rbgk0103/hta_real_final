

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="modal fade" id="modal_call_tvt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id ='modal_call_employee_header'>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">테이블vs테이블 게임요청 </h4>
			</div>
			<div class="modal-body">
				<div id ='modal_call_employee_text' style='color:red'>
					필요하신 것을 체크해 주세요...
				</div>
				
				<div id ='modal_call_employee_check'>
					<form name='call_employee_frm' method='post'>
						<label><input type="checkbox" name='request' value='물' >물</label>
						<label><input type="checkbox" name='request' value='수저'>수저</label>
						<label><input type="checkbox" name='request' value='젓가락'>젓가락</label>
						<label><input type="checkbox" name='request' value='물티슈'>물티슈</label>
						<label><input type="checkbox" name='request' value='휴지'>휴지</label>
					</form>
				</div>
			</div>
			<div class="modal-footer" id ="modal_call_employee_footer">
				<button type="button" class="btn btn-primary" id='modal_call_employee_footer_commit'>호출하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
  </div>

</div>
