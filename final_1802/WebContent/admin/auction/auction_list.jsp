<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>경 매 관 리 자</title>
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
</script>
<body>
<!-- 성공,실패 확인 메세지  -->
${msg }
<div class="wrap">
   <div id='menu_div' class='menu_div' class="tbList paginated">
      <table class="table table-hover">
         <thead>
            <tr>
               <th>No</th>
               <th>Time</th>
               <th>PRICE</th>
               <th>MAX</th>
               <th>MIN</th>
            </tr>
         </thead>
         
       <c:forEach var='auc' items='${list }'>   
         <tbody>
            <tr>
               <td><span>${auc.ae_no}</span></td>
               <td><span>${auc.ae_date }</span></td> 
               <td><span>${auc.ae_price }</span></td> 
               <td><span>${auc.ae_pct_max }</span></td> 
               <td><span>${auc.ae_pct_min }</span></td> 
            </tr>
         </tbody>
         </c:forEach>
      </table>
		<input type = 'button' value = '등 록' id = 'btnInput' name = 'btnInput'/>
	</div>

  <!--  <!-- page_navi start 
   <div class="page_navi">
      <a href="#" class="first">처음</a>
      <a href="#" class="prev">이전</a>
      <span>
         <strong>1</strong>
         <a href="#">2</a>
         <a href="#">3</a>
         <a href="#">4</a>
         <a href="#">5</a>
         <a href="#">6</a>
      </span>                    
      <a href="#" class="next">다음</a>
      <a href="#" class="last">마지막</a>
   </div>
   page_navi end -->
</div>
</body>
</html>