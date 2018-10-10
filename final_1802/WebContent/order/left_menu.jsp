<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='menu'>
	<form id='leftMenu' method='post'>
		<input type='hidden' name='findStr' id='findStr'/>
	</form>
	<ul>
		<li onclick='leftMenu("best")'> Best메뉴</li>
		<li onclick='leftMenu("fury")'> 치즈&후라이</li>
		<li onclick='leftMenu("grill")'>볶음&그릴</li>
		<li onclick='leftMenu("salad")'>샐러드&떡볶이</li>
		<li onclick='leftMenu("stew")'> 탕&전골</li>
		<li onclick='leftMenu("drink")'>주류</li>
	</ul>
</div>

<script>
function leftMenu(menu_type){
	$('#leftMenu #findStr').val(menu_type);
	var param = $('#leftMenu').serialize();
	$('#menu_list').load('center.ord', param);
}
</script>
