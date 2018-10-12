<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<div class="modal fade" id="modal_call_members_findInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header" id ='modal_call_members_findInfo_header'>
				<h3>FIND YOUR INFOMATION</h3>
			</div>
			<div class="modal-body">
				<br/>
				<form name="frm_mbr_findInfo" id="frm_mbr_findInfo" method="post" class="frm_mbr_findInfo form-horizontal">
		
					<div class="form-group">
						<label for="mbr_findInfo_name" class="col-sm-3 control-label"> 이름 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_name" id="mbr_findInfo_name" class="form-control" value="" autocomplete="off" placeholder="ex) 김민수">
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_findInfo_phone" class="col-sm-3 control-label"> 연락처 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_phone" id="mbr_findInfo_phone" class="form-control" value="" autocomplete="off" placeholder="ex) 01075029632">
						</div>
					</div>
					<br/>
				</form>
				<div id="mbr_info_result"></div>
			</div>
			<div class="modal-footer" id ="modal_call_members_findInfo_footer">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-success btn-lg" name="btn_mbr_findInfo" id="btn_mbr_findInfo">FIND</button>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" name="btn_mbr_login" data-dismiss="modal"
						 data-toggle="modal" data-target="#modal_call_members_login">LOGIN</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("#btn_mbr_findInfo").click(function(){
		var param = $("#frm_mbr_findInfo").serialize();
		$("#mbr_info_result").load("./findInfo.mbr", param);
	})
</script>