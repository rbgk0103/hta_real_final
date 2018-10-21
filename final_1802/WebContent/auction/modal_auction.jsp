<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#frm_auction{
height: 300px;
}
#auction{
text-align: center;
margin-top: 70px;
}
#aucConfirm{
font-size: 40px;
}

</style>
</head>
<body>
<div class="modal fade" id="modal_auction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<form name = 'frm_auction' id = 'frm_auction'  method = 'post'>
			<div id = 'auction'>
				<span id = 'aucConfirm'>경매에 참여 하시겠습니까?</span>
				<div id = 'btn'>
		  			<input type='button' id='btnBidding' value='참여'    class='btn_two'/> 
		 			<input type='button' id='btnGiveup'  value='취소'  	class='btn_two' /> 
				</div>
			</div>
		</form> 
	</div>
</div>
</body>
</html>