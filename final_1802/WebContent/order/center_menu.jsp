<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id='menu_list'>
	
	<form name='menu_frm' id='menu_frm' method='post'>
		<input type='hidden' name='page' value='${param.page }'/>
		<input type='hidden' name='gt_with' value='${param.gt_with}' />
		<input type='hidden' name='gt_no' value='${param.gt_no}' />
		<input type='hidden' name='tbl_i' value='${param.tbl_i}' />
		<input type='hidden' name='tbl_u' value='${param.tbl_u}' />
		<input type='hidden' name='menu_no'  />
		<c:forEach var='list' items='${list}'>
		<input type='hidden' name='typeName' value='${list.menu_type }'/>
			<div class="col-md-3">
			 <c:choose>
			 <c:when test='${param.page eq "game" }'>
				 <div class="item">
				   <!-- Item img -->
			        <div class="item-img"> <img class="img-1" src="./admin/menu/menuImg/${list.menu_image }" alt="" ></div>
			        <!-- Item Name -->
			        <div class="item-name"><a>${list.menu_name }</a></div>
			        <!-- Price --> 
			        <span class="price">${list.menu_price }</span>
			        <c:if test='${param.page eq "game" }'>
			       		<input type='button' name='btnToGame' value='to게임'
			       		onclick="toGame('${list.menu_no}')"
			       		/>
			        </c:if>
				</div>
			 </c:when>
			 <c:otherwise>
				<div class="item" onclick='appendMenu("${list.menu_no}", "${list.menu_name }", "${list.menu_price }")'> 
			 	  <!-- Item img -->
			        <div class="item-img"> <img class="img-1" src="./admin/menu/menuImg/${list.menu_image }" alt="" ></div>
			        <!-- Item Name -->
			        <div class="item-name"><a>${list.menu_name }</a></div>
			        <!-- Price --> 
			        <span class="price">${list.menu_price }</span>
			        <c:if test='${param.page eq "game" }'>
			       		<input type='button' value='to게임'/>
			        </c:if>
			      </div>  
			 </c:otherwise>
			 </c:choose>
			</div>
		</c:forEach>
	</form>
	
</div>

<script>
var tableZone; // right_order.jsp에서 tableZone은 tbody영역
var tableModal;
var m_no, m_name, m_price;
var cnt = 0;
var bb = true;
var index;

function appendMenu(no, name, price){
	m_no = no;
	m_name = name;
	m_price = price;
	bb = true;
	index = -1;
	tableZone = $('#tableZone')[0];
	tableModal = $('#tableModal')[0];
	
	var size = document.getElementsByClassName("tdName").length;
	
	for (var i= 0 ; i < size  ; i++){
		if (document.getElementsByClassName("tdName")[i].innerHTML === name){
			bb = false;
			index = i;
			break;
		} 
	}
	 
	if (bb){
			addMenu(tableZone, m_no, m_name, m_price);
	} else {
			document.getElementsByClassName("spanCnt")[index].innerHTML
			 = Number(document.getElementsByClassName("spanCnt")[index].innerHTML) +1;
			document.getElementsByName("os_price")[index].value
			= (document.getElementsByName("os_price")[index].value) *
			  (document.getElementsByClassName("spanCnt")[index].innerHTML);
			alert(document.getElementsByName("os_price")[index].value);
			
	}
}

 // table태그의 구조를 이용하여 주문서에 append하기
function addMenu(tableZone, no, name, price){
	var inputNo = document.createElement("input");
	inputNo.setAttribute("type", "hidden")
	inputNo.setAttribute("name", "menu_no");
	inputNo.setAttribute("value", no);
	
	
	var inputQty = document.createElement("input");
	inputQty.setAttribute("type", "hidden")
	inputQty.setAttribute("name", "os_qty");
	inputQty.setAttribute("value", "1");
	inputQty.setAttribute("style", "color:black");
	
	var inputPrice = document.createElement("input");
	inputPrice.setAttribute("type", "hidden")
	inputPrice.setAttribute("name", "os_price");
	inputPrice.setAttribute("value", price);
	inputPrice.setAttribute("style", "color:black");
	 
	var tr = document.createElement("tr");
	tr.appendChild(inputNo);
	tr.appendChild(inputQty);
	tr.appendChild(inputPrice);
	
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
	
	btnPlus.onclick =  function(ev){
		var tag = ev.srcElement;
		var qty = tag.previousSibling;
		qty.innerHTML = Number(qty.innerHTML) + 1;
		inputQty.value = qty.innerHTML;
		inputPrice.value = price * qty.innerHTML;
	 };
	
	btnMinus.onclick = function(ev){
 		var tag = ev.srcElement;
		var qty = tag.nextSibling;
		if (qty.innerHTML != 1){
			qty.innerHTML = Number(qty.innerHTML) - 1;
			inputQty.value = qty.innerHTML;
			inputPrice.value = price * qty.innerHTML;
		}else{
			tableZone.removeChild(tr);
		}
	}
	
	
	var tdPrice = document.createElement("td");
	tdPrice.innerHTML = price;
	tr.appendChild(tdPrice);
	
	var spanPrice = document.createElement("spanPrice");
	spanPrice.setAttribute("class", "spanPrice");
	tdPrice.appendChild(spanPrice);
	
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

 function append_data_modal(){
	if ($('#tableZone')[0].innerHTML != null){
		tableModal.innerHTML = $('#tableZone')[0].innerHTML; 
	} else {
		tableModal.innerHTML = "메뉴를 선택해주세요";
	}
	
 }

 
//'게임준비완료' 페이지로 이동 함수
function toGame(menu_no) {
	var f = document.menu_frm;
	
	f.menu_no.value = menu_no;
	f.method = 'POST';
	f.action = 'tvt_ready.game';
	f.submit();
} 



</script>
</body>
</html>