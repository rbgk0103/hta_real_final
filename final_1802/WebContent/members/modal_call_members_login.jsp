<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
<div class="modal fade" id="modal_call_members_login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header" id ='modal_call_members_login_header'>
				<h3>LOGIN YOUR ACCOUNT</h3>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="col-sm-9"></div>
					<div class="col-sm-3">
						<div class="margin-0 margin-top-20">
							<a data-dismiss="modal" data-toggle="modal" data-target="#modal_call_members_findInfo">Forget Password</a>
						</div>
					</div>
				</div>
				<br/>
				<br/>
				<form name="frm_mbr_login" id="frm_mbr_login" method="post" class="frm_mbr_login form-horizontal">
		
					<div class="form-group">
						<label for="mbr_login_id" class="col-sm-3 control-label"> 아이디 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_id" id="mbr_login_id" class="form-control" value="" autocomplete="off" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_login_pwd" class="col-sm-3 control-label"> 비밀번호 </label>
						<div class="col-sm-8">
							<input type="password" name="mbr_pwd" id="mbr_login_pwd" class="form-control" value="" autocomplete="off" placeholder="">
						</div>
					</div>
					<input type="hidden" name="tbl_no" id="mbr_tbl_no" class="form-control" value="" autocomplete="off" placeholder=""/>
				</form>
				<div id="mbr_login_result"></div>
			</div>
			<div class="modal-footer" id ="modal_call_members_login_footer">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-success btn-lg" name="btn_mbr_login" id="btn_mbr_login">LOGIN</button>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" name="btn_close" id="btn_modal_close" data-dismiss="modal">CANCEL</button>
				</div>
				<div class="col-sm-4"></div>
			</div>
			
		</div>
	</div>
</div>

<script>
	$("#btn_mbr_login").click(function(){
		var param = $("#frm_mbr_login").serialize();
		$("#mbr_login_result").load("./login.mbr", param);
	})
	$("#btn_modal_close").click(function(){
		window.location.reload();
	})
</script>