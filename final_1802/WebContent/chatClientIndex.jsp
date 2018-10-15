<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>**채팅방**</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="./css/chat.css">
</head>
<body>
<%
	if(request.getAttribute("openTableList") == null) {
		out.print("<h1>index리스트(List)가 비었음.</h1>");
	}  else {
		request.setAttribute("openTableList", request.getAttribute("openTableList"));
	}
	// 공지 창
	String chatNotice = request.getParameter("chatNotice") == null
			? "./chat/chatNotice.jsp"
			: (String) request.getParameter("chatNotice");
	
	// 대화 내용
	String chatContent = request.getParameter("chatContent") == null
			? "./chat/chatContent.jsp?tableNo=" + request.getAttribute("tableNo")
			: (String) request.getParameter("chatContent") + request.getAttribute("tableNo");
	
	// 사용자 목록(Header)
	String chatHeader = "./chat/chatHeader.jsp?tableNo=" + request.getAttribute("tableNo");
%>
	<!-- table no를 id로, guest gender를 value로 만들었습니다. -->
		<c:forEach var='i' items='${allTableList}'>
			<input type="hidden" id="${i.table_no }" value="${i.guest_gender}">
		</c:forEach>
		<input type='hidden' id="ip" value='${ip }' />
		<input type='hidden' id="tableNo" value='${tableNo }' />
		
	<div class="container" id="chatBody">
		<div id='chatHeader' class='col-md-12 col-xs-12'>
			<jsp:include page='<%=chatHeader%>' />
		</div>
		<hr class="col-md-12 col-xs-12" id="whiteLine" />
		<div id='chatWrap' class='col-md-12 col-xs-12'>
			<div id="chatNotice"
				class="col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-10">
				<jsp:include page="<%=chatNotice%>" />
			</div>
			<div id='chatContent' class='col-md-12 col-xs-12'>
				<jsp:include page="<%=chatContent%>" />
				
			</div>
		</div>
		<%@ include file="./chat/chatFooter.jsp"%>
	</div>
	<%	
		//index.jsp에서 채팅을 눌렀을 때 parameter로 ip를 받습니다.
		String ip;
		if(request.getParameter("ip") != null) {
			ip = (String)request.getParameter("ip");
			System.out.println("index에서 받아온 parameter(ip)의 값은 : " + ip);
			request.setAttribute("ip", ip);
		}
	%>
	<script>
		window.onload = function() {
			
			console.log("스크립틀릿의 ip : " + $('#ip').val());
			var ip = $('#ip').val();
			var ipCut = ip.substr(ip.length-2, ip.length);
			
			//자신의 ip로 테이블 번호를 데이터베이스에서 꺼내옴 = tableNo
			var tableNo = $('#tableNo').val();
			var webSocket = new WebSocket('ws://192.168.0.26:7080/final_1802/broadcasting');
			
			console.log("도큐멘트 tableNo의 value = " + document.getElementById(tableNo).value);
			console.log("자른 ip : " + ipCut);
			
			webSocket.onopen = function() {
				$('#chatContent').append("연결 성공!!!!, tableNo : " + tableNo + " ipCut : " + ipCut);
				webSocket.send(tableNo + ipCut);	//3자리
			}
	
			webSocket.onmessage = function(msg) {
				//msg.data.substring(0, 1) : 자신의 table 번호
				//자기 자신이 보낸 메세지일 경우 div class=send, TableNo 사용
				var myTableNo = msg.data.substring(0, 1);
				if (myTableNo === tableNo) {
					// 자기 자신 테이블이 남자 테이블일 경우 div class=chatManBox(파랑 말풍선) 사용
					if(document.getElementById(tableNo).value === "man") {
						$('#chatContent').append
							( '<div class="textBlock col-md-12 col-xs-12">'
							+ '<div class="send">'
							+ '<h6>No. ' + tableNo + '</h6>'
							+ '<div class="chatManBox">'
							+ msg.data.substring(1, msg.data.length-2)
							+ '</div></div></div>'
						);
						// 자기 자신 테이블이 여자 테이블일 경우 div class=chatWomanBox(분홍 말풍선) 사용
					} else if(document.getElementById(tableNo).value === "woman") {
						$('#chatContent').append
							( '<div class="textBlock col-md-12 col-xs-12">'
							+ '<div class="send">'
							+ '<h6>No. ' + tableNo + '</h6>'
							+ '<div class="chatWomanBox">'
							+ msg.data.substring(1, msg.data.length-2)
							+ '</div></div></div>'
						);
						// 자기 자신 테이블이 혼성 테이블일 경우 div class=chatSeamBox(초록 말풍선) 사용
					} else if(document.getElementById(tableNo).value === "seam") {
						$('#chatContent').append
							( '<div class="textBlock col-md-12 col-xs-12">'
							+ '<div class="send">'
							+ '<h6>No. ' + tableNo + '</h6>'
							+ '<div class="chatSeamBox">'
							+ msg.data.substring(1, msg.data.length-2)
							+ '</div></div></div>'
						);
					}
				} 
				//받은 메세지일 경우 div class=receive, msg에서 테이블 번호 substring
				else {
					if(document.getElementById(myTableNo).value === "man") {
						$('#chatContent').append
							( '<div class="textBlock col-md-12 col-xs-12">'
							+ '<div class="receive">'
							+ '<h6>No. ' + msg.data.substring(0, 1) + '</h6>'
							+ '<div class="chatManBox">'
							+ msg.data.substring(1, msg.data.length-2)
							+ '</div></div></div>'
						);
					} else if(document.getElementById(myTableNo).value === "woman") {
						$('#chatContent').append
							( '<div class="textBlock col-md-12 col-xs-12">'
							+ '<div class="receive">'
							+ '<h6>No. ' + msg.data.substring(0, 1) + '</h6>'
							+ '<div class="chatWomanBox">'
							+ msg.data.substring(1, msg.data.length-2)
							+ '</div></div></div>'
						);
					} else if(document.getElementById(myTableNo).value === "seam") {
						$('#chatContent').append
							( '<div class="textBlock col-md-12 col-xs-12">'
							+ '<div class="receive">'
							+ '<h6>No. ' + msg.data.substring(0, 1) + '</h6>'
							+ '<div class="chatSeamBox">'
							+ msg.data.substring(1, msg.data.length-2)
							+ '</div></div></div>'
						);
					}
				}
				//메세지 오면 스크롤 아래로
				$("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
			}
	
			webSocket.onclose = function() {
				$('#chatContent').append("연결 종료");
			}
	
			$('#btnChatSend').click(function() {
				sendMessage();
			})
	
			$('#msg').keyup(function(e) {
				if (e.keyCode === 13) {
					sendMessage();
				}
			});
	
			function sendMessage() {
				var message = $('#msg').val();
				if ($.trim(message) !== "") {
					webSocket.send(tableNo + message + ipCut);
				}
				$('#msg').val("");	//textarea 지움
			}
		}
	
		// chat 테이블에 값이 있을 때, 공지 테이블이 있을 때 사용할 예정
		function loadWrap() {
			$('#chatNotice').load("notice.chat");
			$('#chatContent').load("content.chat");
		}
	</script>
</body>
</html>