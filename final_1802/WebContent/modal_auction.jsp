<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='./css/auction.css' />
<title>Insert title here</title>
<script>
window.onload = function(){
	
	var wes = new WebSocket('ws://192.168.0.20:7080/final_1802/Web');
	//웹소켓 처리
	wes.onopen = function() {
		
	}
	wes.onmessage = function(msg) {
		$("#ae_price").val(msg.data);
	}

	// 배팅
	$('#btnBat_one').click(function() {
		var ori = parseInt($('#ae_max').val()) + parseInt($('#pri').val())
		$('#pri').val(ori);
		wes.send(String(ori));
	})
	$('#btnBat_two').click(function() {
		var ori = parseInt($('#ae_min').val()) + parseInt($('#pri').val())
		$('#pri').val(ori);
		wes.send(String(ori));
	})
	// 종료
	$('#btnGiveup').click(function() {
		window.close();
	})
}
</script>
</head>
<body>
	<form name='frm_auction' id='frm_auction' method='post' width='800px' height='800px'>
		<div id='auction'>
			<div id='header'>
				<h1>
					<label class='auction_header'>A U C T I O N</label>
				</h1>
			</div>
			<div id='auction_menu'>
				<img src='./admin/menu/menuImg/fury_1.png' width='280px'
					height='280px' />
			</div>
			<h2>30초 뒤에 경매가 종료됩니다.</h2>
			<label class='menu_name' style='color: yellow;'><strong>치즈콘 치킨</strong></label><br/><br/>
			<label class='now_price'>현재가 </label> <input type='text' id='ae_price' name='ae_price' value = '0'><br/>
			<p/>
			<div id='txt'>
				<input type = 'hidden' id = 'pri' name = 'pri' value = '0'/>
				<input type='hidden' id='ae_max' name='ae_max' value='1000'><br />
				<input type='hidden' id='ae_min' name='ae_min' value='500'><br />
			</div>
			<label><strong style = 'font-size: 30px; color: red;'>테이블 - </strong></label><input type = 'text' id = 'auc_tbl' name = 'auc_tbl'/>
			<br/>
			<input type='button' id='btnBat_one' name = 'btnBat_one' value='+pct1' class='btn' /><br />
			<!-- 송신버튼 1 -->
			<input type='button' id='btnBat_two' name = 'btnBat_two' value='+pct2' class='btn' />
			<!-- 송신버튼2 -->
			<p />
			<input type='button' id='btnBidding' value='입찰' class='btn_two' />
			<!-- 종료버튼 -->
			<input type='button' id='btnGiveup' value='포 기' class='btn_two' />
			<p />
		</div>
		<div id='result'></div>
	</form>
</body>
</html>