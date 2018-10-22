<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	
	console.log("table_set_result에서 tableNo를 사용해 아이피 두 자리를 받아온 값은 ?.? : " + ${table_ip_cut});
	var ipCut = ${table_ip_cut};
	var indexWebSocket = new WebSocket("ws://192.168.0.26:7080/final_1802/index");
	indexWebSocket.onopen = function() {
		console.log("indexWebsocket 오픈");
		var msg = "테이블 설정이 완료 되었습니다.";
		indexWebSocket.send(ipCut + msg);
		alert("테이블 설정 완료");
		//location.href = "./table_status.adm";
	}
	indexWebSocket.onclose = function() {
		console.log("indexWebSocket 클로즈");
	}
	indexWebSocket.onmessage = function() {
	}
</script>
