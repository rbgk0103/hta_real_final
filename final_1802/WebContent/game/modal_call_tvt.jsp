

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="modal fade" id="modal_call_tvt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id ='modal_call_tvt_header'>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel" style='color:black; background-color: green'>테이블vs테이블 게임요청 </h4>
			</div>
			<div class="modal-body">
			
			
				<div id ='modal_call_tvt_text' style='color:red'>
					<ul>
						<li>도전자의 테이블번호: 
							<span id='modal_tvt_tblNoA'></span>
						</li>
					</ul>
				</div>
				<div id='modal_call_tvt_gt_and_menu' style='border:1px solid gray; text-align:center'>
					<div id='modal_call_tvt_gt' style='display: inline-block; width: 46%'>
						<img id='modal_tvt_gt_img' src='https://via.placeholder.com/350x150'/>
						<h3 id='modal_tvt_gtName' style='color:black'></h3>
					</div>
					<div id='modal_call_tvt_menu' style='display: inline-block; width: 46%;'>
						<img id='modal_tvt_menu_img' src='https://via.placeholder.com/350x150'/>
						<h3 id='modal_tvt_menuName' style='color:black'></h3>
					</div>
						
					
				</div>
				
			</div>
			<div class="modal-footer" id ="modal_call_tvt_footer">
				<button type="button" class="btn btn-primary" id='modal_call_tvt_footer_commit'>도전 수락</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
  </div>

</div>
