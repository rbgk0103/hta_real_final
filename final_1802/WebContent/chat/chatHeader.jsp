<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id='chatHeader' class='col-md-12 col-xs-12'>
<div class="col-md-1 col-xs-1" id="allCircleBorder">
	<p>전체</p>
</div>
<!-- 전체채팅목록, 유저목록, 아이콘 -->
<div class="col-md-10 col-xs-10" id="userBox">
	<i class="fa fa-angle-left fa-3x col-md-1 col-xs-1" id="angleLeftIcon"></i>
	<!-- 왼쪽 화살표 아이콘 -->
	<!-- 개개인의 유저 목록 -->
	<div class="col-md-8 col-xs-8" id="userList">
		<div class="col-md-2 col-xs-2" id="circleBorder">
			<p>No. 1</p>
		</div>
		<div class="col-md-2 col-xs-2" id="circleBorder">
			<p>No. 2</p>
		</div>
		<div class="col-md-2 col-xs-2" id="circleBorder">
			<p>No. 3</p>
		</div>
	</div>
	<!-- 개개인의 유저목록 끝 -->
	<i class="fa fa-angle-right fa-3x col-md-1 col-xs-1"
		id="angleRightIcon"></i>
	<!-- 오른쪽 화살표 아이콘 -->
</div>
<!-- 전체채팅목록, 유저목록, 아이콘 끝 -->
<%--
<c:forEach begin="1" end="3">
	<span class="i"></span>
</c:forEach>
--%>
</div>