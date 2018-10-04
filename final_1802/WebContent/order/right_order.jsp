<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>right_order</title>
<style>
#order {
	display: inline-block;
 	width: 100%; 
	height: 700px;
}

#order #order_list {
	display: block;
	text-align: center;
	font-weight: bold;
	font-size: 35px;
/* 	border-bottom: 1px solid #9b9b9b; */
	margin-bottom: 1%;
}

#order_status {
	height: 60%;
	overflow-y: scroll; 
}

#pre_order {
	height: 10%;
	background: #f9f9f9;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #9b9b9b;
	color: #c3c3c3;
}

#pre_order #previous {
	float: left;
}

#pre_order #pre_price {
	float: right;
}

#now_order {
	height: 10%;
	color: #424242;
}

#now_order #now {
	float: left;
}

#now_order #now_price {
	float: right;
}

#to_order {
	height: 15%;
	color: white;
	font-weight: bold;
	font-size: 20px;
	background: #fd4520;
	text-align: center;
	line-height: 5;
}

.btn-primary {
	background: #fd4520;
	color: white;
	font-weight: bold;
	border-radius: 0;
	border: none;
}

.btn-default {
	border-radius: 0;
}


</style>
</head>
<body>
<div id='order'>
	<span id='order_list'>주문서</span>
	<div id='order_status'>
		<table class="table">
		    <tr>
		        <th style="width: 10px">No</th>
		        <th>메뉴</th><th>수량</th><th style="">가격</th>
		    </tr>
		    <tr>
		        <td>1.</td>
		        <td>제육볶음</td><td>2</td><td>16000</td>
		    </tr>
		    <tr>
		        <td>2.</td>
		        <td>오뎅탕</td><td>3</td><td>13000</td>
		    </tr>
		    <tr>
		        <td>3.</td>
		        <td>소주</td><td>1</td><td>4000</td>
		    </tr>
		    <tr>
		        <td>4.</td>
		        <td>맥주</td><td>2</td><td>4000</td>
		    </tr>
		    <tr>
		        <td>5.</td>
		        <td>경매)콘치즈</td><td>1</td><td>6400</td>
		    </tr>
		</table>
	<hr>
	추가
	<table class='table table_add'>
		    <tr>
	        <td >소주</td>
	      <td> <span class='glyphicon glyphicon-minus icon'></span>
	      1
	      <span class='glyphicon glyphicon-plus icon'></span>
	       </td>
	        <td>6400</td>
	    </tr>
	</table>
	</div>
	<div id='pre_order'>
		<span id='previous'>이전 주문 금액:</span>
		<span id='pre_price'>21,000원</span>
	</div>
	<div id='now_order'>
		<span id='now'>주문 금액</span>
		<span id='now_price'>7,900원</span>	
	</div>
	<div id='to_order' data-toggle="modal" data-target="#myModal">주문하기</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">주문 내용을 확인해주세요.</h4>
      </div>
      <div class="modal-body">
  	 	<table class="table">
		    <tr>
		        <th style="width: 10px">No</th>
		        <th>메뉴</th><th>수량</th><th style="">가격</th>
		    </tr>
		    <tr>
		        <td>1.</td>
		        <td>제육볶음</td><td>2</td><td>16000</td>
		    </tr>
		    <tr>
		        <td>2.</td>
		        <td>오뎅탕</td><td>3</td><td>13000</td>
		    </tr>
		    <tr>
		        <td>3.</td>
		        <td>소주</td><td>1</td><td>4000</td>
		    </tr>
		    <tr>
		        <td>4.</td>
		        <td>맥주</td><td>2</td><td>4000</td>
		    </tr>
		    <tr>
		        <td>5.</td>
		        <td>경매)콘치즈</td><td>1</td><td>6400</td>
		    </tr>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">주문하기</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>