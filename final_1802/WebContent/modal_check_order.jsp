<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h4 class="modal-title" id="myModalLabel" style='color:black'>주문 내용을 확인해주세요.</h4>
    </div>
    <div class="modal-body">
	 	<table class="table" id='tableModal' style='color:black'></table>
    </div>
    <div class="modal-footer">
      <button type="button"  class="btn btn-primary" data-dismiss="modal" onclick='orderMenu()'>주문하기</button>
      <button type="button"  class="btn btn-default" data-dismiss="modal">취소하기</button>
  </div>
