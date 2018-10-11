<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="form-horizontal">
	<div class="form-group">
	    <div class="col-sm-2"></div>
	    <div class="col-sm-8">
	    
	    			
		<c:choose>
			<c:when test="${msg eq 'login' }">
				<script>window.location.reload()</script>
			</c:when>
			<c:when test="${msg eq 'logout' }">
				<script>location.href="./index.jsp";</script>
			</c:when>
			<c:when test="${msg eq 'id_over' }">
				<p class="form-control-static">이미 존재하는 아이디 입니다.</p>
			</c:when>
			<c:when test="${msg eq 'id_possible' }">
				<p class="form-control-static">사용 가능한 아이디 입니다.</p>
				<input type="hidden" id="return_id_chk" value="${id_chk }"/>
			</c:when>
			<c:when test="${msg eq 'reg_success' }">
				<p class="form-control-static"> 회원 가입 성공</p>
				<script>
					setInterval(function() {
						$("#modal_call_members_register").modal("hide");
						$("#modal_call_members_login").modal("show");
					}, 1500)
				</script>
			</c:when>
			<c:when test="${msg eq 'reg_false' }">
				<p class="form-control-static">회원 가입 실패</p>
			</c:when>
			<c:when test="${msg != null }">
	    
				<p class="form-control-static">${msg}</p>
			
			</c:when>
			<c:when test="${msg == null }">
			
				<p class="form-control-static">아이디 : ${mvo.mbrId}</p>
				<p class="form-control-static">비밀번호 : ${mvo.mbrPwd}</p>
			
			</c:when>
		</c:choose>
			
    	</div>
	    <div class="col-sm-2"></div>
	</div>
</div>