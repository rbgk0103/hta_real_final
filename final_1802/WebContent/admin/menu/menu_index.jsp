<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function main_Load(str){
	$("#menu_type").val(str);
	var param = $("#frm_menu").serialize();
	$(".content").load("list.menu", str);
}
</script>
<script>
$().ready(function(){
	$('#menu_index').tabs();
	$('#menu_index').css({'width':'960px', 'height':'750px'});
})
function go_insert(){
	location.href="./menu/menu_insert.jsp";
}
function go_view(){
	
}
</script>
<script id = 'script'></script>
</head>
<body>
<form name = 'frm_menu' id = 'frm_menu' method = 'post'>
	<input type = 'hidden' id = 'menu_type ' name = 'menu_type' value = 'best'/>
</form>
<div id = 'menu_index'>
	<ul>
		<li style = "font-style: italic;"><a href = '#menu_read' onclick = 'main_Load("best")'>베스트메뉴(Best)</a></li>
		<li style = "font-style: italic;"><a href = '#menu_read' onclick = 'main_Load("fury")'>치즈&후라이</a></li>
		<li style = "font-style: italic;"><a href = '#menu_read' onclick = 'main_Load("grill")'>볶음&그릴</a></li>
		<li style = "font-style: italic;"><a href = '#menu_read' onclick = 'main_Load("salad")'>샐러드&떡볶이</a></li>
		<li style = "font-style: italic;"><a href = '#menu_read' onclick = 'main_Load("stew")'>탕&전골</a></li>
		<li style = "font-style: italic;"><a href = '#menu_read' onclick = 'main_Load("drink")'>주류</a></li>
		</ul>
	<div id = 'content'>
		<div id = 'menu_center'>
			<div id = 'menu_read'>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
					<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
				<div id='menu_div' class='menu_div' data-toggle="modal" data-target="#menu_detail123" onclick=''>
					<span><strong>치즈콘치킨</strong></span><br/><span><strong>11000 원</strong></span><br/> 
					<img src='../img/fury_1.jpg'>
				</div>
			</div>
		</div>
	</div>
	<input type = 'button' id = 'btn_menu_insert' value = '메뉴 등록' onclick = 'go_insert()'/>
</div>

<div class="modal fade" id="menu_detail123" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<jsp:include page="menu_view.jsp" />
</div>
