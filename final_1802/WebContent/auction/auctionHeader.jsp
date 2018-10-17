<%@page import="bean.TblVo"%>
<%@page import="bean.IPDao"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 테이블 번호 -->
<%

//이페이지를 실행한 컴퓨터의 IP 얻어내기
InetAddress local = InetAddress.getLocalHost();
String localIp    = local.getHostAddress();
String auctionIp = "-1";

//아이피 끝번호 만 자르기
if(localIp.length() == 11){
	auctionIp = localIp.substring(9);
}else{
	auctionIp = localIp.substring(10);
}

//아이피 끝번호를 이용해서 DB에서 tblVo 얻어내기
IPDao ipDao = new IPDao();
TblVo tblVo = ipDao.tblVoSelectOne(auctionIp);

	request.setAttribute("auctionIp", auctionIp);
	request.setAttribute("tblVo", tblVo);
%>

<div class='col-md-1' id = 'header_tableNo'>
	<a>No.0${tblVo.tbl_no}</a>
</div>

</body>
</html>