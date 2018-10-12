<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	a{
	list-style: none;
	}
	li{
	list-style: none;
	}
</style>
<div class="col-sm-10">
	<h3>Members List</h3>
	<br/>
	<div class="col-sm-8"></div>
	<div class="form-group col-sm-4 findZone">
		<form name="frm" id="frm_list" method="post">
			<div class="col-sm-9">
				<input type="text" name="findStr" id="findStr" class="form-control" value="${empty param.findStr ? '' : param.findStr }" autocomplete="off"/>
			</div>
			<div class="col-sm-3">
				<button type="button" name="btnFind" id="btnFind" class="btn btn-success">Search</button>
			</div>
				
			<br/>
			<input type="hidden" name="nowPage" id="nowPage" value="${empty param.nowPage ? 1 : param.nowPage }"/>
			<input type="hidden" name="serial" id="serial"/>
		</form>
	</div>
	
	<br/><hr/><br/>
	
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
		
		<hr>
		
		<div class="list-group mbr_list_item">
		
			<c:forEach var="vo" items="${list }">
				<ul class="col-sm-6 list-group-item-success" onclick="toView('${vo.mbrNo}')">
					<li class="col-sm-3">${vo.mbrNo }</li>
					<li class="col-sm-3">${empty vo.mbrId ? '' : vo.mbrId }</li>
					<li class="col-sm-3">${empty vo.mbrGender ? '' : vo.mbrGender }</li>
					<li class="col-sm-3">${empty vo.mbrBirth ? '' : vo.mbrBirth }</li>
				</ul>
				<ul class="col-sm-6 list-group-item-success" onclick="toView('${vo.mbrNo}')">
					<li class="col-sm-3">${empty vo.mbrPoint ? '' : vo.mbrPoint }</li>
					<li class="col-sm-3">${empty vo.scFrom ? '' : vo.scFrom }</li>
					<li class="col-sm-3">${empty vo.mbrRegDate ? '' : vo.mbrRegDate }</li>
					<li class="col-sm-3">
						<button type="button" class="btn btn-xs btn-warning">수정</button>
						<button type="button" class="btn btn-xs btn-danger">삭제</button>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>

	<div class='btnZone'>
		<c:if test='${page.nowBlock > 1}'>
			<button type='button' id='btnFirst' class="btn btn-default" value='&lt;&lt' onclick ='movePage(1)'></button>
			<button type='button' id='btnPrev' class="btn btn-default" value='&lt' 
							onclick = 'movePage(${page.startPage-1 })'></button>
		</c:if>
		
		<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
			<c:choose>
				<c:when test='${p == page.nowPage}'>
	            	<button type='button' class="btn btn-default" onclick='movePage(${p})'>${p }</button>
				</c:when>
				<c:otherwise>
					<button type='button' class="btn btn-default" value='${p}' onclick='movePage(${p})'></button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test = '${page.nowBlock < page.totBlock}'>
			<button type='button' id='btnNext' class="btn btn-default" value='&gt' 
							onclick = 'movePage(${page.endPage+1})'></button>
			<button type='button' id='btnLast' class="btn btn-default" value='&gt;&gt' 
							onclick = 'movePage(${page.totPage})'></button>
		</c:if>
	</div>
	
</div>