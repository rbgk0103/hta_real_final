<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id='gtl_wrap'>
	<h3>플레이할 게임을 고르세요</h3>
	
	<div id='gtl_list_area'>
		<form id='frm_gtl_list' name='frm_gtl_list'>	

			<!-- 게임 항목 -->
			<c:forEach var='i' items='${gtList}'>
				<div class='gt_item'>

					<div class='gt_img_area'>
						<img src="img/game_img/${i.gtImage}" />
					</div>
					

					<div class='gt_btn_area'>
						<input type='button' name='btn_gt_pick' id='btn_gt_pick' value='${i.gtName}'
								onclick="go_tbl_list('${i.gtNo}')" />
					</div>
				</div>
			</c:forEach>
			
			<!-- 값 확인용 -->
			<div>
				<input class='input_text' type='hidden' name='page' value='${param.page}' /><br/>
				<input class='input_text' type='hidden' name='gt_with' value='${param.gt_with}'  /><br/>
				<input class='input_text' type='hidden' name='gt_no'  /><br/>
				<input class='input_text' type='hidden' name='tbl_i'  /><br/>
				<input class='input_text' type='hidden' name='tbl_u'  />
			</div>
		</form>
	</div>
</div>    
 
<script>
// '대전상대 테이블 선택' 페이지로 이동 함수
function go_tbl_list(gt_no) {
	var f = document.frm_gtl_list;
	
	f.gt_no.value = gt_no;
	
	f.method = 'POST';
	f.action = 'tbl_list.game';
	f.submit();
} 
</script>



