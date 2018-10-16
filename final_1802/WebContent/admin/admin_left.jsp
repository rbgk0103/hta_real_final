<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left info">
<!--                 <p>Hello , &nbsp;&nbsp;&nbsp;'관리자'님</p> -->
                <p>Hello , &nbsp;&nbsp;&nbsp;${session_mbr.mbrName }</p>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                <span class="input-group-btn">
                    <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </form>
        <ul class="sidebar-menu">
            <li>
                <a href="./table_status.adm">
                  	<span>테이블(메인페이지)</span>
                </a>
            </li>
            <li>
                <a href="./auction_list.auc">
                	<span>경매</span>
                </a>
            </li>
            <li>
                <a href="./menu_list.adm">
                	<span>메뉴</span>
                </a>
            </li>
            <li id ='menu_game'>
                <a>
                	<span>게임</span>
                </a>
            </li>
            <div id = 'submenu_game'>
	            <li>
	            	<a href="?content=game/gt_list.jsp">
	            		<span>게임  관리</span>
	            	</a>
	            </li>
	            <li>
	            	<a href="?content=game/ge_list.jsp">
	            		<span>게임 이벤트 관리</span>
	            	</a>
	            </li>
			</div>
            <li>
	            <a href="./mbr_list.etc">
	               <span>회원 관리</span>
	            </a>
         	</li>
            <li class="#">
                <a href="simple.html">
                	<span>정산</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<script>
$(document).ready(function(){
	$("#menu_game").click(function(){
	    $("#submenu_game").slideToggle();
	});
})
</script>