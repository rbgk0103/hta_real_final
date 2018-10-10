<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#menu_view{
	position: relative;
/* 	border-radius: 50px;
	background:#E9F0F2; */
	margin: auto;
/* 	top: 60px; */
	width: 700px;
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
#day_h{
	color: red;
	position: absolute;
	left: 0px;
	
}
</style>
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
		$('#frm_menu_view #menu_type').val(str);
	})
	$("#btn_modify").click(function(){
		var ff = document.frm_menu_view;
		var data = new FormData(ff);
		$.ajax({
			url : './menu_modify.adm',
			data : data,
			type : 'post',
			contentType : false,
			processData : false,
			success : function(resp){
				$(".skin-black").html(resp);
			}
		});
	})
	$("#btn_delete").click(function(){
		var ff = document.frm_menu_view;
		var data = new FormData(ff);
		$.ajax({
			url : './menu_delete.adm',
			data : data,
			type : 'post',
			contentType : false,
			processData : false,
			success : function(resp){
				$(".skin-black").html(resp);
			}
		});
	})
	$("#btn_today_yes").click(function(){
		var ff = document.frm_menu_view;
		var data = new FormData(ff);
		$.ajax({
			url : './menu_today.adm',
			data : data,
			type : 'post',
			contentType : false,
			processData : false,
			success : function(resp){
				$(".skin-black").html(resp);
			}
		});
	})
	$("#btn_today_no").click(function(){
		var ff = document.frm_menu_view;
		var data = new FormData(ff);
		$.ajax({
			url : './menu_today_no.adm',
			data : data,
			type : 'post',
			contentType : false,
			processData : false,
			success : function(resp){
				$(".skin-black").html(resp);
			}
		});
	})
	$("#btn_cancel").click(function(){
		$(".skin-black").load("./menu_list.adm");
	})
})
</script>
<div id = 'menu_view'>
<div id = 'button_div'>
	<c:choose>
		<c:when test="${vo.menu_day eq 'no'}">
			<input type = 'button' class = 'button' name = 'btn_today_yes' id=  'btn_today_yes' value = '오늘의 메뉴 등록'/>
		</c:when>
		<c:otherwise>
			<input type = 'button' class = 'button' name = 'btn_today_no' id=  'btn_today_no' value = '오늘의 메뉴 취소'/>	
		</c:otherwise>
	</c:choose>
	<br/><br/><br/><br/>
	<input type = 'button' class = 'button' name = 'btn_G' id = 'btn_G' value = 'GAME 등록' /><br/><br/>
	<input type = 'button' class = 'button' name = 'btn_A' id = 'btn_A' value = 'AUCTION 등록'/><br/>
</div>
	<br/>
	<c:choose>
	<c:when test="${vo.menu_day eq 'yes'}">
			<h2 id = 'day_h'>※ 오늘의 메뉴 ※</h2>
	</c:when>
	</c:choose>
	<h1><Strong>${vo.menu_name }</Strong></h1>
	<hr class = 'my_hr'/>
	<form id = 'frm_menu_view' name = 'frm_menu_view' method = 'post' enctype = "multipart/form-data">
	<input type = 'hidden' id = 'menu_type' name = 'menu_type'value = 'fury'/>
		<input type = 'hidden' id = 'menu_no' name = 'menu_no' value = ${vo.menu_no }>
		<label><h3><Strong>이 름  </Strong></h3></label>
		<input type = 'text' size = '15' id = 'menu_name' name = 'menu_name' value = '${vo.menu_name }'/><br/>
		<label><h3><Strong>가 격  </Strong></h3></label>
		<input type = 'text' size = '15' id = 'menu_price' name = 'menu_price' value = '${vo.menu_price }'/><br/>
		<label> <h3><strong>메뉴 타입 </strong></h3>
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
		<img src = './admin/menu/menuImg/${vo.menu_image }' id = 'img' name = 'img'/>
		<input type = 'file' name = 'menu_image' id = 'menu_image'/>
		<hr class = 'my_hr'/>
		<input type = 'button' value = '수 정' id = 'btn_modify' class = 'menu_btn' name = 'btn_modify'/>
		<input type = 'button' value = '삭 제' id = 'btn_delete' class = 'menu_btn' name = 'btn_delete'/>
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
