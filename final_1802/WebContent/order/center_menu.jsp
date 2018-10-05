<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			        <div class="item-img"> <img class="img-1" src="./order/img/dani.jpg" alt="" ></div>
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
			        <div class="item-img"> <img class="img-1" src="./order/img/dadadadada.jpg" alt="" ></div>
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