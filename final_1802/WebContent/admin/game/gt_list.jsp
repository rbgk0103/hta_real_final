<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게임타이틀목록</title>
</head>
<body>
	<div id='gtl_wrap'>
		<div class="panel">
			<header class="panel-heading"> 설치게임 목록 </header>
			<div class="panel-body">
				<table class="table table-bordered">
					<tbody>
						
						<!-- 제목 -->
						<tr>
							<th style="width: 10px">#</th>
							<th>게임타이틀명</th>
							<th>게임종류</th>
							<th style="width: 40px">비고</th>
						</tr>
						
						<!-- 게임타이틀 rows -->
						<c:forEach var='i' items='${gtList}'>
						<tr>
							<td>${i.gtNo}</td>
							<td>${i.gtName }</td>
							<td>${i.gtWith}</td>
							<td>&nbsp;</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<div class="table-foot">
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">«</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">»</a></li>
					</ul>
				</div>
			</div>
			<!-- /.panel-body -->

		</div>
	</div>

</body>
</html>