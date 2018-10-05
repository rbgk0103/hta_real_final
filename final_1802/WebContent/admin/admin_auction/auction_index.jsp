<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>메뉴만들기</title>

<style type="text/css">
/***** Base Reset Style *****/
html, body, div, span, applet, object, iframe,h1, h2, h3, h4, h5, h6, p, blockquote, pre,a, abbr, acronym, address, big, cite, code,del, dfn, em, img, ins, kbd, q, s, samp,small, strike, strong, sub, sup, tt, var,b, u, i, center,dl, dt, dd, ol, ul, li,fieldset, form, label, legend,table, caption, tbody, tfoot, thead, tr, th, td,article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary,time, mark, audio, video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}
ol, ul{list-style: none}
table{border-collapse:collapse;border-spacing:0}
hr,legend,caption{font-size:0;height:0px}
a{text-decoration:none;color:inherit}
a:hover{text-decoration:none}
img{vertical-align:middle;font-size:11px}
select{vertical-align:middle}
textarea{line-height:18px;font-size:12px;color:inherit}

/***** Work Style *****/
.wrap{width:800px;margin:0 auto}

/** boardSearch **/
.board_search{margin:0 0 15px 0;text-align:right;}
.board_search > li{display:inline-block;margin:0 0 0 12px;font-size:11px}
*:first-child+html .board_search > li{display:inline}
.board_search > li > *{vertical-align:middle}
.board_search > li input[type="text"]{width:120px;padding:0 4px;height:20px;color:#808080;line-height:20px;border:solid 1px #e0e0e0;border-right:none}
.board_search > li input[type="radio"]{margin:2px 2px 0 0}
.board_search > li input[type="submit"]{margin:0;padding:0;width:40px;height:22px;font-size:12px;color:#fff;line-height:20px;border:none;background:#333;cursor:pointer}
.board_search > li label{margin:0 0 0 3px}

/** orderTable **/
.board_list{font-size:12px;color:#777}
.board_list thead tr th{height:30px;color:#fff;font-weight:bold;background:#333;vertical-align:middle}
.board_list tbody tr td{padding:10px;text-align:center;line-height:18px;border-bottom:solid 1px #eee;vertical-align:middle}
.board_list tbody tr .tLeft{text-align:center}
.board_list tbody tr td a{color:#777}
.board_list tbody .notice td{background:#f6f6f6}
.board_list tbody tr:hover td{background:#fafafa}

/** pageNavi **/
.page_navi{margin-top:40px;font-size:0;text-align:center}
.page_navi *{display:inline-block;vertical-align:middle}
.page_navi > a{margin:0 4px;padding:0 5px;height:24px;font-size:12px;color:#333;line-height:23px;border:solid 1px #ccc}
.page_navi span{margin:0 10px}
.page_navi span > *{padding:6px;font-size:14px;color:#777}
.page_navi span > strong{color:#555;font-weight:bold;text-decoration:underline}



</style>
</head>

<body>
<div class="wrap">

   <!-- <ul class="board_search">
      <input type="submit" value="검색" name = 'search' id = 'search'/>
   </ul> -->

   <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="공지사항을 나타낸 표" class="board_list">
      <colgroup>
         <col style="width:8%" />
         <col style="width:68" />
         <col style="width:12%" />
         <col style="width:12%" />
      </colgroup>
      <thead>
         <tr>
            <th scope="col">번호</th>
            <th scope="col">등록시간</th>
            <th scope="col">메뉴이름</th>
            <th scope="col">시작가</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>1</td>
            <td class="tLeft"><a href="#">2018-10-05 17:00</a></td>
            <td>부대찌개</td>
            <td>7,000</td>
         </tr>
         <tr>
            <td>2</td>
            <td class="tLeft"><a href="#">2018-10-05 18:00</a></td>
            <td>곱창</td>
            <td>7,000</td>
         </tr>
         <tr>
            <td>3</td>
            <td class="tLeft"><a href="#">2018-10-05 19:00</a></td>
            <td>닭갈비</td>
            <td>9,000</td>
         </tr>
         <tr>
            <td>4</td>
            <td class="tLeft"><a href="#">2018-10-05 20:00</a></td>
            <td>막창</td>
            <td>9,000</td>
         </tr>
         
      </tbody>
   </table>

   <!-- page_navi start -->
   <div class="page_navi">
      <a href="#" class="first">처음</a>
      <a href="#" class="prev">이전</a>
      <span>
         <strong>1</strong>
         <a href="#">2</a>
         <a href="#">3</a>
         <a href="#">4</a>
         <a href="#">5</a>
         <a href="#">6</a>
      </span>                    
      <a href="#" class="next">다음</a>
      <a href="#" class="last">마지막</a>
   </div>
   <!-- page_navi end -->

   
</div>