<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='../css/auction.css'	/>
<title>Insert title here</title>
<script>

</script>
</head>
<body>
<form name = 'frm_auction' id = 'frm_auction' method = 'post'>
	<div id = 'auction'>
		<div id ='header'>
			<h1><label class = 'auction_header'>A U C T I O N</label></h1>
		</div>
		<div id='auction_menu'>
				<img src='./images/소주.PNG' width='280px' height='280px'/>
		</div>
				<label class='menu_name'>처음처럼</label><br/>
				<label class='now_price' >현재가 : 10,000</label><br/>
				<strong><label class='start_price'>시작가 : 4,000</label></strong>
					<p/>
			<input type='button' id='btnBat_one' value='+pct1' class='btn'/><br/> 
 			<input type='button' id='btnBat_two' value='+pct2' class='btn'/>
 			<p/> 
  			<input type='button' id='btnBidding' value='입찰' class='btn_two' data-dismiss ='modal'/> 
 			<input type='button' id='btnGiveup'  value='포기' class='btn_two' data-dismiss ='modal'/> 
			<p/>
	</div>	
	
</form> 
</body>
</html>