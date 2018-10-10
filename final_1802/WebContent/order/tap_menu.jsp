<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id='menu_type'>
	<form name='tap_frm' id='tap_frm' method='post'>
		<input type='hidden' name='findStr'/>
	</form>
	<span id='snack' class='tap_menu' onclick='goMenu("snack")'>안주류</span>
	<span id='liquor' class='tap_menu' onclick='goMenu("drink")'>주류</span>
</div>
<script>
var ff = document.tap_frm;
function goMenu(id){
	ff.findStr.value = id;
	var param = $('#tap_frm').serialize();
	$('#menu_list').load('center.ord', param);
	console.log(param);
}

</script>
