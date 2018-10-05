<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='../css/auction.css'	/>
<title>Insert title here</title>
<script>
/* $(function(){
    $("#frm_auction #btnInput").click(function(){
        
    })
}) */
</script>
</head>
<body>
<form name = 'frm_auction' id = 'frm_auction' method = 'post'>
	<div id = 'auction'>
		<div id ='header'>
			<h1><label class = 'auction_header'>A U C T I O N</label></h1>
		</div>
		<div id='auction_menu'>
				<img src='./images/소주.PNG' width='300px' height='300px'/>		
		</div>
		<div id = 'input_ment'>
			<label>물 품 명 :   <span class = 'ment'>처음처럼</span></label><br/>
			<label>등 록 시 간 : <span class = 'ment'>6 시 50 분</span></label><br/>
			<label>시 작 가 :   <span class = 'ment'>4000원</span></label><br/>
			<label>가격 1 :   <span class = 'ment'>500 원</span></label><br/>
			<label>가격 2 :   <span class = 'ment'>1000 원</span></label><br/>
		</div>
	</div>
	<div id = 'btnDiv'>
		<input type = 'button' name = 'btnInput'     id = 'btnInput'    value = '등 록'   class = 'btnInput' data-dismiss ='modal'/>	<!-- 여기서 class = btnInput은 css를 위헤 -->
		<input type = 'button' name = 'inputClose'   id = 'inputClose'  value = '닫 기'   class = 'btnInput' data-dismiss ='modal'/>
	</div>
</form>
</body>
</html>