<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id='tvt_ready_wrap'>
	<h3>tvt_ready</h3>
	
	<div id='tvt_ready_view'>
		<div id='tvt_info1'>
			<ul>
				<li>내 테이블번호: ${param.tbl_i}</li>
				<li>상대 테이블번호: ${param.tbl_u}</li>
				<li>게임타이틀명 : ${param.gt_no}</li>
				<li>음식메뉴명: ${param.menu_no}	</li>
			</ul>
		</div>
		<div id='tvt_info2'>
		</div>
		<div id='tvt_buttons'>
		</div>
	</div>
</div>


