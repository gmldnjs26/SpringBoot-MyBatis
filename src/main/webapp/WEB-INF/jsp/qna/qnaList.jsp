<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
<article>
	<h2>1:1 顧客掲示板</h2>
	<h3>お客様のご質問に対してお答えいたします。.</h3>
	<form name="formm" method="post">
		<table id="cartList">
			<tr>
				<th>番号</th>
				<th>題目</th>
				<th>登録日</th>
				<th>答弁の可否</th>
			</tr>
			<c:forEach items="${qnaList}" var="qnaVO">
				<tr>
					<td>${qnaVO.qseq}</td>
					<td><a href="qna_view?qseq=${qnaVO.qseq}">
							${qnaVO.q_subject} </td>
					<td><fmt:formatDate value="${qnaVO.indate}" type="date" /></td>
					<td>
						<!--  답변 여부  -->
						<c:choose>
							<c:when test="${qnaVO.q_status==0}"> no </c:when>
							<c:when test="${qnaVO.q_status==1}"> yes </c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="1:1 問い合わせ" class="submit"
				onclick="location.href='qna_write_form'">
			<input type="button" value="ショッピングの続き" class="cancel"
				onclick="location.href='index'">
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>