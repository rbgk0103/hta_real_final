<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>center_menu</title>
<style>
#menu_list {
	background: white;
	width: 100%;
	height: 700px;
	overflow-y: scroll;
}

#menu_list .item {
	margin-top: 5px;
	margin-bottom: 50px;
	position: relative;
}

#menu_list  .item-img {
	position: relative;
	overflow: hidden;
}

#menu_list .item img {
	width: 100%;
	margin-top: 0px;
	top: 0px;
	left: 0px;
	position: relative;
}

#menu_list .item-name {
	width: 100%;
	text-align: center;
}

#menu_list  .item-name a {
	font-size: 22px;
	font-weight: bold;
	letter-spacing: 3px;
	color: #2d3a4b;
	text-transform: uppercase;
}

#menu_list .price {
	font-size: 18px;
	font-weight: bold;
	z-index: 9;
	display: inline-block;
	width: 100%;
	text-align: center;
	margin-top: 20px;
	color: #2d3a4b;
</style>

</head>
<body>
<%
	String typeName = "snack";
	if (request.getParameter("typeName") != null){
		typeName = request.getParameter("typeName");
	};
	request.setAttribute("typeName", typeName);
%>
	
<div id='menu_list'>
	<form name='menu_frm' id='menu_frm' method='post'>
		<input type='hidden' name='menuName'/>
		<input type='hidden' name='typeName' value='${typeName }'/>
	</form>
	
	<c:choose>
	<c:when test='${typeName == "snack"}'>
		<c:forEach var='i' begin='1' end='10'>
			<div class="col-md-3">
				<div class="item" onclick='appendMenu("snack")'> 
			        <!-- Item img -->
			        <div class="item-img"> <img class="img-1" src="img/dani.jpg" alt="" ></div>
			        <!-- Item Name -->
			        <div class="item-name"><a href="#.">안주류</a></div>
			        <!-- Price --> 
			        <span class="price">15.0</span>
		      	 </div>
			</div>
		</c:forEach>
	</c:when>
		<c:when test='${typeName ==  "liquor"}'>
		<c:forEach var='k' begin='1' end='10'>
			<div class="col-md-3">
				<div class="item" onclick='appendMenu("liquor")'> 
			        <!-- Item img -->
			        <div class="item-img"> <img class="img-1" src="img/dadadadada.jpg" alt="" ></div>
			        <!-- Item Name -->
			        <div class="item-name"><a href="#.">주류</a></div>
			        <!-- Price --> 
			        <span class="price">5.0</span>
		       </div>
			</div>
		</c:forEach>
	</c:when>
	</c:choose>
	
</div>

<script>

var fm = document.menu_frm;
function appendMenu(name){
	fm.menuName.value = name;
	alert(fm.menuName.value);
	$('.table_add').append(fm.menuName.value);
}

</script>
</body>
</html>