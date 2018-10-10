<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id='menu_list'>
	
	<form name='menu_frm' id='menu_frm' method='post'>
		<input type='hidden' name='menu_no'/>
		<c:forEach var='list' items='${list}'>
		<input type='hidden' name='typeName' value='${list.menu_type }'/>
			<div class="col-md-3">
				<div class="item" onclick='appendMenu("${list.menu_no}", "${list.menu_name }", "${list.menu_price }")'> 
		        <!-- Item img -->
		        <div class="item-img"> <img class="img-1" src="./admin/menu/menuImg/${list.menu_image }" alt="" ></div>
		        <!-- Item Name -->
		        <div class="item-name"><a>${list.menu_name }</a></div>
		        <!-- Price --> 
		        <span class="price">${list.menu_price }</span>
		      	</div>
			</div>
		</c:forEach>
	</form>
	
</div>

<script>
var tableZone;
var m_no, m_name, m_price;
var cnt;
function appendMenu(no, name, price){
	m_no = no;
	m_name = name;
	m_price = price;
	tableZone = $('#tableZone')[0];
	addMenu(tableZone, m_no, m_name, m_price);
}

// function addMenu(tableZone, no, name, price){
// 	var div = document.createElement("div");
// 	div.setAttribute("class", "add_list");
	
// 	var span1 = document.createElement("span");
// 	span1.setAttribute("class", "r_name");
// 	span1.innerHTML = name;
// 	div.appendChild(span1);
	
// 	var span2 = document.createElement("span");
// 	span2.setAttribute("class", "glyphicon glyphicon-minus");
// 	span2.setAttribute("aria-hidden", "true");
// 	div.appendChild(span2);
	
// 	var span3 = document.createElement("span");
// 	span3.setAttribute("class", "r_cnt");
// 	cnt = 1;
// 	span3.innerHTML = cnt;
// 	div.appendChild(span3);
	
// 	var span4 = document.createElement("span");
// 	span4.setAttribute("class", "glyphicon glyphicon-plus");
// 	span4.setAttribute("aria-hidden", "true");
// 	div.appendChild(span4);

// 	var span5 = document.createElement("span");
// 	span5.setAttribute("class", "r_price");
// 	span5.innerHTML = price;
// 	div.appendChild(span5);
	
// 	tableZone.appendChild(div);
// }

function addMenu(tableZone, no, name, price){
	var div = document.createElement("tr");
	div.setAttribute("class", "add_list");
	
	var span1 = document.createElement("td");
	span1.setAttribute("class", "r_name");
	span1.innerHTML = name;
	div.appendChild(span1);
	
	var span2 = document.createElement("td");
	span2.setAttribute("class", "glyphicon glyphicon-minus");
	span2.setAttribute("aria-hidden", "true");
	div.appendChild(span2);
	
	var span3 = document.createElement("td");
	span3.setAttribute("class", "r_cnt");
	cnt = 1;
	span3.innerHTML = cnt;
	div.appendChild(span3);
	
	var span4 = document.createElement("td");
	span4.setAttribute("class", "glyphicon glyphicon-plus");
	span4.setAttribute("aria-hidden", "true");
	div.appendChild(span4);

	var span5 = document.createElement("td");
	span5.setAttribute("class", "r_price");
	span5.innerHTML = price;
	div.appendChild(span5);
	
	tableZone.appendChild(div);
}

</script>
</body>
</html>