<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>left_menu</title>
<style>
#menu {
	display: inline-block;
	background: #343a4e;
	color: #515b7b;
 	width: 100%; 
	height: 700px;
}

#menu ul {padding-top: 30px;}

#menu ul li {
	list-style: none;
	font-size: 20px;
	text-decoration: underline;
	margin: 5px;
}

#menu ul li:hover, #menu ul li:active {
/* 	list-style: none; */
	font-size: 20px;
	text-decoration: underline;
	color: white;
	text-shadow: 0 0 10px #fff,
		 0 0 20px #fff,
 		 0 0 30px #fff, 
		 0 0 40px #d1ad8f, 
		 0 0 70px #d1ad8f,
 		 0 0 80px #d1ad8f, 
 		 0 0 100px #d1ad8f, 
 		 0 0 150px #d1ad8f; 
}
</style>
</head>
<body>
<div id='menu'>
	<ul>
		<li>Best메뉴</li>
		<li>치즈&후라이</li>
		<li>볶음&그릴</li>
		<li>샐러드&떡볶이</li>
		<li>탕&전골</li>
		<li>주류</li>
	</ul>
</div>
</body>
</html>