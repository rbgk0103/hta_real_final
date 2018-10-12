<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    


<div id='tvt_ready_wrap'>
	<h3>tvt_ready</h3>
	
	<div id='tvt_ready_view'>
		<div id='tvt_info_tbl'>
			<ul>
				<li>내 테이블번호: ${tbl_i}</li>
				<li>상대 테이블번호: ${tbl_u}</li>
			</ul>
		</div>
		<div id='tvt_info_gt_and_menu'>
			<div id='tvt_info_gt'>
				<ul>
					<li>게임타이틀명: ${gtVo.gtName}</li>
				</ul>
				<img src='img/game_img/${gtVo.gtImage}' />
			</div>
			<div id='tvt_info_menu'>
				<ul>
					<li>메뉴명: ${menuVo.menu_name}</li>
				</ul>
				<img src='admin/menu/menuImg/${menuVo.menu_image}' />
			
			</div>
		</div>
		<div id='tvt_info_notice'>
		</div>
		<div id='tvt_buttons'>
			<input type='button' name='btn_apply' value='대전신청' />
			<input type='button' name='btn_cancel' value='취소' />
		</div>
	</div>
</div>


