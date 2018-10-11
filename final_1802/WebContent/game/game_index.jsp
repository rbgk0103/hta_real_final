<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div id='gi_wrap'>
	<h3>게임 인덱스페이지</h3>
	<div id='game_widths'>
	
		<form id='frm_widths' name='frm_widths'>	
			<div class='game_with' id='game_tvt'>
			
				<div class='game_with_img_area'>
					<img class="game_with_img" id="game_tvt_img" src="img/game_img/game_tvt.png">
				</div>
				<div class='game_with_button_area'>
					<input type='button' class='btnGame' id='btnTvT' name='btnTvT' value='테이븚vs테이블'
						onclick="go_gtl('TVT')" />
				</div>
				
			</div>	
			<div class='game_with' id='game_int'>
				<div class='game_with_img_area'>
				<img class="game_with_img" id="game_int_img" src="img/game_img/game_int.png">
				</div>
				<div class='game_with_button_area'>
					<input type='button' class='btnGame' id='btnInT' name='btnInT' value='테이블 내(內전)'/>
				</div>
			</div>	
	
			<div class='game_with' id='game_single'>
				<div class='game_with_img_area'>
				<img class="game_with_img" src="img/game_img/game_single.png">
				</div>
				<div class='game_with_button_area'>
					<input type='button' class='btnGame' id='btnSingle' name='btnSingle' value='싱글플레이(랭킹)'/>
				</div>
			</div>	
			
			<div>
				<h3>param값: </h3>
				<label>page: </label>
				<input class='input_text' type='text' name='page' value='game' /><br/>
				<label>gt_with: </label>
				<input class='input_text' type='text' name='gt_with' /><br/>
				<label>gt_no: </label>
				<input class='input_text' type='text' name='gt_no'  /><br/>
				<label>tbl_i:</label>
				<input class='input_text' type='text' name='tbl_i'  /><br/>
				<label>tbl_u:</label>
				<input class='input_text' type='text' name='tbl_u'  />
			</div>
		</form>
	</div>
</div>    
 
<script>


// 게임타이틀 리스트페이지로 이동함수
function go_gtl(gt_with) {
	var f = document.frm_widths;
	
	f.page.value = 'game';
	f.gt_with.value = gt_with;
	
	f.method = 'POST';
	f.action = 'game_title_list.game';
	f.submit();
} 
</script>



