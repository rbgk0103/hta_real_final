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
      $("#result").html(msg.data);
   }

   // 배팅
   $('#btnBat_one').click(function() {
      var ori = parseInt($('#ae_max').val()) + parseInt($('#pri').val());
      $('#pri').val(ori);
      wes.send(String($('#tbl_no').val()+"/"+ori));
   })
   $('#btnBat_two').click(function() {
      var ori = parseInt($('#ae_min').val()) + parseInt($('#pri').val());
      $('#pri').val(ori);
      wes.send(String($('#tbl_no').val()+"/"+ori));
   })
   // 종료
   $('#btnGiveup').click(function() {
      window.close();
   })
   
   //낙찰

}

</script>
<script>
$().ready(function(){
   var max = window.opener.document.getElementById("ae_pct_max").value;
   var min = window.opener.document.getElementById("ae_pct_min").value;
   var name = window.opener.document.getElementById("menu_name").value;
   var image = window.opener.document.getElementById("menu_image").value;
   var tbl_no = window.opener.document.getElementById("tt_no").value;
   
   document.getElementById("ae_max").value = max;
   document.getElementById("pri").value = window.opener.document.getElementById("ae_price").value;
   document.getElementById("ae_min").value = min;
   document.getElementById("no").value = window.opener.document.getElementById("AA_no").value;
   document.getElementById("tbl_no").value = tbl_no;
   
   $('#tt_no').append(tbl_no);
   $('#btnBat_one').val(max + " 배팅");
   $('#btnBat_two').val(min + " 배팅");
   $('#strong').append(name);
   $('#menu_img').attr('src',image);
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
            <img id = 'menu_img' src='' width='280px'
               height='280px' />
         </div>
         <h2 style = 'color:white;'><strong id = 'tt_no'></strong><strong> 번 테이블</strong></h2>
         <label class='menu_name' style='color: yellow;'><strong id = 'strong'></strong></label><br/><br/>
         <label class='now_price'>현재가 </label><br/><div id = 'result'style = 'font-size: 20px; color: yellow;'></div>
         <p/>
         <div id='txt'>
            <input type = 'hidden' id = 'no' name = 'no'/>
            <input type = 'hidden' id = 'pri' name = 'pri'/>
            <input type = 'hidden' id = 'tbl_no' name = 'tbl_no'/>
            <input type = 'hidden' id = 'ae_max' name = 'ae_max'><br />
            <input type = 'hidden' id = 'ae_min' name = 'ae_min'><br />
         </div>
         <br/>
         <input type='button' id='btnBat_one' name = 'btnBat_one' value='' class='btn' /><br />
         <!-- 송신버튼 1 -->
         <input type='button' id='btnBat_two' name = 'btnBat_two' value='' class='btn' />
         <!-- 송신버튼2 -->
         <p />
         <input type='button' id='btnBidding' value = '낙찰' class='btn_two' onclick = 'bidding()'/>
         <!-- 종료버튼 -->
         <input type='button' id='btnGiveup' value = '포 기' class='btn_two'/>
         <p />
      </div>
   </form>
</body>
<script>
function bidding(){
   var param = $("#frm_auction").serialize();
   $('body').load("./auction_modify.chat", param);
}
</script>
</html>