<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#set_gender{margin-bottom:15px;}

</style>
    <!-- Modal -->
<div class="modal fade" id="table_set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">TABLE NO.9</h4>
			</div>
			<div class="modal-body">
				<div id = 'set_gender' >
					<label>성별</label>
					<select class="form-control">
						<option>남자</option>
						<option>여자</option>
						<option>혼성</option>
					</select>
				</div>
				<div id = 'set_count'>
					<label>인원수</label>
					<input type ='text' class="form-control">
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Setting</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
