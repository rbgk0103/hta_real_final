<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='./lib/jquery-3.3.1.js'></script>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<meta name="description" content="Developed By M Abdur Rokib Promy">
<meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
<!-- bootstrap 3.0.2 -->
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="./css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- google font -->.
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="./css/admin_css.css" rel="stylesheet" type="text/css" />
<link href="./css/orders_css.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./lib/bootstrap.min.js" type="text/javascript"></script>
<style>
#wrap {background-image : url(./img/background-img.jpg);height:900px;width:100%;color:#fff;}
#header{height:140px;}
#header_logo{height:100%;}
#header_logo a >img{height:100%;cursor:pointer;}
#header_menu{line-height: 5;}
#header_menu a{font-size:30px;margin: 0px 4%;color: #fff;text-decoration:none;cursor:pointer;font-weight:bold;}
#header_menu a:hover{
text-shadow: 
	0 0 10px #fff,
	0 0 20px #fff,
	0 0 30px #fff, 
	0 0 40px #d1ad8f, 
	0 0 70px #d1ad8f,
	0 0 80px #d1ad8f, 
	0 0 100px #d1ad8f, 
	0 0 150px #d1ad8f;
}
#header_tableNo{line-height: 2.1;}
#header_tableNo a {font-weight: 900;font-size: 70px;color: #fff;text-decoration:none;margin-left: 30px;}
   
</style>
<title>중앙 포차</title>
</head>
<body>
<%
String content = "order/order_menu.jsp";

if(request.getParameter("content") !=null){
	content = request.getParameter("content");  
}
%>
<div id = 'wrap'>
	<div id = 'header'>
		<div class='col-md-4'  id = 'header_logo'>
			<a href ="index.jsp">
				<img src ='./img/logo.png'>
			</a>
		</div>
		<div class='col-md-6' id = 'header_menu'>
			<a href ="#">메뉴</a>
			<a href ="#">게임</a>
			<a href ="#">채팅</a>
			<a href ="#">로그인</a>
			<a href ="#" data-toggle="modal" data-target="#myModal">직원호출</a>
		</div>
		<div class='col-md-1' id = 'header_tableNo'>
			<a>No.01</a>
		</div>
	</div>
	<div id ='content'>
		<jsp:include page="<%=content %>"/>
	</div>
</div>
<div id = 'modal_call_employee'>

</div>
</body>
</html>