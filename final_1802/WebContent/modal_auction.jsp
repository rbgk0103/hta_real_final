<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='./css/auction.css'	/>
<title>Insert title here</title>
<script>
</script>
</head>
<body>
<div class="modal fade" id="modal_auction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<form name = 'frm_auction' id = 'frm_auction' method = 'post' width = '800px' height ='800px'>
				<div id = 'auction'>
				<div id ='header'>
					<h1><label class = 'auction_header'>A U C T I O N</label></h1>
					<%-- <jsp:include page= "./auction/auctionHeader.jsp" /> --%>
				</div>
				<div id='auction_menu'>
					<img src='' width='280px' height='280px'/>
				</div>
					<label class='menu_name'></label><br/>
					<label class='now_price' >현재가 : </label><br/>
					<strong><label class='start_price'>시작가 : </label></strong>
						<p/>
					<div id = 'txt'>
						<input type = 'text' id ='ae_max' name = 'ae_max'/><br/>
						<input type = 'text' id ='ae_min' name = 'ae_min'/><br/>
						<input type = 'text' id ='ae_price' name = 'ae_price'/><br/>
					</div>	
						<input type='button' id='btnBat_one' value='+pct1' class='btn'/><br/> <!-- 송신버튼 1 -->
						<input type='button' id='btnBat_two' value='+pct2' class='btn'/>	  <!-- 송신버튼2 -->
						<p/> 
			 			<input type='button' id='btnBidding' value='입찰' class='btn_two' /> <!-- 종료버튼 --> 
						<input type='button' id='btnGiveup'  value='포 기' class='btn_two' data-dismiss ='modal'/> 
					<p/> 	
				</div>
				<div id = 'result'></div>
			</form>
		</div>
	 </div>
</div>
</body>
</html>