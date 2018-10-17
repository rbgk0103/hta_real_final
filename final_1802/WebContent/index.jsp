<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='./lib/jquery-3.3.1.js'></script>
<link rel='stylesheet' type='text/css' href='./css/index.css'>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<meta name="description" content="Developed By M Abdur Rokib Promy">
<meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
<!-- bootstrap 3.0.2 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- font Awesome -->
<link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="./css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- google font -->
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="./css/admin_css.css" rel="stylesheet" type="text/css" />
<link href="./css/orders_css.css" rel="stylesheet" type="text/css" />
<link href="./css/game.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="./lib/bootstrap.min.js" type="text/javascript"></script>
<style>
#wrap {background-image : url(./img/background-img.jpg);height:900px;width:100%;color:#fff;}
#header{height:140px;position: relative;}
#header_logo{height:100%;}
#header_logo a >img{height:100%;cursor:pointer;}
#header_menu{line-height: 5;}
#header_menu a{font-size:30px;margin: 0px 4%;color: #fff;text-decoration:none;cursor:pointer;font-weight:bold;}
#header_menu a:hover{
text-shadow: 
	0 0 10px #fff,
	0 0 20px #fff,
	0 0 30px #fff, 
	0 0 40px #d1ad8f, 
	0 0 70px #d1ad8f,
	0 0 80px #d1ad8f, 
	0 0 100px #d1ad8f, 
	0 0 150px #d1ad8f;
}
#header_tableNo{line-height: 2.0; position: absolute; right: 8%;}
#header_tableNo a {font-weight: 900;font-size: 70px;color: #fff;text-decoration:none;margin-left: 30px;}

#modal_call_employee_header{background-color:#282832;color:#fff;}
#modal_call_employee_text{padding:20px 0;}
#modal_call_employee_check{font-size: 20px;padding-bottom:10px;}
#modal_call_employee_check > label:first-child{margin-left:0px;}
#modal_call_employee_check > label{font-weight:100;margin:0 10px;}
#modal_call_employee_footer{}
#modal_call_employee_footer_commit{background-color:#282832;}
#header_mbr{line-height: 2.9; position: absolute; right: 15%; top: 30%; outline: none;}
.glyphicon {color: #FF8000; font-size: 50px; cursor: pointer;}
.dropdown-menu li {cursor: pointer;}
.dropdown-menu li > a:hover {color: black;}
</style>
<title>중앙 포차</title>
</head>
<body>
<%
String content = "order/order_menu.jsp";
String ip = request.getRemoteAddr();
request.setAttribute("ip", ip);
System.out.println("index에서 ip 주소(remoteAddr) : " + ip);
if(request.getParameter("content") !=null){
	content = request.getParameter("content");  
}
%>


<form name='ipForm' method='post' target="chat">
	<input type='hidden' id="ip" value='${ip }' />
</form>
<div id = 'wrap'>
	<div id = 'header'>
		<div class='col-md-4'  id = 'header_logo'>
			<a href ="index.jsp">
				<img src ='./img/logo.png'>
			</a>
		</div>
		<div class='col-md-7' id = 'header_menu'>
			<a href="main.ord">메뉴</a>
			<a href ="index.game">게임</a>
			<a href ="#" onclick ="goChat('${ip}')">채팅</a>
			<a href ="#" data-toggle="modal" data-target="#modal_call_employee">직원호출</a>
		</div>
		
		<%@ include file = "./header_tableNo.jsp" %>
		<%@ include file = "./game/ws_tvt_client.jsp" %>
		

			
		<div id="header_mbr">
			
			<button class="btn btn-link dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				<div class="dropdown">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				</div>
			</button>
			
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			
				<c:choose>
					<c:when test="${session_mbr == null }">
						<li role="presentation">
							<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#modal_call_members_login">
								로그인
							</a>
						</li>
						<li role="presentation">
							<a role="menuitem" tabindex="-1" data-toggle="modal" data-target="#modal_call_members_register">
								회원가입
							</a>
						</li>
					</c:when>
					<c:when test="${session_mbr != null }">
						<li role="presentation">
							<a role="menuitem" tabindex="-1">
								${session_mbr.mbrName } 님 안녕하세요.
							</a>
						</li>
						<li role="presentation" class="divider"></li>
						
						<c:choose>
							<c:when test="${session_mbr.scNo == 0 }">
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="table_status.adm">
										관리자 페이지
									</a>
								</li>
							</c:when>
							<c:when test="${session_mbr.scNo == 4 }">
								<li role="presentation">
									<a role="menuitem" tabindex="-1">
										${session_mbr.mbrPoint } Point 사용 가능
									</a>
								</li>							
								<li role="presentation">
									<a role="menuitem" tabindex="-1" 
										onclick="mbrModify('${session_mbr.mbrNo}', '${session_mbr.mbrId}', '${session_mbr.mbrPwd}', '${session_mbr.mbrName}', '${session_mbr.mbrPhone}', '${session_mbr.mbrBirth}', '${session_mbr.mbrGender}', '${session_mbr.mbrPoint }')">
										정보 수정
									</a>
								</li>							
							</c:when>
						</c:choose>
						
						<li role="presentation">
							<a id="mbr_logout" role="menuitem" tabindex="-1" href="#">
								로그아웃
							</a>
						</li>
						
					</c:when>
				</c:choose>
			</ul>
		
		
		</div>
	</div>
	
	
	
	<div id ='content'>
		<jsp:include page="<%=content %>"/>
	</div>
</div>
<%@ include file = "./modal_call_employee.jsp" %>
<%@ include file = "./members/modal_call_members_login.jsp" %>
<%@ include file = "./members/modal_call_members_register.jsp" %>
<%@ include file = "./members/modal_call_members_findInfo.jsp" %>
<%@ include file = "./members/modal_call_members_modify.jsp" %>
<script>



$("#mbr_logout").click(function(){
	location.href="./logout.mbr";
})
function mbrModify(mbrNo, mbrId, mbrPwd, mbrName, mbrPhone, mbrBirth, mbrGender, mbrPoint){
	$(".modal-body #mbr_mno").val(mbrNo);
	$(".modal-body #mbr_mid").val(mbrId);
	$(".modal-body #mbr_mpwd").val(mbrPwd);
	$(".modal-body #mbr_mname").val(mbrName);
	$(".modal-body #mbr_mphone").val(mbrPhone);
	$(".modal-body #mbr_mbirth").val(mbrBirth);
	$("input:radio[name='mbr_gender']:radio[value='male']").prop("checked",true);
	$(".modal-body #mbr_mpoint").val(mbrPoint);
	
	$("#modal_call_members_modify").modal("show");
}
function goOrderMenu(){
	$('#content').load('main.ord');
}
function goChat(ip) {
	var open = window.open("", "chat", "_blank", "width=570, height=810");
	var df = document.ipForm;
	df.action = "getIp.chat?ip=" + ip;
	df.submit();
}
</script>
</body>
</html>