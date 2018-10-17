<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div id='tbl_list_wrap'>
	<h3>테이블 목록 - 맞짱뜰 상대 테이블을 고르세요 ${tblVo.tbl_no }</h3>

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
						<c:choose>
						
							<c:when test="${i.tbl_no eq tblVo.tbl_no}">
								<span>여기는 나의 테이블</span>
								<input type='button' name='btn_tbl_choose' id='btn_tbl_choose'
						 		value='대적할 테이블로 선택'	onclick="go_main_ord('${i.tbl_no}')" />
						 	</c:when>
						 	<c:otherwise>
								<input type='button' name='btn_tbl_choose' id='btn_tbl_choose'
						 		value='대적할 테이블로 선택'	onclick="go_main_ord('${i.tbl_no}')" />
						 	</c:otherwise>
						 </c:choose>
						 
					</div>
				</div>
			</c:forEach>

			<!-- 값 확인용 -->
			<div>
				<h3>param값: </h3>
				<label>page: </label>
				<input class='input_text' type='text' name='page' value='${param.page}' /><br/>
				<label>gt_with: </label>
				<input class='input_text' type='text' name='gt_with' value='${param.gt_with}'  /><br/>
				<label>gt_no: </label>
				<input class='input_text' type='text' name='gt_no' value='${param.gt_no}' /><br/>
				<label>tbl_i:</label>
				<input class='input_text' type='text' name='tbl_i' value='1' /><br/>
				<label>tbl_u:</label>
				<input class='input_text' type='text' name='tbl_u' />
				 
			</div>
		</div>
	</form>
</div>

<script>
// '음식메뉴선택' 페이지로 이동 함수
function go_main_ord(tbl_no) {
	var f = document.frm_tbl_list;
	
	f.tbl_u.value = tbl_no;		// 대적할 상대의 테이블번호
	
	f.method = 'POST';
	f.action = 'center.ord';
	f.submit();
} 
</script>



