<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>경 매 관 리 자</title>
<link rel='stylesheet' type='text/css' href='./css/auction.css'   />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<script>
$().ready(function(){
	$("#btnInput").click(function(){
		$(".skin-black").load("./menu_list.adm");
	})
})

function view(ae_no){
 	$("#ae_no").val(ae_no);
	var param = $("#frm_auc").serialize();
	$(".skin-black").load("./auction_view.auc",param); 
}
function ae_start(ae_no, ae_price, ae_max, ae_min){
	var prom = confirm("경매번호 " + ae_no + " \n시작가 " + ae_price + "\nMAX" + ae_max + "\nMIN" + ae_min + "\n\n 시작 하시겠습니까?");
	if(prom){
		alert("확인");
		ws.send(ae_no);
	}else{
		alert("취소");
	}
}
</script>
<body>
<!-- 성공,실패 확인 메세지  -->
${msg }
<div class="wrap">
   <form name = 'frm_auc' id = 'frm_auc' method = 'post'>
   		<input type = 'hidden' id = 'ae_no'   name = 'ae_no'/>
   		<input type = 'hidden' id = 'menu_no' name = 'menu_no'/>
   </form>
   <div id='menu_div' class='menu_div' class="tbList paginated">
      <table class="table table-hover">
         <thead>
            <tr>
               <th>No</th>
               <th>Products</th>
               <th>Time</th>
               <th>PRICE</th>
               <th>MAX</th>
               <th>MIN</th>
               <th>View</th>
               <th>START</th>
            </tr>
         </thead>
         
       <c:forEach var='auc' items='${auctionList }'>
       <c:if test="${auc.ae_confirm eq 0 }">
         <tbody>
            <tr>
               <td><span>${auc.ae_no}</span></td>
               <td><span>${auc.menu_name }</span></td>
               <td><span>${auc.ae_date }</span></td> 
               <td><span>${auc.ae_price }</span></td> 
               <td><span>${auc.ae_pct_max }</span></td> 
               <td><span>${auc.ae_pct_min }</span></td>
               <td><span onclick = "view(${auc.ae_no})">Button</span></td>
               <td><span onclick = "ae_start(${auc.ae_no}, ${auc.ae_price }, ${auc.ae_pct_max }, ${auc.ae_pct_min })">Start</span></td>
            </tr>
         </tbody>
         </c:if>
         </c:forEach>
      </table>
		<input type = 'button' value = '등 록'  id = 'btnInput' name = 'btnInput'/>
	</div>
</div>
</body>
</html>