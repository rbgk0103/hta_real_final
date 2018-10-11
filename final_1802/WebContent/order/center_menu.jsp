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
var tableZone; // right_order.jsp에서 tableZone은 tbody영역
var m_no, m_name, m_price;
var cnt = 0;
function appendMenu(no, name, price){
	m_no = no;
	m_name = name;
	m_price = price;
	tableZone = $('#tableZone')[0];
	addMenu(tableZone, m_no, m_name, m_price);
}

 // table태그의 구조를 이용하여 주문서에 append하기
function addMenu(tableZone, no, name, price){
	var tr = document.createElement("tr");
	
	var tdName = document.createElement("td");
	tdName.setAttribute("class", "tdName");
	tdName.innerHTML = name;
	tr.appendChild(tdName);
	
	var btnMinus = document.createElement("span");
	btnMinus.setAttribute("class", "glyphicon glyphicon-minus");
	btnMinus.setAttribute("aria-hidden", "true");
	
	var btnPlus = document.createElement("span");
	btnPlus.setAttribute("class", "glyphicon glyphicon-plus cntplus");
	btnPlus.setAttribute("aria-hidden", "true");
	
	var spanCnt = document.createElement("span");
	spanCnt.setAttribute("class", "spanCnt");
	spanCnt.innerHTML = 1;
	
	var tdCnt = document.createElement("td");
	tdCnt.setAttribute("class", "tdCnt");
	tdCnt.appendChild(btnMinus);
	tdCnt.append(spanCnt);
	tdCnt.appendChild(btnPlus);
	tr.appendChild(tdCnt);
	
	btnPlus.onclick = function(ev){
 		var tag = ev.srcElement;
		var qty = tag.previousSibling;
		qty.innerHTML = Number(qty.innerHTML) + 1;
	}
	
	btnMinus.onclick = function(ev){
 		var tag = ev.srcElement;
		var qty = tag.nextSibling;
		if (qty.innerHTML != 1){
			qty.innerHTML = Number(qty.innerHTML) - 1;
		}
	}
	
	var tdPrice = document.createElement("td");
	tdPrice.innerHTML = price;
	tr.appendChild(tdPrice);
	
	var tdDel = document.createElement("td");
	tr.appendChild(tdDel);
	
	var btnDel = document.createElement("span");
	btnDel.setAttribute("class", "glyphicon glyphicon-remove");
	btnDel.setAttribute("aria-hidden", "true");
	tdDel.appendChild(btnDel);
	btnDel.onclick = function(ev){
		tableZone.removeChild(tr);
	}
	
	tableZone.appendChild(tr);
}



</script>
</body>
</html>