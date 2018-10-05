<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id='chatFooter' class='col-md-12 col-xs-12'>
<form id="msgForm" class='form-horizontal col-md-12 col-xs-12'>
	<div class="form-group">
		<textarea id="msg" rows="4" class='form-control col-md-9 col-xs-9'></textarea>
		<input type='button'
			class="btn col-md-offset-1 col-md-2 col-xs-offset-1 col-xs-2"
			id='btnChatSend' value="전송" />
	</div>
</form>
</div>
<script>
	$('#btnChatSend').click(function() {
		sendMessage();
	})
	$('#msg').keyup(function(e) {
		if(e.keyCode === 13) {
			sendMessage();
		}
	});
	function sendMessage() {
		var message = $('#msg').val();
		if($.trim($('#msg').val()) !== "") {
			$('#chatContent').load("content", message);
		}
	}
</script>