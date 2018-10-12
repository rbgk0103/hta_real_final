<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='../../css/auction.css'   />
<title>Insert title here</title>
</head>
<body>
</head>
<body>
<form name = 'frm_auction' id = 'frm_auction' method = 'post'>
   <div id = 'auction'>
      <div id ='header'>
         <h1><label class = 'auction_header'>AUCTION INPUT</label></h1>
      </div>
      <div id='auction_menu' >
            <img src='./auction/images/소주.PNG' width='280px' height='280px'/>      
      </div>
   </div>
   <div id = 'win_ment'>
         <label> <span class = 'ment'>${auc.menu_price }</span> 번 테이블이</label><br/>
         <label> <span id = 'ae_menu_name' class = 'ment'>${auc.menu_price }</span> 원의 가격에</label><br/>
         <label> <span id = 'ae_price'     class = 'ment' >${auc.menu_price }</span> 을 획득하셨습니다.</label><br/>
         <label> <span id = 'ae_pct_max'   class = 'ment' >${auc.menu_price }</span> 을 획득하셨습니다.</label><br/>
         <label> <span id = 'ae_pct_min'   class = 'ment' >${auc.menu_price }</span> 을 획득하셨습니다.</label><br/>
         <input type = 'button' name = 'btnInput' id = 'btnClose' value = 'I N S E R T' />
         <input type = 'button' name = 'btnClose' id = 'btnClose' value = 'C L O S E' data-dismiss ='modal'/>
   </div>
</form>
</body>
</html>