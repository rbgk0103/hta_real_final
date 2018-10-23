<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$().ready(function(){
   var param = $("#frm").serialize();
   $(".skin-black").load("./menu_list.adm", param);
})
</script>
<body>
${msg }
<form id = 'frm' name = 'frm' method = 'post'>
</form>
</body>
</html>