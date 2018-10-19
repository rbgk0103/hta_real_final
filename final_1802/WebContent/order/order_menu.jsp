<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id='all'>
	<div id='t_menu'>
		<%@include file="tap_menu.jsp" %>
	</div>
	<div id='l_menu'>
		<%@include file="left_menu.jsp" %>
	</div>
	<div id='c_menu'>
		<%@include file="center_menu.jsp" %>
	</div>
	<div id='r_menu'>
		<%@include file="right_order.jsp" %>
	</div>
</div>

<script>
$(document).ready(function(){
    if (document.menu_frm.page.value == 'game'){
       console.log(document.menu_frm.page.value);
       $('#t_menu, #l_menu, #r_menu').css('display', 'none');
       $('#c_menu').css('width', '100%');
    }
});
</script>
