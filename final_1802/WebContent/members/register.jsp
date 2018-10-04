<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/sectionMove.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.error {
	font-size: 10px;
	color: darkred;
	text-decoration: underline;
	margin-left: 45%;
}
</style>

<script>

function chk(){
	
	ff = document.frm_mbr_register;
	
	ff.btn_register.onclick = function(){
		ff.mbr_id_error.value = "";
		ff.mbr_pwd_error.value = "";
		ff.mbr_name_error.value = "";
		ff.mbr_phone_error.value = "";
		ff.mbr_birth_error.value = "";
		ff.mbr_gender_error.value = "";
		
		if (!val(/^[A-Za-z0-9]{3,}$/, ff.mbr_id)) {
			return;
		} else if(!val(/^[A-Za-z]{1,}[A-Za-z0-9]{2,}$/, ff.mbr_pwd)) {
			return;
		} else if(!val(/^[가-힣A-Za-z]{2,}$/, ff.mbr_name)) {
			return;
		} else if(!val(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/, ff.mbr_phone)){
			return;
		} else if(!val(/^[0-9]{6}$/, ff.mbr_birth)) {
			return;
		} else if(!val(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/, ff.mbr_gender)) {
			return;
		} else {
			 ff.action = "registerR.mbr";
			 ff.submit();
		}
	}
}

function val(re, e){
	if (re.test(e.value)){
		return true;
	} else {	
		e.focus();
		e.value = "";
		if (e == ff.mbr_id) {ff.mbr_id_error.value = "3자 이상의 영숫자를 입력해주세요.";}
		else if (e == ff.mbr_pwd){ff.mbr_pwd_error.value = "3자 이상의 영숫자를 입력해주세요.";}
		else if (e == ff.mbr_name){ff.mbr_name_error.value = "2자 이상의 한글과 영문자만 입력해주세요.";}
		else if (e == ff.mbr_phone){ff.mbr_phone_error.value = "전화번호 양식에 맞게 입력해주세요";}
		else if (e == ff.mbr_birth){ff.mbr_birth_error.value = "생년월일 양식에 맞게 입력해주세요";}
		else if (e == ff.mbr_gender){ff.mbr_gender_error.value = "성별을 입력해주세요";}
		return false;
	}
	
}

</script>

</head>
<body> 
  <!-- Content -->
  <div id="content"> 
    
    <!--======= PAGES INNER =========-->
    <section class="chart-page padding-top-100 padding-bottom-100">
      <div class="container"> 
        
        <!-- Payments Steps -->
        <div class="shopping-cart"> 
          
          <!-- SHOPPING INFORMATION -->
          <div class="cart-ship-info register">
            <div class="row"> 
              
              <!-- ESTIMATE SHIPPING & TAX -->
              <div class="col-sm-12">
                <h6>REGISTER</h6>
                
                
                <form name="frm_mbr_register" method="post">
                  <ul class="row">
                    
                    <li class="col-md-6">
                      <label> *아이디
                        <input type="text" name="mbr_id" value="" autocomplete="off" placeholder="">
                        <output name="mbr_id_error" class="error"></output>
                      </label>
                    </li> 
                    
                    <li class="col-md-6">
                      <label> *비밀번호
                        <input type="password" name="mbr_pwd" value="" autocomplete="off" placeholder="">
                        <output name="mbr_pwd_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *성명
                        <input type="text" name="mbr_name" value="" autocomplete="off" placeholder="">
                        <output name="mbr_name_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6"> 
                      <label>*연락처 (EX : - 제외)
                        <input type="text" name="mbr_phone" value="" autocomplete="off" placeholder="">
                     	<output name="mbr_phone_error" class="error"></output>
                      </label>
                    </li>
                                       
                    <li class="col-md-6">
                      <label> *생일 (EX : 19870501)
                        <input type="text" name="mbr_birth" value="" autocomplete="off" placeholder="">
                        <output name="mbr_birth_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> <strong>*성별</strong>
                        <select class="selectpicker" name="mbr_gender">
                          <option>줸틀맨</option>
                          <option>뤠이디</option>
                        </select>
                        <output name="mbr_gender_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <button type="button" class="btn" name="btn_register">register</button>
                    </li>
                    
                  </ul>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
<script>chk();</script>
</body>
</html>