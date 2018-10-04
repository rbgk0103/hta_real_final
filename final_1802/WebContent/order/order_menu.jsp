<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- jquery -->
<script src='./js/jquery-3.3.1.min.js'></script>
<script src='./js/jquery-ui.min.js'></script>
<link href='./js/jquery-ui.css' rel='stylesheet' type='text/css'/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#all {
/* 	width: 1600px; */
	height: 900px;
	border: 1px solid black;
	margin: 0 auto;
}

#t_menu {}

#l_menu, #c_menu, #r_menu {
	display: inline-block;
}

#l_menu {
	width: 17%;
	float: left;
}

#c_menu {
	width: 55%;
	float: left;
}

#r_menu {
	width: 28%;
}
</style>
</head>
<body>
<div id='all'>
	<div id='t_menu'>
		<%@include file="tap_menu.jsp" %>
	</div>
	<div id='l_menu'>
		<%@include file="left_menu.jsp" %>
	</div>
	<div id='c_menu'>
		<%@include file="center_menu.jsp" %>
	</div>
	<div id='r_menu'>
		<%@include file="right_order.jsp" %>
	</div>
</div>
</body>
</html>