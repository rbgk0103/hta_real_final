<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<title>Insert title here</title>
<style>
#menu_view{
	position: relative;
	border-radius: 50px;
	background:white;
	margin: auto;
	width: 600px;
	height: 600px;
	display:block;
	text-align: center;
}
#frm_menu_view #menu_image{
	display: none;
}
#frm_menu_view #img{
	border-radius: 50px;
	width: 160px;
	height: 120px;
}
#frm_menu_view #menu_name,#menu_price, #menu_select{
	border-radius: 50px;
}
#frm_menu_view .menu_btn{
	background: #1AAB8A;
	color: #fff;
	border: none;
	font-size: 1.6em;
	padding: 0 2em;
	display: inline-block;
	height: 50px;
	cursor:pointer;
	border-radius: 10px;
	font-style: oblique;
}
#frm_menu_view .menu_btn:hover{
	background: #ff0f;
	color: #1AABBf;
}
.my_hr{
	height: 3px;
	border: 0;
	background: #ccc;
}
#frm_menu_view input{
	text-align: center;
	color: green;
}
#button_div{
	position: absolute;
	right:15px;
	top: 30px;
}
#button_div .button{
	background: #1AAB8A;
	padding: 10px;
	cursor:pointer;
	color: #fff;
	font-style: oblique;
	border: none;
	border-radius: 50px;
}
#button_G, #button_A{
	
}
#menu_name, #menu_price{
	
}
</style>
</head>
<body>
<script>
$().ready(function(){
	$("#frm_menu_view #img").click(function(){
		$("#frm_menu_view #menu_image").click();
	})
	$("#frm_menu_view #menu_select").change(function(){
		var str = "";
		$("#frm_menu_view #menu_select option:selected").each(function(){
			str = $(this).val();
		});
		$('#menu_type').val(str);
	})
})
</script>
<div id = 'menu_view'>
<div id = 'button_div'>
	<input type = 'button' class = 'button' name = '' id=  '' value = '오늘의 메뉴 등록'/><br/><br/><br/><br/>
	<input type = 'button' class = 'button' name = 'btn_G' id = 'btn_G' value = 'GAME 등록'/><br/><br/>
	<input type = 'button' class = 'button' name = 'btn_A' id = 'btn_A' value = 'AUCTION 등록'/><br/>
</div>
	<br/>
	<h1><Strong>치즈콘치킨</Strong></h1>
	<hr class = 'my_hr'/>
	<form id = 'frm_menu_view' name = 'frm_menu_view' method = 'post' enctype = "multipart/form-data">
	<input type = 'hidden' id = 'menu_type' name = 'menu_type'/>
		<label><h3><Strong>이 름  </Strong></h3></label>
		<input type = 'text' size = '15' id = 'menu_name' name = 'menu_name' value = '치즈콘치킨'/><br/>
		<label><h3><Strong>가 격  </Strong></h3></label>
		<input type = 'text' size = '15' id = 'menu_price' name = 'menu_price' value = '11000 원'/><br/>
		<label> <h3><strong>메뉴 타입</strong></h3>
		<select id = 'menu_select' name = 'menu_select'>
			<option value = 'fury'>치즈&후라이</option>
			<option value = 'grill'>볶음&그릴</option>
			<option value = 'salad'>샐러드&떡볶이</option>
			<option value = 'stew'>탕&전골</option>
			<option value = 'drink'>주류</option>						
		</select>
		</label>
		<br/>
		<hr class = 'my_hr'/>
		<img src = 'http://placehold.it/160x120' id = 'img' name = 'img'/>
		<input type = 'file' name = 'menu_image' id = 'menu_image'/>
		<hr class = 'my_hr'/>
		<input type = 'button' value = '수 정' id = 'btn_modify' class = 'menu_btn' name = 'btn_modify'/>
		<input type = 'button' value = '취 소' id = 'btn_cancel' class = 'menu_btn' name = 'btn_cancel'/>
	</form>
</div>
<script>
var ff = document.frm_menu_view;
var menu_image = ff.menu_image;
menu_image.onchange = function(event){
	var file = event.srcElement;
	var url = menu_image.files[0];
	var reader = new FileReader();
	
	reader.onload = function(e){
		ff.img.src = e.target.result;
	}
	reader.readAsDataURL(url);
}
</script>
</body>
</html>