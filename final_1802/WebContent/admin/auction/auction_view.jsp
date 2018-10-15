<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel='stylesheet' type='text/css' href='./css/auction.css'   />
<style>
#frm_auction #button .button{
	
}
</style>
<script>
$().ready(function(){
	$("#btnClose").click(function(){
		$(".skin-black").load("./auction_list.auc");
	})

	/* ajax 는 이미지가 있을경우 */
	
	$("#btnDelete").click(function(){
		var param = $('#frm_auction').serialize();
		var url   = './auction_delete.auc';
		$('.skin-black').load(url,param);
	})
	
	$("#btnModify").click(function(){
		var param = $("#frm_auction").serialize();
		var url   = './auction_modify.auc';
		$('.skin-black').load(url,param);
	})
	
})
</script>
<div class="modal-dialog">
	<div class="modal-content">
		<form id = 'frm_auction' name = 'frm_auction' method = 'post'>
				<div id='header'>
					<h1>
						<label class='auction_header'>A U C T I O N</label>
					</h1>
				</div>	
			<div id='win_ment'>
			<!-- INT 값은 value 에 '' 나 "" 를 붙이지 않는다. -->
				<input type = 'hidden' id = 'ae_no' name = 'ae_no' value = ${vo.ae_no }>
				<label>경매번호  : <span class='ment' >${vo.ae_no}</span></label><br /> 
				<label>시작가  :  <input type = 'text' class='ment' name = 'price'   id = 'price'   value = ${vo.ae_price }></label><br/>
				<label>최대값  :  <input type = 'text' class='ment' name = 'pct_max' id = 'pct_max' value = ${vo.ae_pct_max }></label><br/>
				<label>최소값  :  <input type = 'text' class='ment' name = 'pct_min' id = 'pct_min' value = ${vo.ae_pct_min }></label><br/>
			</div>
			<div id = 'btn'>
				<input type='button' name='btnDelete' id = 'btnDelete' class = 'btn' value='D E L E T E' />
				<input type='button' name='btnClose'  id = 'btnClose'  class = 'btn' value='C L O S E' />
				<input type='button' name='btnModify' id = 'btnModify' class = 'btn' value='M O D I F Y' />	
			</div>
		</form>
	</div>
</div>
