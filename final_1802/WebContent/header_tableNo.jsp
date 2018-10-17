<%@page import="bean.AuctionVo"%>
<%@page import="bean.AuctionDao"%>
<%@page import="java.util.List"%>
<%@page import="java.net.InetAddress"%>
<%@page import="bean.TblVo"%>
<%@page import="bean.IPDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
/* 이봉기(게임)가 작성한 부분 */
//이 페이지를 실행한 컴퓨터의 IP 얻어내기
InetAddress local = InetAddress.getLocalHost();
String localIp = local.getHostAddress();
String tblIp = "-1";

// 아이피 끝번호만 잘라내서 얻기
if (localIp.length() == 11) {
	tblIp = localIp.substring(9);	
}else {
	tblIp = localIp.substring(10);
}

//아이피 끝번호를 이용해서 DB(TABLE_STATUS테이블)에서 tblVo 얻어내기
IPDao ipDao = new IPDao();
TblVo tblVo = ipDao.tblVoSelectOne(tblIp);

request.setAttribute("tblIp", tblIp);
request.setAttribute("tblVo", tblVo);

%>


<!-- 규하가 쓸 거야 -->
<% 
AuctionDao aDao = new AuctionDao();
List<AuctionVo> auctionList = aDao.list();

int length = auctionList.size();

request.setAttribute("length", length);
request.setAttribute("auctionList", auctionList);
%>

<div class='col-md-1' id = 'header_tableNo'>
	<a>No.0${tblVo.tbl_no}</a>
	
</div>