<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- google font -->
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="./css/admin_css.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./lib/bootstrap.min.js" type="text/javascript"></script>
<!-- Director App -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- bootstrap 3.0.2 -->
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />


<style>
.mbr_radio {
    font-size: 20px;
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
	function mchk() {
		fm = document.frm_mbr_modify;
		
		var mbtn = document.getElementById("btn_mbr_modify");
		
		mbtn.onclick = function() {
			
			fm.mbr_pwd_error.value = "";
			fm.mbr_name_error.value = "";
			fm.mbr_phone_error.value = "";
			fm.mbr_birth_error.value = "";
			fm.mbr_gender_error.value = "";
			fm.mbr_point_error.value = "";
			

			if (!mval(/^[A-Za-z]{1,}[A-Za-z0-9]{2,}$/, fm.mbr_pwd)) {
				return;
			} else if (!mval(/^[가-힣A-Za-z]{2,}$/, fm.mbr_name)) {
				return;
			} else if (!mval(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/, fm.mbr_phone)) {
				return;
			} else if (!mval(/^[0-9]{8}$/, fm.mbr_birth)) {
				return;
			} else if (!mgval(fm.mbr_gender.value)) {
				return;
			} else if (!mval(/^[0-9]+$/, fm.mbr_point)){
				return;
			} else {
				var param = $("#frm_mbr_modify").serialize();
				$("#frm_mbr_modify").load("./mbr_modify.mbr", param);
			}
		}
	}
	
	function mgval(e){
		if (e != null) {
			return true;
		} else {
			fm.mbr_gender_error.value = "성별을 선택해주세요";
			return false;
		}
	}

	function mval(re, e) {
		if (re.test(e.value)) {
			return true;
		} else {
			e.focus();
			e.value = "";
			if (e == fm.mbr_pwd) {
				fm.mbr_pwd_error.value = "3자 이상의 영숫자를 입력해주세요";
			} else if (e == fm.mbr_name) {
				fm.mbr_name_error.value = "2자 이상의 한글 또는 영문자만 입력해주세요";
			} else if (e == fm.mbr_phone) {
				fm.mbr_phone_error.value = "전화번호 양식에 맞게 입력해주세요";
			} else if (e == fm.mbr_birth) {
				fm.mbr_birth_error.value = "생년월일 양식에 맞게 입력해주세요";
			} else if (e == fm.mbr_point) {
				fm.mbr_point_error.value = "포인트는 숫자로만 입력해주세요"
			}
			return false;
		}

	}
</script>

<div class="modal fade" id="modal_call_members_modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header" id ='modal_call_members_modify_header'>
				<h3>MODIFY</h3>
			</div>
			<br/>
			<div class="modal-body">
			
				<form name="frm_mbr_modify" id="frm_mbr_modify" method="post" class="form-horizontal">
					
					<input type="hidden" name="mbr_no" id="mbr_mno" class="form-control" value="" autocomplete="off" readonly="readonly"> 
				
					<div class="form-group">
						<label for="mbr_mid" class="col-sm-3 control-label"> *아이디 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_id" id="mbr_mid" class="form-control" value="${empty msg ? '???' : 'msg'}" autocomplete="off" readonly="readonly"> 
						</div>
					</div>
					
					<div class="form-group">
						<label for="mbr_mpwd" class="col-sm-3 control-label"> *비밀번호 </label>
						<div class="col-sm-8">
							<input type="password" name="mbr_pwd" id="mbr_mpwd" class="form-control" value="" autocomplete="off" placeholder="3자 이상의 영숫자를 입력해주세요"> 
						</div>
						<div class="col-sm-12">
							<output name="mbr_pwd_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_mname" class="col-sm-3 control-label"> *성명 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_name" id="mbr_mname" class="form-control" value="" autocomplete="off" placeholder="2자 이상의 한글 또는 영문자만 입력해주세요">
						</div>
						<div class="col-sm-12">
							<output name="mbr_name_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_mphone" class="col-sm-3 control-label"> *연락처 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_phone" id="mbr_mphone" class="form-control" value="" autocomplete="off" placeholder="ex) 01075029632"> 
						</div>
						<div class="col-sm-12">
							<output name="mbr_phone_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_mbirth" class="col-sm-3 control-label"> *생일 </label>
						<div class="col-sm-8">
							<input type="text" name="mbr_birth" id="mbr_mbirth" class="form-control" value="" autocomplete="off" placeholder="ex) 19870501"> 
						</div>
						<div class="col-sm-12">
							<output name="mbr_birth_error" class="error"></output>
						</div>
					</div>
					<div class="form-group">
						<label for="mbr_mgender" class="col-sm-3 control-label"> *성별 </label>
						<div class="col-sm-8">
							<label class="mbr_radio"> 
								<input style="display: none" type="radio" name="mbr_gender" class="btn" value="male"><span>남</span>
							</label>
							<label class="mbr_radio"> 
								<input style="display: none" type="radio" name="mbr_gender" class="btn" value="female"><span>여</span>
							</label> 
						</div>
					</div>
						<div class="col-sm-12">
							<output name="mbr_gender_error" class="error"></output>
						</div>
						
						<c:choose>
							<c:when test="${session_mbr.scNo == 0 }">
								<div class="form-group">
									<label for="mbr_mpoint" class="col-sm-3 control-label"> *포인트 </label>
									<div class="col-sm-8">
										<input type="text" name="mbr_point" id="mbr_mpoint" class="form-control" value="" autocomplete="off" placeholder=""> 
									</div>
									<div class="col-sm-12">
										<output name="mbr_point_error" class="error"></output>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="form-group">
									<label for="mbr_mpoint" class="col-sm-3 control-label"> 포인트 </label>
									<div class="col-sm-8">
										<input type="text" name="mbr_point" id="mbr_mpoint" class="form-control" value="" autocomplete="off" placeholder="" readonly="readonly"> 
									</div>
									<div class="col-sm-12">
										<output name="mbr_point_error" class="error"></output>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
				</form>
			</div>
			<div class="modal-footer" id ="modal_call_members_modify_footer">
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<button type="button" id="btn_mbr_modify" name="btn_mbr_modify" class="btn btn-success btn-lg">MODIF</button>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" name="btn_close" data-dismiss="modal">CANCEL</button>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
			</div>
			
		</div>
	</div>
</div>
<script>mchk();</script>
<script>

</script>