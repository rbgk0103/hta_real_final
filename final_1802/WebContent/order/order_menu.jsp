<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id='all'>
	<div id='t_menu'>
<%-- 		<%@include file="tap_menu.jsp" %> --%>
				
		<div id='menu_type'>
			<form name='tap_frm' id='tap_frm' method='post'>
				<input type='hidden' name='findStr' id='menuType'/>
			</form>
			<span id='snack'  class='tap_menu' onclick='goMenu("snack")'>안주류</span>
			<span id='liquor' class='tap_menu' onclick='goMenu("drink")'>주류</span>
		</div>
	</div>
	<div id='l_menu'>
<%-- 		<%@include file="left_menu.jsp" %> --%>
		<div id='menu'>
			<form id='leftMenu' method='post'>
				<input type='hidden' name='findStr' id='findStr'/>
			</form>
			<ul>
				<li onclick='leftMenu("best")'> Best메뉴</li>
				<li onclick='leftMenu("fury")'> 치즈&후라이</li>
				<li onclick='leftMenu("grill")'>볶음&그릴</li>
				<li onclick='leftMenu("salad")'>샐러드&떡볶이</li>
				<li onclick='leftMenu("stew")'> 탕&전골</li>
				<li onclick='leftMenu("drink")'>주류</li>
			</ul>
		</div>
		
	</div>
	<div id='c_menu'>
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
<%-- 		<%@include file="center_menu.jsp" %> --%>
	</div>
	<div id='r_menu'>
<%-- 		<%@include file="right_order.jsp" %> --%>
		<div id='right_order'>
			<span id='order_list'>주문서</span>
			<div id='order_status'>
				<form name='right_frm' id='right_frm' method='post'>
					<input type='hidden' name='ord_tbl_no' value='${tblVo.tbl_no}'/>
					<input type='hidden' name='guest_no'   value='${tblVo.guest_no}'/>
				<table  class='table'>
					<tbody id='tableZone'>
						<tr><th>메뉴</th><th>수량</th><th style="">가격</th><th style="width: 10px"></th></tr>
					</tbody>
				</table>
				</form>	
			</div>
			<div id='all_order'>
				<span id='previous'>총 주문 내역</span>
			</div>
		<!-- 	<div id='now_order'> -->
		<!-- 		<span id='now'>주문 금액</span> -->
		<!-- 		<span id='now_price'>7,900원</span>	 -->
		<!-- 	</div> -->
			<div id='to_order' onclick='append_data_modal()' data-toggle="modal" data-target="#myModal" >주문하기</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel" style='color:black'>주문 내용을 확인해주세요.</h4>
		      </div>
		      <div class="modal-body">
		  	 	<table class="table" id='tableModal' style='color:black'></table>
		      </div>
		      <div class="modal-footer">
		        <button type="button"  class="btn btn-primary" data-dismiss="modal" onclick='orderMenu()'>주문하기</button>
		        <button type="button"  class="btn btn-default" data-dismiss="modal">취소하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade hey123">
			<div class="modal-dialog">
				<div class="modal-content">
				</div>
		  	</div>
		</div>
	</div>
</div>

<script>
var tableZone; // right_order.jsp에서 tableZone은 tbody영역
var tableModal;
var m_no, m_name, m_price;
var cnt = 0;
var bb = true;
var index;

$(document).ready(function(){
    if (document.menu_frm.page.value == 'game'){
       console.log(document.menu_frm.page.value);
       $('#t_menu, #l_menu, #r_menu').css('display', 'none');
       $('#c_menu').css('width', '100%');
       
    }
 
});

function goMenu(id){
	$('#menuType').val(id);
	var param = $('#tap_frm').serialize();
	$('#c_menu').load('center.ord', param);
	console.log(param);
}


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
			= (price) *
			  Number(document.getElementsByClassName("spanCnt")[index].innerHTML);
			document.getElementsByName("os_qty")[index].value
			= document.getElementsByClassName("spanCnt")[index].innerHTML
			
			alert(document.getElementsByName("os_qty")[index].value + "개와     " + document.getElementsByName("os_price")[index].value);
			
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



function leftMenu(menu_type){
	$('#leftMenu #findStr').val(menu_type);
	var param = $('#leftMenu').serialize();
	$('#content').load('center.ord', param);
}



function orderMenu(){
	var param = $('#right_frm').serialize();
	if (param === ""){
		alert("메뉴를 선택해주세요.");
	} else{
		$('#content').load('orderMenu.ord', param);
	}
}


$('#all_order').click(function(){
// 	var param = $('#right_frm').serialize();
// 	$('#listZone').load('viewList.ord', param);
    $('div.hey123').modal({remote : 'viewList.ord?tbl_no='+${tblVo.tbl_no}+'&g_no='+${tblVo.guest_no}, backdrop: 'static'});
 
})




</script>
