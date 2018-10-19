<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='../css/auction.css'	/>
<title>Insert title here</title>
</head>
<body>
</head>
<body>
<form name = 'frm_auction' id = 'frm_auction' method = 'post'>
	<div id = 'auction'>
		<div id ='header'>
			<h1><label class = 'auction_header'>A U C T I O N</label></h1>
		</div>
		<div id='auction_menu'>
				<img src='../admin/menu/menuImg/fury_1.png' width='280px' height='280px'/>		
		</div>
	</div>
	<div id = 'win_ment'>
			<label> <span class = 'ment'>7</span> 번 테이블이</label><br/>
			<label> <span class = 'ment'>12,000</span> 원의 가격에</label><br/>
			<label> <span class = 'ment' >처음처럼</span> 을 획득하셨습니다.</label><br/>
			<input type = 'button' class = 'btn' name = 'btnClose' id = 'btnClose' value = 'C L O S E' data-dismiss ='modal'/>
	</div>
</form>
</body>
</html>