<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id='tbl_list_wrap'>
	<h3>테이블 목록 - 맞짱뜰 상대 테이블을 고르세요</h3>
	
	<div id='tbl_list_area'>
		<form id='frm_gtl_list' name='frm_gtl_list'>	

			<!-- 게임 항목 -->
			<c:forEach var='i' items='${gtList}'>
				<div class='gt_item'>
					<div class='gt_explain'>
					
						<span class='gt_no1'>gt번호: </span>
						<span class='gt_no2'>${i.gtNo}</span><br/>
						
						<span class='gt_name1'>게임명: </span>
						<span class='gt_name2'>${i.gtName}</span><br/>
						
						<span class='gt_with1'>게임분류: </span>
						<span class='gt_with2'>${i.gtWith }</span>
						
					</div>
					<div class='gt_img_area'>
						<img src="img/game_img/${i.gtImage}" />
					</div>
					<div class='gt_btn_area'>
						<input type='button' name='btn_gt_pick' id='btn_gt_pick' value='게임 선택'
								onclick="go_tbl_list('${i.gtNo}')">
					</div>
				</div>
			</c:forEach>
			
			<!-- 값 확인용 -->
			<div>
				<label>page변수의 값: </label>
				<input type='text' name='page' id='page' value='game' /><br/>
				<label>game_with의 값: </label>
				<input type='text' name='game_with' id='game_with' value='${param.game_with}' />
				<label>gt_no의 값: </label>
				<input type='text' name='gt_no' id='gt_no' />
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



