<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tap_menu</title>
<style>
#menu_type {
 	width: 100%; 
	background: black;
	
}

#menu_type .tap_menu {
	display: inline-block;
	color: #76777a;
	font-size: 20px;
	width: 44%;
/*     text-align: center; */
}

#menu_type .tap_menu:hover, #menu_type .tap_menu:active {
	display: inline-block;
	color: white;
	font-size: 20px;
	text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 35px #ff2a00, 0 0 50px #ff2a00, 0 0 65px #ff2a00, 0 0 80px #ff2a00, 0 0 100px #ff2a00;
}

#snack {text-align: right;    margin-left: 3%;}
#liquor {text-align: left;    margin-left: 3%;}
</style>
</head>
<body>
<div id='menu_type'>
	<form name='tap_frm' id='tap_frm' method='post'>
		<input type='hidden' name='typeName' value='snack'/>
	</form>
	<span id='snack' class='tap_menu' onclick='goMenu(id)'>안주류</span>
	<span id='liquor' class='tap_menu' onclick='goMenu(id)'>주류</span>
</div>
<script>
var ff = document.tap_frm;
function goMenu(id){
	ff.typeName.value = id;
	var param = $('#tap_frm').serialize();
	$('#menu_list').load('center_menu.jsp', param);
	console.log(param);
}

</script>
</body>
</html>