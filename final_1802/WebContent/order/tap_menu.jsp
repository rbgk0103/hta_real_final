<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
