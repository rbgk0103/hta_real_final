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
	background: #303030;
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
function main_Load(menu_type){
	$('#menu_type').val(menu_type)
	var param = $("#frm_menu").serialize();
	$(".skin-black").load("./menu_list.adm", param);
}

$().ready(function(){
	$('#menu_index').tabs();
	$('#menu_index').css({'width':'960px', 'height':'750px'});
	
})
function go_insert(){
	location.href="admin_index.jsp?content=menu/menu_insert.jsp";
}
function go_view(menu_no){
	$("#menu_no").val(menu_no);
	var param = $("#frm_menu").serialize();
	$(".content").load("../view.menu", param);
}
</script>



${msg }
<form name = 'frm_menu' id = 'frm_menu' method = 'post'>
	<input type = 'text' id = 'menu_type' name = 'menu_type' value = '${mt eq null ? "" : mt}'/>
	<input type = 'hidden' id = 'menu_no' name = 'menu_no'/>
</form>
<div id = 'menu_index'>
	<ul>
		<li style = "font-style: italic;"><a onclick = 'main_Load()' href = '#menu_read'>전체메뉴</a></li>
		<li style = "font-style: italic;"><a onclick = 'main_Load("fury")' href = '#menu_read'>치즈&후라이</a></li>
		<li style = "font-style: italic;"><a onclick = 'main_Load("grill")' href = '#menu_read'>볶음&그릴</a></li>
		<li style = "font-style: italic;"><a onclick = 'main_Load("salad")' href = '#menu_read'>샐러드&떡볶이</a></li>
		<li style = "font-style: italic;"><a onclick = 'main_Load("stew")' href = '#menu_read'>탕&전골</a></li>
		<li style = "font-style: italic;"><a onclick = 'main_Load("drink")' href = '#menu_read'>주류</a></li>
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
			</div>
			<div id= 'tab_b'>
			</div>
			<div id = 'tab_c'>
			</div>
		</div>
	</div>
	<input type = 'button' id = 'btn_menu_insert' data-toggle="modal" data-target="#menu_detail1112" value = '메뉴 등록'/>
</div>

<div class="modal fade" id="menu_detail1112" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<jsp:include page="./menu_insert.jsp" />
</div>
<script>
$().ready(function(){
	if($("#menu_type").val() == "fury"){
		$("#menu_index").tabs().tabs({'active':1});
	}else if($("#menu_type").val() == "grill"){
		$("#menu_index").tabs().tabs({'active':2});		
	}else if($("#menu_type").val() == "salad"){
		$("#menu_index").tabs().tabs({'active':3});	
	}else if($("#menu_type").val() == "stew"){
		$("#menu_index").tabs().tabs({'active':4});
	}else if($("#menu_type").val() == "drink"){
		$("#menu_index").tabs().tabs({'active':5});
	}else if($("#menu_type").val() == "best"){
		$("#menu_index").tabs().tabs({'active':0});
	}
})
</script>