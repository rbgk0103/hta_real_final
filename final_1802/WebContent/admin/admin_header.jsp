<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<a href="index.html" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
	Director
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
	role="button"> <span class="sr-only">Toggle navigation</span> <span
	class="icon-bar"></span> <span class="icon-bar"></span> <span
	class="icon-bar"></span>
</a>

<div class="navbar-right" id="call_employee">
	<ul class="nav navbar-nav">
		<!-- Messages: style can be found in dropdown.less-->
		<li class="dropdown messages-menu">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="message_box">
				<i class="fa fa-envelope"></i>
				<span class="label label-success"></span>
			</a>
		</li>
	</ul>
</div>
</nav>
<form name="message_form" method='post' target="message">
	<div id="message_form">
		<input type='hidden' class="order_message" />
	</div>
</form>
<script>
	$().ready(function(){
		var webSocket_request = new WebSocket('ws://192.168.0.28:7080/final_1802/request');
		
		webSocket_request.onopen = function() {
			console.log("오픈임");
		}
		webSocket_request.onmessage = function(msg) {
			console.log("msg : " + msg.data);
			$('#message_form').append("<input type='hidden' class='order_message' value=" + msg.data + " />")
			document.getElementById('order_message').value = msg.data
			if(document.getElementsByClassName('label-success')[0].innerHTML == "") {
				document.getElementsByClassName('label-success')[0].innerHTML = 0;
				document.getElementsByClassName('label-success')[0].innerHTML += 1;
			} else {
				document.getElementsByClassName('label-success')[0].innerHTML += 1;
			}
		}
		webSocket_request.onclose = function() {
			console.log("소켓 꺼짐");
		}
		
		$('#call_employee').click(function(){
			window.open("", "message", "_blank", 'width=120, height=400');
			var df = document.message_form;
			df.action="./admin/admin_call_employee.jsp?msg=asdf";
			df.submit();
		})
	});
</script>