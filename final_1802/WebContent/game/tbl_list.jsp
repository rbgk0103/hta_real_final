<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div id='tbl_list_wrap'>
	<h3>테이블 목록 - 맞짱뜰 상대 테이블을 고르세요</h3>

	<form id='frm_tbl_list' name='frm_tbl_list'>
		<div id='tbl_list_area'>

			<!-- 테이블 목록 -->
			<c:forEach var='i' items='${tblList }'>			
				<div class='tbl_item'>
					<div id='tbl_info'>
						<span class='tbl_no1'>테이블번호: </span>
						<span class='tbl_no2'>${i.tbl_no} </span><br/>
						
						<span class='tbl_ip1'>테이블IP: </span>
						<span class='tbl_ip2'>${i.tbl_ip }</span><br/>
						
						<span class='tbl_status1'>테이블상태: </span>
						<span class='tbl_status2'>${i.tbl_status }</span><br/>
						
					</div>
					<div id='tbl_btn_area'>
						<input type='button' name='btn_tbl_choose' id='btn_tbl_choose'
						 		value='대적할 테이블로 선택'	onclick="go_tbl_list()"/>
					</div>
				</div>
			</c:forEach>

			<!-- 값 확인용 -->
			<div>
				<label>page변수의 값: </label> <input type='text' name='page' id='page'
					value='game' /><br /> <label>game_with의 값: </label> <input
					type='text' name='game_with' id='game_with'
					value='${param.game_with}' /> <label>gt_no의 값: </label> <input
					type='text' name='gt_no' id='gt_no' />
			</div>
		</div>
	</form>
</div>

<script>
// '음식메뉴선택' 페이지로 이동 함수
function go_tbl_list(gt_no) {
	var f = document.frm_gtl_list;
	
	f.gt_no.value = gt_no;
	f.method = 'POST';
	f.action = 'tbl_list.game';
	f.submit();
} 
</script>



