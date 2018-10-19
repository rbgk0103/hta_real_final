<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id='chatFooter' class='col-md-12 col-xs-12'>
	<form id="msgForm" class='form-horizontal col-md-12 col-xs-12'>
		<div class="form-group" id='chatFooterForm'>
			<textarea id="msg" rows="4" class='form-control col-md-9 col-xs-9'></textarea>
			<c:choose>
				<c:when test="${ip eq '192.168.0.26' }">
					<input type="button" class="btn col-md-offset-1 col-md-2 col-xs-offset-1 col-xs-2"
						id='btnNoticeSend' value="공지" />
					<input type='button'
						class="btn col-md-offset-1 col-md-2 col-xs-offset-1 col-xs-2 btnChatSend"
						id='btnChatSend' value="전송" />
				</c:when>
				<c:otherwise>
					<input type='button'
						class="btn col-md-offset-1 col-md-2 col-xs-offset-1 col-xs-2 btnNoNoticeChatSend"
						id='btnChatSend' value="전송" />
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>