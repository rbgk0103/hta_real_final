<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
	System.out.print("어트리뷰트 테이블 엔오 : " + request.getAttribute("tableNo"));
%>
<c:if test="${totalChatList != null }">
	<c:forEach var="i" items="${totalChatList }">
		<div class="textBlock col-md-12 col-xs-12">
			<c:choose>
				<c:when test="${tableNo eq i.chat_sender }">
					<div class="send">
						<h6>No. ${i.table_no }</h6>
						<c:choose>
							<c:when test="${i.guest_gender eq'man' }">
								<div class="chatManBox">
									${i.chat_text }
								</div>
							</c:when>
							<c:when test="${i.guest_gender eq'woman' }">
								<div class="chatWomanBox">
									${i.chat_text }
								</div>
							</c:when>
							<c:when test="${i.guest_gender eq'seam' }">
								<div class="chatSeamBox">
									${i.chat_text }
								</div>
							</c:when>
						</c:choose>
					</div>
				</c:when>
				<c:otherwise>
					<div class="receive">
						<h6>No. ${i.table_no }</h6>
						<c:choose>
							<c:when test="${i.guest_gender eq'man' }">
								<div class="chatManBox">
									${i.chat_text }
								</div>
							</c:when>
							<c:when test="${i.guest_gender eq'woman' }">
								<div class="chatWomanBox">
									${i.chat_text }
								</div>
							</c:when>
							<c:when test="${i.guest_gender eq'seam' }">
								<div class="chatSeamBox">
									${i.chat_text }
								</div>
							</c:when>
						</c:choose>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
</c:if>
<script>
	$(function() {
		$("#chatContent").scrollTop($("#chatContent")[0].scrollHeight);
	})
</script>