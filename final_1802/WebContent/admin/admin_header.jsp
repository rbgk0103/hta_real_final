<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<a href="table_status.adm" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
	<img src = "./img/logo.png"/>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->


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

	$('#call_employee').click(function(){
		window.open("./admin/admin_call_employee.jsp", "", "_blank", 'width=120px, height=400px');

	})

</script>