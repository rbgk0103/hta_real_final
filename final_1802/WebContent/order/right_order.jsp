<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='right_order'>
	<span id='order_list'>주문서</span>
	<div id='order_status'>
		<table class="table">
		    <tr>
		        <th style="width: 10px">No</th>
		        <th>메뉴</th><th>수량</th><th style="">가격</th>
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
		추가 주문
		<table id='tableZone' class='table'></table>

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
