<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text /html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='../css/auction.css'	/>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	  tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
});

var stDate = new Date().getTime();
var edDate = new Date(stDate + 30000).getTime(); // 종료날짜
var RemainDate = edDate - stDate;

function msg_time() {
	
	var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
	m =  seconds ; // 남은 시간 text형태로 변경
	 
	document.all.timer.innerHTML = m;   // div 영역에 보여줌 
	 
	if (RemainDate <= 0) {      
	  // 시간이 종료 되었으면..
		clearInterval(tid);   // 타이머 해제
		alert("아무도 입찰을 안하셔서 경매종료합니다~");
	}else{
		RemainDate = RemainDate - 1000; // 남은시간 -1초
	}
	
}

 

/* setTimeout("startAu()", 3000); // (10초)가 경과후 testfn()실행

function startAu(){
	var start = "아무도 입찰 노 경매 클로즈";
	close = start;
	document.all.timer.innerHTML = close;
	/* alert("아무도 입찰을 안하셔서 경매종료합니다~"); 
} 
 */

</script>
</head>
<body>
<form name = 'frm_auction' id = 'frm_auction' method = 'post'>
	<div id = 'auction'>
		<div id ='header'>
			<h1><label class = 'auction_header'>A U C T I O N</label></h1>
		</div>
		<div id='auction_menu'>
				<img src='./auction/images/소주.PNG' width='280px' height='280px'/>
		</div>
				<label class='menu_name'>처음처럼</label><br/>
				<label class='now_price' >현재가 : 10,000</label><br/>
				<strong><label class='start_price'>시작가 : 4,000</label></strong>
					<p/>
			<input type='button' id='btnBat_one' value='+pct1' class='btn'/><br/> 
 			<input type='button' id='btnBat_two' value='+pct2' class='btn'/>
 			<p/> 
  			<input type='button' id='btnBidding' value='입찰' class='btn_two' onclick="bidding()"/> 
 			<input type='button' id='btnGiveup'  value='포기' class='btn_two' data-dismiss ='modal'/> 
			<p/> 	
			<p>남은시간 : <span id="timer"></span></p>
	</div>
</form> 
</body>
</html>