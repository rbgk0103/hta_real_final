<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' type='text/css' href='./css/auction.css'   />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Insert title here</title>
</head>
<script>
$().ready(function(){
	
})

function auc_delete(ae_no){
	var prom = confirm("경매 번호 " + ae_no + "의 기록을 삭제 하시겠습니까?");
	if(prom){
		alert("삭제 되셨습니다.");
		$("#ae_no").val(ae_no);
		var param = $('#frm_auc').serialize();
		var url   = './auction_delete.auc';
		$('.skin-black').load(url,param);
	}else{
		alert("취소");
	}
}
</script>
<body>
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
               <th>PRICE</th>
               <th>MAX</th>
               <th>MIN</th>
               <th>COST</th>
               <th>DELETE</th>
            </tr>
         </thead>
         
       <c:forEach var='auc' items='${auctionList }'>

       <c:if test="${auc.ae_confirm eq 1 }">
         <tbody>
            <tr>
               <td><span>${auc.ae_no}</span></td>
               <td><span>${auc.menu_name }</span></td>
               <td><span>${auc.ae_price }</span></td> 
               <td><span>${auc.ae_pct_max }</span></td> 
               <td><span>${auc.ae_pct_min }</span></td>
               <td><span>${auc.ae_cost }</span></td>
               <td><span onclick = 'auc_delete(${auc.ae_no })'><strong>Del</strong></span></td>
            </tr>
         </tbody>
	</c:if>
         </c:forEach>
      </table>
	</div>
</div>
</body>
</html>