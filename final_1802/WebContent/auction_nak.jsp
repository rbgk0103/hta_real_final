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
	   var ms = msg.data;
	   var aa = ms.split("/");
	   $('#win_tbl').val(aa[0]);
	   $('#pri').val(parseInt(aa[1]));
       $("#result").html(parseInt(aa[0]) + "번 테이블 " + String(aa[1]) + "원!!");
   }

   // 종료
   $('#btnGiveup').click(function() {
      window.close();
   })
	$('#btnBidding').click(function(){
		wes.send("k/낙찰되었습니다.");
	    var param = $("#frm_auction").serialize();
	    $('body').load("./auction_modify.chat", param);
	})

}

</script>
<script>
$().ready(function(){
   document.getElementById("no").value = window.opener.document.getElementById("bb_no").value;
})
</script>

</head>
<body>
   <form name='frm_auction' id='frm_auction' method='post'>
      <div id='auction'>
            
         <div id='header'>
            <h1>
               <label class='auction_header'>A U C T I O N</label>
            </h1>
         </div>
         <div id='auction_menu'>
           
         </div>
         <label class='menu_name' style='color: yellow;'><strong id = 'strong'></strong></label><br/><br/>
         <label class='now_price'>현재가 </label><br/><div id = 'result'style = 'font-size: 20px; color: yellow;'></div>
         <p/>
         <div id='txt'>
            <input type = 'hidden' id = 'no' name = 'no'/>
            <input type = 'hidden' id = 'pri' name = 'pri'/>
            <input type = 'hidden' id = 'win_tbl' name = 'win_tbl'/>
            <input type = 'hidden' id = 'tbl_no' name = 'tbl_no'/>
            <input type = 'hidden' id = 'ae_max' name = 'ae_max'><br />
            <input type = 'hidden' id = 'ae_min' name = 'ae_min'><br />
         </div>
         <br/>
         <input type='button' id='btnBat_one' name = 'btnBat_one' value='' class='btn' style = 'display:none;' /><br />
         <!-- 송신버튼 1 -->
         <input type='button' id='btnBat_two' name = 'btnBat_two' value='' class='btn' style = 'display:none;' />
         <!-- 송신버튼2 -->
         <p />
         <input type='button' id='btnBidding' value = '낙 찰' class='btn_two' onclick = 'bidding()'/>
         <!-- 종료버튼 -->
         <input type='button' id='btnGiveup' value = '닫 기 ' class='btn_two'/>
         <p />
      </div>
   </form>
</body>
<script>

</script>
</html>