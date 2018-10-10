<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
#menu_insert{
	border-radius: 50px;
	background:white;
	margin: auto;
	width: 600px;
	top: 90px;
	height: 600px;
	display:block;
	text-align: center;
}
#frm_menu_insert #menu_image{
	display: none;
}
#frm_menu_insert #img{
	border-radius: 50px;
	width: 160px;
	height: 120px;
}
#frm_menu_insert #menu_name,#menu_price, #menu_select{
	border-radius: 50px;
}
#frm_menu_insert .menu_btn{
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
#frm_menu_insert .menu_btn:hover{
	background: #ff0f;
	color: #1AABBf;
}
.my_hr{
	height: 3px;
	border: 0;
	background: #ccc;
}
#frm_menu_insert input{
	text-align: center;
	color: green;
}
</style>

<script>
$().ready(function(){
	$("#frm_menu_insert #img").click(function(){
		$("#frm_menu_insert #menu_image").click();
	})
	$("#frm_menu_insert #menu_select").change(function(){
		var str = "";
		$("#frm_menu_insert #menu_select option:selected").each(function(){
			str = $(this).val();
		});
		$('#frm_menu_insert #menu_type').val(str);
	})
	
	$("#btn_insert").click(function(){
		var ff = document.frm_menu_insert;
		var data = new FormData(ff);
		$.ajax({
			url : '../insert.menu',
			data : data,
			type : 'post',
			contentType : false,
			processData : false,
			success : function(resp){
				$(".content").html(resp);
			}
		});
	})
})
</script>
 <div class="modal-dialog">
    <div class="modal-content">
		<div id = 'menu_insert'>
			<br/>
			<h1><strong>메뉴 등록</strong></h1>
			<hr class = 'my_hr'/>
			<form method = 'post' id = 'frm_menu_insert' name = 'frm_menu_insert' enctype = "multipart/form-data">
				<input type = 'text' id = 'menu_type' name = 'menu_type' value = 'fury'/>
				<label><h3><Strong>이 름  </Strong></h3></label>
				<input type = 'text' size = '15' id = 'menu_name' name = 'menu_name'/><br/>
				<label><h3><Strong>가 격  </Strong></h3></label>
				<input type = 'text' size = '15' id = 'menu_price' name = 'menu_price'/><br/>
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
				<input type = 'button' value = '등 록' id = 'btn_insert' class = 'menu_btn' name = 'btn_insert'/>
				<input type = 'button' value = '취 소' id = 'btn_cancel' class = 'menu_btn' name = 'btn_cancel' class="btn btn-default" data-dismiss="modal"/>
			</form>
		</div>
	</div>
</div>
<script>
var ff = document.frm_menu_insert;
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
