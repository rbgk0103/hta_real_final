<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<!--부트스트렙-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
#menu_index{
	background:white;
	margin: auto;
	width: 1100px;
	height: 800px;
	display:block;
}
#content{
	width: 950px;
	height:700px;
	overflow: auto;
}
#btn_menu_insert{
	background: #1AAB8A;
	color: #fff;
	border: none;
	font-size: 1.6em;
	padding: 0 2em;
	display: inline-block;
	height: 50px;
	bottom: 10px;
	right: 23px;
	position: absolute;
	cursor:pointer;
	border-radius: 10px;
	font-style: oblique;
}
#btn_menu_insert:hover{
	background: #ff0f;
	color: #1AABBf;
}
</style>

<!-- 메뉴 스타일 -->
<style>
#menu_center #menu_div{
	border: 1px solid black;
	text-align: center;
	margin:10px;
	display: block;
	width: 200px;
	height: 200px;
	float: left;
}
#menu_center #menu_div img{
	width: 150px;
	height: 150px;
}
</style>
<script>
function main_Load(str){
	var frm = document.frm_menu;
	frm.menu_type.value = str;
}
</script>
<script>
$().ready(function(){
	$('#menu_index').tabs();
	$('#menu_index').css({'width':'960px', 'height':'750px'});
	$('#menu_center_a').load('./menu/menu_center.jsp');
})
function go_insert(){
	location.href="./menu/menu_insert.jsp";
}
</script>
<script id = 'script'></script>
</head>
<body>
<form method = 'post' name = 'frm_menu' id = 'frm_menu'>
	<input type = 'hidden' id = 'menu_type ' name = 'menu_type' value = 'best'/>
</form>
<div id = 'menu_index'>
	<ul>
		<li style = "font-style: italic;"><a href = '#menu_center_a' onclick = 'main_Load("best")'>베스트메뉴(Best)</a></li>
		<li style = "font-style: italic;"><a href = '#menu_center_b' onclick = 'main_Load("fury")'>치즈&후라이</a></li>
		<li style = "font-style: italic;"><a href = '#menu_center_a' onclick = 'main_Load("grill")'>볶음&그릴</a></li>
		<li style = "font-style: italic;"><a href = '#menu_center_a' onclick = 'main_Load("salad")'>샐러드&떡볶이</a></li>
		<li style = "font-style: italic;"><a href = '#menu_center_a' onclick = 'main_Load("stew")'>탕&전골</a></li>
		<li style = "font-style: italic;"><a href = '#menu_center_a' onclick = 'main_Load("drink")'>주류</a></li>
		</ul>
	<div id = 'content'>
		<div id = 'menu_center'>
			<div id = 'menu_center_a'>
			</div>
			<div id = 'menu_center_b'>
			</div>
		</div>
	</div>
	<input type = 'button' id = 'btn_menu_insert' value = '메뉴 등록' onclick = 'go_insert()'/>
</div>
</body>
</html>