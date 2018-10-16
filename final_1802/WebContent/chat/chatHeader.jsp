<%@page import="bean.ChatDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="bean.GuestVo"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Map"%>
<%@page import="bean.WebSocketServer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%	////////////////////////////
	/*
		페이징, 대화 망가진거 다시 고치기
	*/
	////////////////////////////
	/* 
	 GuestVo를 가지고 있는 List을 getAttribute로 받아옴
	 */
	List<GuestVo> openTableList; //테이블번호, 성별
	
	if(request.getAttribute("openTableList") != null) {
		openTableList = (List<GuestVo>)request.getAttribute("openTableList");
		request.setAttribute("openTableList", openTableList);
	} else {
		out.print("<h1>header리스트가 비었음.(손님이 0명)</h1>");
	}
	ChatDao dao = request.getAttribute("chatDao") != null
				? (ChatDao)request.getAttribute("chatDao")
				: null;
%>
<div class="col-md-1 col-xs-1" id="allCircleBorder" onclick="setReceiver('a')">
	<p>전체</p>
</div>
<!-- 전체채팅목록, 유저목록, 아이콘 -->
<div class="col-md-10 col-xs-10" id="userBox">
	<!-- 왼쪽 화살표 아이콘 -->
	<c:if test="${chatDao.nowPage > 1 }">
		<a href="#" onclick="movePage(${chatDao.nowPage-1})">
			<i class="fa fa-angle-left fa-3x col-md-1 col-xs-1" id="angleLeftIcon"></i>
		</a>
	</c:if>
	<!-- 개개인의 유저 목록 -->
	<div class="col-md-8 col-xs-8" id="userList">
		<c:forEach var='i' items='${openTableList}'>
			<c:if test="${i.table_no != tableNo}">
				<div class="col-md-2 col-xs-2 circleBorder ${i.table_no }" id="circleBorder" onclick="setReceiver(${i.table_no })">
					<p>No. ${i.table_no}</p>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<!-- 개개인의 유저목록 끝 -->
	<c:if test="${chatDao.nowPage < chatDao.totPage}">
		<a href="#" onclick='movePage(${chatDao.nowPage+1})'>
			<i class="fa fa-angle-right fa-3x col-md-1 col-xs-1" id="angleRightIcon"></i>
		</a>
	</c:if>
	<!-- 오른쪽 화살표 아이콘 -->
</div>
<!-- 전체채팅목록, 유저목록, 아이콘 끝 -->
<script>
	$(function() {
		$('#allCircleBorder').css('background-color', '#aaaaaa');
	})
	function movePage(nowPage) {
		var param = "&ip=" + $('#ip').val() + "&nowPage=" + nowPage;
		$("#chatHeader").load("header.chat", param);
	}
	
	function setReceiver(receiveNo) {
		$('#receiverNo').val(receiveNo);
		//var receiveClass = document.getElementsByClassName(receiveNo);
		
		var circleBorderClass = $('.circleBorder');
		console.log("랭쓰 : " + circleBorderClass.length);
		console.log("receiveNo : " + receiveNo);
		//$('#allCircleBorder').css('background-color', '#030303');
		
		circleBorderClass.css('background-color', '#030303 !important');
		
		//$('.' + receiveNo).css('background-color', "#aaaaaa");
		
		switch (receiveNo) {
			case '1' : 
				$('.1').css('background-color', "#aaaaaa !important");
				break;
			case '2' : 
				$('.2').css('background-color', "#aaaaaa !important");
				break;
			case '3' : 
				$('.3').css('background-color', "#aaaaaa !important");
				break;
			case '4' : 
				$('.4').css('background-color', "#aaaaaa !important");
				break;
			case '5' : 
				$('.5').css('background-color', "#aaaaaa !important");
				break;
			case '6' : 
				$('.6').css('background-color', "#aaaaaa !important");
				break;
			case '7' : 
				$('.7').css('background-color', "#aaaaaa !important");
				break;
			case '8' : 
				$('.8').css('background-color', "#aaaaaa !important");
				break;
			case '9' : 
				$('.9').css('background-color', "#aaaaaa !important");
				break;
			case 'a' : 
				$('.a').css('background-color', "#aaaaaa !important");
				break;
		}
		
		$('#chatContent').load("content.chat", "msg=" + tableNo + receiveNo);
	}
	
</script>