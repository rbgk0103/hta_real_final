<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src='../../lib/jquery-3.3.1.js'></script>
<title>Insert title here</title>
</head>
<body>
${ae_no }
${ae_max }
${ae_min }
${ae_price }
<input type = 'button' id = 'btnAucStart' value = '경매 시작' />
<script>
	$(function() {
		var websocket = new WebSocket("ws://192.168.0.29:7080/final_1802/auction");
		
		websocket.onopen = function() {
			console.log("연결 ㅇㅋ");
			websocket.send("5");
			websocket.send("5" +' ${ae_no}' + '${ae_max}' + '${ae_min}' + '${ae_price}'+'ㅎㅎ');
		}
		
		websocket.onclose = function () {
			console.log("연결끝");
		}
		
		websocket.onmessage = function(msg) {
			console.log(msg.data);
			if(msg.data.substring(0, 1) == "5") {
				console.log("관리자가 보낸 메세지이므로 아무것도 안 함");
			} else {
				console.log("다른 테이블에서 받는 메세지임, msg.data : " + msg.data);
			}
		}
	});
</script>
</body>
</html>