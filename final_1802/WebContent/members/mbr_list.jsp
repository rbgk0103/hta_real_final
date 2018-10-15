<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- bootstrap 3.0.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- google font -->
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="./css/admin_css.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./lib/bootstrap.min.js" type="text/javascript"></script>
<!-- Director App -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<style>
li {list-style: none;}
.findZone #frm_mbr_list {text-align: right;}
.list-group-item-info, .list-group-item-success {margin: 0;}
.mbr_list_head {font-size: larger;}
.mbr_list_item {min-height: 400px;}
.mbr_list_item > ul > li {text-overflow: ellipsis; white-space: nowrap;}
.btnZone {text-align: center;}
</style>
<div id="section_mbr_list" class="col-sm-10">
	<h3>Members List</h3>
	<br/>
	<div class="col-sm-6"></div>
	<div class="form-group col-sm-6 findZone">
		<form name="frm_mbr_list" id="frm_mbr_list" method="post">
			<div class="col-sm-9">
				<input type="text" name="mbr_findStr" id="mbr_findStr" class="form-control" value="${empty param.findStr ? '' : param.findStr }" autocomplete="off"/>
			</div>
			<div>
				<input type="button" name="btn_mbr_find" id="btn_mbr_find" class="btn btn-success" value="Search"/>
			</div>
				
			<br/>
			<input type="hidden" name="nowPage" id="nowPage" value="${empty param.nowPage ? 1 : param.nowPage }"/>
			<input type="hidden" name="mbrNo" id="mbrNo"/>
		</form>
	</div>
	
	<br/><br/><br/>
	
	<div class="col-sm-12">
		<div class="list-group mbr_list_head">
			<ul class="col-sm-4 list-group-item-info">
				<li class="col-sm-4">No.</li>
				<li class="col-sm-4 ">ID</li>
				<li class="col-sm-4 ">NAME</li>
			</ul>
			<ul class="col-sm-4 list-group-item-info">
				<li class="col-sm-4 ">Gender</li>
				<li class="col-sm-4 ">Birth</li>
				<li class="col-sm-4 ">Point</li>
			</ul>
			<ul class="col-sm-4 list-group-item-info">
				<li class="col-sm-4 ">Sign</li>
				<li class="col-sm-4 ">rDate</li>
				<li class="col-sm-4 ">Status</li>
			</ul>
		</div>
		
		<br/><br/>
		
		<div class="list-group mbr_list_item">
		
			<c:forEach var="vo" items="${list }">
				<ul class="col-sm-4 list-group-item-success">
					<li class="col-sm-4">${vo.mbrNo }</li>
					<li class="col-sm-4">${empty vo.mbrId ? '' : vo.mbrId }</li>
					<li class="col-sm-4">${empty vo.mbrName ? '' : vo.mbrName }</li>
				</ul>
				<ul class="col-sm-4 list-group-item-success">
					<li class="col-sm-4">${empty vo.mbrGender ? '' : vo.mbrGender }</li>
					<li class="col-sm-4">${empty vo.mbrBirth ? '' : vo.mbrBirth }</li>
					<li class="col-sm-4">${empty vo.mbrPoint ? '' : vo.mbrPoint }</li>
				</ul>
				<ul class="col-sm-4 list-group-item-success">
					<li class="col-sm-4">${empty vo.scFrom ? '' : vo.scFrom }</li>
					<li class="col-sm-4">${empty vo.mbrRegDate ? '' : vo.mbrRegDate }</li>
					<li class="col-sm-4">
						<button type="button" class="btn btn-xs btn-warning"
							 onclick="mbrModify('${vo.mbrNo}', '${vo.mbrId}', '${vo.mbrPwd}', '${vo.mbrName}', '${vo.mbrPhone}', '${vo.mbrBirth}', '${vo.mbrGender}', '${vo.mbrPoint }')">수정</button>
						<button type="button" class="btn btn-xs btn-danger" onclick="mbrDelete('${vo.mbrNo}')">삭제</button>
					</li>
				</ul>
				<br/><br/>
			</c:forEach>
		</div>
		
		<div class='btnZone'>
			<c:if test='${page.nowBlock > 1}'>
				<input type='button' value='&lt;&lt' onclick ='movePage(1)' id='btnFirst' class="btn btn-link btn-sm"/>
				<input type='button' value='&lt' 
								onclick = 'movePage(${page.startPage-1 })' id='btnPrev' class="btn btn-link btn-sm"/>
			</c:if>
			
			<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
				<c:choose>
					<c:when test='${p == page.nowPage}'>
		            	<input type='button' value='${p}' onclick='movePage(${p})' class='btn btn-success btn-sm'/>
					</c:when>
					<c:otherwise>
						<input type='button' value='${p}' onclick='movePage(${p})' class='btn btn-info btn-sm'/>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test = '${page.nowBlock < page.totBlock}'>
				<input type='button' value='&gt' 
								onclick = 'movePage(${page.endPage+1})' id='btnNext' class="btn btn-link btn-sm"/>
				<input type='button' value='&gt;&gt' 
								onclick = 'movePage(${page.totPage})' id='btnLast' class="btn btn-link btn-sm"/>
			</c:if>
		</div>
	</div>
</div>
<%@ include file = "./modal_call_members_modify.jsp" %>

<script>
$("#btn_mbr_find").click(function(){
	var param = $("#frm_mbr_list").serialize();
	$("#section_mbr_list").load("mbr_list.mbr", param);
});
function movePage(nowPage){
	$("#nowPage").val(nowPage);
	var param = $("#frm_mbr_list").serialize();
	console.log(param);
	$("#section_mbr_list").load("mbr_list.mbr", param);
}
function mbrModify(mbrNo, mbrId, mbrPwd, mbrName, mbrPhone, mbrBirth, mbrGender, mbrPoint){
	$(".modal-body #mbr_mno").val(mbrNo);
	$(".modal-body #mbr_mid").val(mbrId);
	$(".modal-body #mbr_mpwd").val(mbrPwd);
	$(".modal-body #mbr_mname").val(mbrName);
	$(".modal-body #mbr_mphone").val(mbrPhone);
	$(".modal-body #mbr_mbirth").val(mbrBirth);
	$("input:radio[name='mbr_gender']:radio[value='male']").prop("checked",true);
	$(".modal-body #mbr_mpoint").val(mbrPoint);
	
	$("#modal_call_members_modify").modal("show");
}
function mbrDelete(mbrNo){
	$("#mbrNo").val(mbrNo);
	var param = $("#frm_mbr_list").serialize();
	$("#section_mbr_list").load("mbr_delete.mbr", param);
}
</script>