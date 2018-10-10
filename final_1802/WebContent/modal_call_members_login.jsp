<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
							<a href="#.">Forget Password</a>
						</div>
					</div>
				</div>
				<br/>
				<br/>
				<form name="frm_mbr_login" method="post" class="frm_mbr_login form-horizontal">
		
					<div class="form-group">
						<label for="mbr_login_id" class="col-sm-3 control-label"> 아이디 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_id" id="mbr_login_id" class="form-control" value="" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_login_pwd" class="col-sm-3 control-label"> 비밀번호 </label>
						<div class="col-sm-8">
							<input type="password" name="mbr_pwd" id="mbr_login_pwd" class="form-control" value="" placeholder="">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer" id ="modal_call_members_login_footer">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" name="btn_login">LOGIN</button>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" name="btn_register" data-dismiss="modal"
						 data-toggle="modal" data-target="#modal_call_members_register">REGIT</button>
				</div>
				<div class="col-sm-4">
					<div class="col-sm-12 form-inline">
						<div class="col-sm-12">
							<a href="#."><i class="fa fa-facebook"></i>네이버 로그인</a>
						</div>
						<div class="col-sm-12">
							<a href="#."><i class="fa fa-google"></i>카카오 로그인</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>