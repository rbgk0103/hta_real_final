<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<c:forEach var="item" items="${list}">
		<div class="col-md-4">
		    <c:choose>
			    <c:when test="${item.tbl_status eq 0}">
			    <div class="panel">
			        <header class="panel-heading">
			            Table No.${item.tbl_no } 
			        </header>
			        <div class="panel-body">
			            <table class="table table-bordered">
			                <tr>
			                    <th style="width: 10px">No</th>
			                    <th>Menu</th>
			                    <th>Quantity</th>
			                    <th >Price</th>
			                </tr>
						    <tr class ='table_set'>
						    	<td colspan='4'>
						    		<input type='hidden' id ='tbl_no' value="${item.tbl_no }">
						    		Empty
						    	</td>
							</tr>
			            </table>
			        </div><!-- /.panel-body -->
			    </div><!-- /.panel -->
				</c:when>
				<c:otherwise>
					<div class="panel">
			        <header class="panel-heading">
			            Table No.${item.tbl_no } ${item.guest_gender} : ${item.guest_cnt}
			        </header>
			        <div class="panel-body">
			            <table class="table table-bordered">
			                <tr>
			                    <th style="width: 10px">No</th>
			                    <th>Menu</th>
			                    <th>Quantity</th>
			                    <th >Price</th>
							</tr>
							<tr class = 'table_detail'>
								<td>
								<input type='hidden' id ='tbl_no' value="${item.tbl_no }">
								1.
								</td>
								<td>
								제육볶음
								</td>
								<td>
								3
								</td>
								<td><span>13000</span></td>
							</tr>
			            </table>
			        </div><!-- /.panel-body -->
			    </div><!-- /.panel -->
				</c:otherwise>
			</c:choose>
		
			
			
		</div><!-- /.col -->
	</c:forEach>
</div>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		</div>
  	</div>
</div>
<script>

$(function(){
    $(".table_set").click(function(){
    	tbl_no = $(this).children().children("input").val();
    	$('div.modal').modal({remote : './admin/table/table_set.jsp?tbl_no='+tbl_no , backdrop: 'static'});
    
    })
    $(".table_detail").click(function(){
    	tbl_no = $(this).children().children("input").val();
    	$('div.modal').modal({remote : './admin/table/table_detail.jsp?tbl_no='+tbl_no , backdrop: 'static'});
    
    })
})
</script>
<%-- <%@ include file = "table_status_detail.jsp" %>	 --%>
<%--<%@ include file = "table_set.jsp" %>  --%>	
                    
 