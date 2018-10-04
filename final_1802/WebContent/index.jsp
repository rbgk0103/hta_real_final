<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src='./lib/jquery-3.3.1.js'></script>
<link rel='stylesheet' type='text/css' href='./css/index.css'>

<script>
// jQuery - 페이지 로딩되면 실행
$(document).ready(function() {
	$('#leftNav').load('./pages/leftNav.jsp');
});


// 페이지 로드용
function loadPage(page) {
	$('#content').load(page);
	sessionStorage.setItem("content", page);
}
</script>


<title>1802_final index</title>
</head>
<body>
1802_final index
</body>
</html>