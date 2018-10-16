<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#menu_div {
	border: none;
	color: white;
	border-radius: 10px;
	text-align: center;
	margin: 10px;
	display: block;
	width: 300px;
	height: 300px;
	overflow:hidden;
	float: left;
	position: relative;
	background: #39435C;
}
#menu_div:hover{
	cursor: pointer;
	opacity: 0.6;
}
#menu_div > img {
	border-radius: 50%;
	width: 250px;
	height: 250px;
}
 #menu_div .menu_btn{
	background: #303030;
	color: #fff;
	border: none;
	font-size: 30px;;
	padding: 0 1.5em;
	display: inline-block;
	right: 0px;
	position: absolute;
	cursor:pointer;
	border-radius: 10px;
}
#menu_detail1112{
	border-radius: 20%;
}

#menu_index{
	padding-top: 40px;
	padding-left: 80px;
	padding-right: 80px;
	background:white;
	margin: auto;
	position: relative;
	border-radius: 5%;
	width: 100%;
	height: 1000px;
	display:block;
}
#menu_index ul{
	width: 100%; 
	background: #FFEBCD; 
	text-align: center;
}
#menu_index ul li{
	font-style: oblique; 
	font-size: 20px;
	width: 16%;
}
#menu_index ul li:hover{
	cursor: pointer;
	color: black;
	text-shadow:0 0 10px #fff, 0 0 20px #ff1114, 0 0 30px #ff1100;
}
#content{
	width: 100%;
	height:90%;
	overflow: auto;
	position: relative;
}

#btn_menu_insert{
	background: #303030;
	color: #fff;
	border: none;
	font-size: 1.6em;
	padding: 0 2em;
	display: inline-block;
	height: 50px;
	bottom: 0px;
	right: 110px;
	position: absolute;
	cursor:pointer;
	border-radius: 10px;
	font-style: oblique;
}
#btn_menu_insert:hover{
	text-shadow:0 0 10px #fff, 0 0 20px #ff1114, 0 0 30px #ff1100;
}
</style>
<!-- 메뉴 스타일 -->
<style>
#menu_center #menu_div{
	border: 1px solid black;
	text-align: center;
	margin:10px;
	display: block;
	width: 23%;
	height: 23%;
	float: left;
}
#menu_center #menu_div img{
	width: 150px;
	height: 150px;
}
</style>
<script>
function main_Load(menu_type){
	$('#menu_type').val(menu_type)
	var param = $("#frm_menu").serialize();
	$(".skin-black").load("./menu_list.adm", param);
}


function go_view(menu_no){
	$("#menu_no").val(menu_no);
	var param = $("#frm_menu").serialize();
	$(".skin-black").load("./menu_view.adm", param);
}
</script>
${msg }
<form name = 'frm_menu' id = 'frm_menu' method = 'post'>
	<input type = 'hidden' id = 'menu_type' name = 'menu_type' value = '${mt eq null ? "" : mt}'/>
	<input type = 'hidden' id = 'menu_no' name = 'menu_no'/>
</form>
<div id = 'menu_index'>
	<ul class="nav nav-tabs">
		<li><a onclick = 'main_Load()'><strong>전체메뉴</strong></a></li>
		<li><a onclick = 'main_Load("fury")'><strong>치즈&후라이</strong></a></li>
		<li><a onclick = 'main_Load("grill")'><strong>볶음&그릴</strong></a></li>
		<li><a onclick = 'main_Load("salad")'><strong>샐러드&떡볶이</strong></a></li>
		<li><a onclick = 'main_Load("stew")'><strong>탕&전골</strong></a></li>
		<li><a onclick = 'main_Load("drink")'><strong>주류</strong></a></li>
	</ul>
	<div id = 'content'>
		<div id = 'menu_center'>
			<div id = 'menu_read'>
				<c:forEach var = 'a' items = '${list }'>
					<div id='menu_div' class='menu_div' onclick='go_view(${a.menu_no})'>
						<span><strong>${a.menu_name }</strong></span><br/><span><strong>${a.menu_price } 원</strong></span><br/>
						<img src='./admin/menu/menuImg/${a.menu_image }'>
					</div>
				</c:forEach>
				<div class="modal fade" id="menu_detail1112">
					<jsp:include page="./menu_insert.jsp" />
				</div>
			</div>
		</div>
	</div>
	<input type = 'button' id = 'btn_menu_insert' data-toggle="modal" data-target="#menu_detail1112" value = '메뉴 등록'/>
</div>