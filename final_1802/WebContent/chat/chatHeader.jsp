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
<c:choose>
	<c:when test="${receiveStringNo eq 'a'}">
		<div class="col-md-1 col-xs-1 receiveBackground" id="allCircleBorder" onclick="setReceiver('a')">
			<p>전체</p>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col-md-1 col-xs-1" id="allCircleBorder" onclick="setReceiver('a')">
			<p>전체</p>
		</div>
	</c:otherwise>
</c:choose>
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
				<c:choose>
					<c:when test="${i.table_no eq receiveIntNo}">
					${i.table_no }
					${receiveStringNo }
					${receiveIntNo }
						<div class="col-md-2 col-xs-2 circleBorder receiveBackground" id="circleBorder" onclick="setReceiver(${i.table_no })">
							<p>No. ${i.table_no}</p>
						</div>
					</c:when>
					<c:otherwise>
					${i.table_no}
					${receiveStringNo }
					${receiveIntNo }
						<div class="col-md-2 col-xs-2 circleBorder" id="circleBorder" onclick="setReceiver(${i.table_no })">
							<p>No. ${i.table_no}</p>
						</div>
					</c:otherwise>
				</c:choose>
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
	
	function movePage(nowPage) {
		var param = "&ip=" + "${ip}" + "&nowPage=" + nowPage + "&receiveNo=" + '${receiveNo}';
		$("#chatHeader").load("header.chat", param);
	}
	
	function setReceiver(receiveNo) {
		document.getElementById('receiverNo').value = receiveNo;
		var nowPage = ${chatDao.nowPage}
		console.log("chatDaonowPage : " + nowPage);
		var circleBorderClass = document.getElementsByClassName('circleBorder');
		console.log("receiveNo : " + receiveNo);
		
		$('#chatContent').load("content.chat", "msg=" + reqAttrMyNo + receiveNo);
		$('#chatHeader').load("header.chat", "ip=" + ip + "&nowPage=" + ${chatDao.nowPage} + "&receiveNo=" + receiveNo);
	}
	
</script>