<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<h3>Members List</h3>
<br/>
<div class="form-group findZone">
	<form name="frm" id="frm_list" method="post">
		<div class="col-sm-3">
			<input type="text" name="findStr" id="findStr" class="form-control" value="${empty param.findStr ? '' : param.findStr }" autocomplete="off"/>
		</div>
		<div class="col-sm-1">
			<button type="button" name="btnFind" id="btnFind" class="btn btn-success">Search</button>
		</div>
			
		<br/>
		<input type="text" name="nowPage" id="nowPage" value="${empty param.nowPage ? 1 : param.nowPage }"/>
		<input type="text" name="serial" id="serial"/>
	</form>
</div>

<br/>

<div class="col-sm-12">
	<div class="list-group mbr_list_head">
		<ul class="col-sm-6 list-group-item-info">
			<li class="col-sm-3">No.</li>
			<li class="col-sm-3 ">ID</li>
			<li class="col-sm-3 ">Gender</li>
			<li class="col-sm-3 ">Birth</li>
		</ul>
		<ul class="col-sm-6 list-group-item-info">
			<li class="col-sm-3 ">Point</li>
			<li class="col-sm-3 ">Sign</li>
			<li class="col-sm-3 ">rDate</li>
			<li class="col-sm-3 ">Status</li>
		</ul>
	</div>
	
	<div class="list-group mbr_list_item">
	
		<c:forEach var="vo" items="${list }">
			<ul class="col-sm-6 list-group-item" onclick="toView('${vo.mbrNo}')">
				<li class="col-sm-3">${vo.mbrNo }</li>
				<li class="col-sm-3">${empty vo.mbrId ? '' : vo.mbrId }</li>
				<li class="col-sm-3">${empty vo.mbrGender ? '' : vo.mbrGender }</li>
				<li class="col-sm-3">${empty vo.mbrBirth ? '' : vo.mbrBirth }</li>
			</ul>
			<ul class="col-sm-6 list-group-item" onclick="toView('${vo.mbrNo}')">
				<li class="col-sm-3">${empty vo.mbrPoint ? '' : vo.mbrPoint }</li>
				<li class="col-sm-3">${empty vo.scFrom ? '' : vo.scFrom }</li>
				<li class="col-sm-3">${empty vo.mbrRegDate ? '' : vo.mbrRegDate }</li>
				<li class="col-sm-3"></li>
			</ul>
		</c:forEach>
	</div>
</div>

