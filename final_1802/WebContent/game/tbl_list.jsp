<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div id='tbl_list_wrap'>
	<h3>테이블 목록 - 대전신청할 테이블을 선택하세요.</h3>

	<form id='frm_tbl_list' name='frm_tbl_list'>
		<div id='tbl_list_area'>

			<!-- 테이블 목록 -->
			<c:forEach var='i' items='${tblList }'>			
				<div class='tbl_item'>
					<div class='tbl_info' >
						<h3 class='tbl_no2'>${i.tbl_no}번 테이블 </h3>
						
					</div>
					<div class='tbl_btn_area' >
						<c:choose>
						
							<c:when test="${i.tbl_no eq tblVo.tbl_no}">
								<span>본인 테이블입니다</span>
								<input type='button' name='btn_tbl_choose' id='btn_tbl_choose'
						 		value='대적할 테이블로 선택'	onclick="go_main_ord('${i.tbl_no}')" style='visibility:hidden;width:0' />
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
				<input class='input_text' type='hidden' name='page' value='${param.page}' /><br/>
				<input class='input_text' type='hidden' name='gt_with' value='${param.gt_with}'  /><br/>
				<input class='input_text' type='hidden' name='gt_no' value='${param.gt_no}' /><br/>
				<input class='input_text' type='hidden' name='tbl_i' value='1' /><br/>
				<input class='input_text' type='hidden' name='tbl_u' />
				 
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
	f.action = 'index.jsp?content=main.ord';
	f.submit();
} 
</script>



