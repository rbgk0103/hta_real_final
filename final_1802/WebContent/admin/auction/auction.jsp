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
<input type = 'button' id = 'btnAucStart' value = '��� ����' />
<script>
	$(function() {
		var websocket = new WebSocket("ws://192.168.0.29:7080/final_1802/auction");
		
		websocket.onopen = function() {
			console.log("���� ����");
			websocket.send("5");
			websocket.send("5" +' ${ae_no}' + '${ae_max}' + '${ae_min}' + '${ae_price}'+'����');
		}
		
		websocket.onclose = function () {
			console.log("���᳡");
		}
		
		websocket.onmessage = function(msg) {
			console.log(msg.data);
			if(msg.data.substring(0, 1) == "5") {
				console.log("�����ڰ� ���� �޼����̹Ƿ� �ƹ��͵� �� ��");
			} else {
				console.log("�ٸ� ���̺��� �޴� �޼�����, msg.data : " + msg.data);
			}
		}
	});
</script>
</body>
</html>