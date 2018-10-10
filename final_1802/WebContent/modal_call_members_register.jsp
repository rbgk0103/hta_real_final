<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
.mbr_radio {
	margin: 4px;
	background-color: #EFEFEF;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	overflow: auto;
	float: left;
}

.mbr_radio label {
	float: left;
	width: 4.0em;
}

.mbr_radio label span {
	text-align: center;
	padding: 3px 0px;
	display: block;
}

.mbr_radio label input {
	position: absolute;
	top: -20px;
}

.mbr_radio input:checked+span {
	background-color: #911;
	color: #fff;
}

.error {
	font-size: 10px;
	color: darkred;
	text-decoration: underline;
	margin-left: 45%;
}
</style>
<script>
// 	function chk() {
// 		ff = document.frm_mbr_register;
		
// 		var btn = document.getElementById("btn_mbr_register");
// 		ff.action = "./register.mbr";
// 		ff.submit();
		
// 		btn.onclick = function() {
// 			alert('aa');
// 			ff.mbr_id_error.value = "";
// 			ff.mbr_pwd_error.value = "";
// 			ff.mbr_name_error.value = "";
// 			ff.mbr_phone_error.value = "";
// 			ff.mbr_birth_error.value = "";
// 			ff.mbr_gender_error.value = "";

// 			if (!val(/^[A-Za-z0-9]{3,}$/, ff.mbr_id)) {
// 				return;
// 			} else if (!val(/^[A-Za-z]{1,}[A-Za-z0-9]{2,}$/, ff.mbr_pwd)) {
// 				return;
// 			} else if (!val(/^[가-힣A-Za-z]{2,}$/, ff.mbr_name)) {
// 				return;
// 			} else if (!val(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/, ff.mbr_phone)) {
// 				return;
// 			} else if (!val(/^[0-9]{6}$/, ff.mbr_birth)) {
// 				return;
// 			} else if (!val(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/, ff.mbr_gender)) {
// 				return;
// 			} else {
// 				ff.action = "./register.mbr";
// 				ff.submit();
// 			}
// 		}
// 	}

// 	function val(re, e) {
// 		if (re.test(e.value)) {
// 			return true;
// 		} else {
// 			e.focus();
// 			e.value = "";
// 			if (e == ff.mbr_id) {
// 				ff.mbr_id_error.value = "3자 이상의 영숫자를 입력해주세요.";
// 			} else if (e == ff.mbr_pwd) {
// 				ff.mbr_pwd_error.value = "3자 이상의 영숫자를 입력해주세요.";
// 			} else if (e == ff.mbr_name) {
// 				ff.mbr_name_error.value = "2자 이상의 한글과 영문자만 입력해주세요.";
// 			} else if (e == ff.mbr_phone) {
// 				ff.mbr_phone_error.value = "전화번호 양식에 맞게 입력해주세요";
// 			} else if (e == ff.mbr_birth) {
// 				ff.mbr_birth_error.value = "생년월일 양식에 맞게 입력해주세요";
// 			} else if (e == ff.mbr_gender) {
// 				ff.mbr_gender_error.value = "성별을 입력해주세요";
// 			}
// 			return false;
// 		}

// 	}
</script>

<div class="modal fade" id="modal_call_members_register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header" id ='modal_call_members_register_header'>
				<h3>REGISTER</h3>
			</div>
			<br/>
			<div class="modal-body">
			
				<form name="frm_mbr_register" method="post" class="form-horizontal">
				
					<div class="form-group">
						<label for="mbr_id" class="col-sm-3 control-label"> *아이디 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_id" id="mbr_id" class="form-control" value="" autocomplete="off" placeholder=""> 
							<output name="mbr_id_error" class="error"></output>
						</div>
					</div>
			
					<div class="form-group">
						<label for="mbr_pwd" class="col-sm-3 control-label"> *비밀번호 </label>
						<div class="col-sm-8">
							<input type="password" name="mbr_pwd" id="mbr_pwd" class="form-control" value="" autocomplete="off" placeholder=""> 
							<output name="mbr_pwd_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_name" class="col-sm-3 control-label"> *성명 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_name" id="mbr_name" class="form-control" value="" autocomplete="off" placeholder="">
							<output name="mbr_name_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_phone" class="col-sm-3 control-label"> *연락처 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_phone" id="mbr_phone" class="form-control" value="" autocomplete="off" placeholder=""> 
							<output name="mbr_phone_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_birth" class="col-sm-3 control-label"> *생일 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_birth" id="mbr_birth" class="form-control" value="" autocomplete="off" placeholder=""> 
							<output name="mbr_birth_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_gender" class="col-sm-3 control-label"> *성별 </label>
						<div class="col-sm-8">
							<label class="mbr_radio"> 
								<input style="display: none" type="radio" name="mbr_gender" class="btn" value="male"><span>남</span>
							</label>
							<label class="mbr_radio"> 
								<input style="display: none" type="radio" name="mbr_gender" class="btn" value="female"><span>여</span>
							</label> 
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer" id ="modal_call_members_register_footer">
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" name="btn_close" data-dismiss="modal">CLOSE</button>
				</div>
				<div class="col-sm-2">
					<button type="button" id="btn_mbr_register" class="btn btn-primary btn-lg" name="btn_mbr_register">REGIT</button>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
			</div>
			
		</div>
	</div>
</div>
<!-- <script>chk();</script> -->
<script>
	$("#btn_mbr_register").click(function(){
		alert("??");
		var ff = document.frm_mbr_register;
		ff.action = "./register.mbr";
		ff.submit();
	})
</script>