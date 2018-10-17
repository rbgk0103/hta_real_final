

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="modal fade" id="modal_call_tvt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id ='modal_call_tvt_header'>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel" style='color:black; background-color: green'>테이블vs테이블 게임요청 </h4>
			</div>
			<div class="modal-body">
			
			
			
			
				<div id ='modal_call_tvt_text' style='color:red'>
					<ul>
						<li>도전자의 테이블번호: ${tblVo.tbl_no}</li>
						<li>
					</ul>
				</div>
				<div id='modal_call_tvt_gt_and_menu'>
					<div id='modal_call_tvt_gt'>
						<img src='./img/game_img/${gtVo.gtImage}'/>
						<h3>${gtVo.gtName }</h3>
					</div>
					<div id='modal_call_tvt_menu'>
						<img src='./admin/menu/menuImg/${menuVo.menu_image}'/>
						<h3>${menuVo.menu_name}</h3>
					</div>
					
				</div>
				
				<div id ='modal_call_tvt_check'>
					<form name='call_tvt_frm' method='post'>
						<label><input type="checkbox" name='request' value='물' >물</label>
						<label><input type="checkbox" name='request' value='수저'>수저</label>
						<label><input type="checkbox" name='request' value='젓가락'>젓가락</label>
						<label><input type="checkbox" name='request' value='물티슈'>물티슈</label>
						<label><input type="checkbox" name='request' value='휴지'>휴지</label>
					</form>
				</div>
			</div>
			<div class="modal-footer" id ="modal_call_tvt_footer">
				<button type="button" class="btn btn-primary" id='modal_call_tvt_footer_commit'>호출하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
  </div>

</div>
