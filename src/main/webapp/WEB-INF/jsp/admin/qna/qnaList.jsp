<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">
	function go_view(qseq) {
		var theForm = document.frm;
		theForm.qseq.value = qseq;
		theForm.action = "admin_qna_view";
		theForm.submit();
	}
</script>

<div class = "list">
	<h1>Q&amp;A 掲示板</h1>
	<span id = "qnaList">
		<form name="frm" method="post">
			<input type="hidden" name="qseq">
			<table id="orderList">
				<tr>
					<th>番号(状態)</th>
					<th>題目</th>
					<th>作成者</th>
					<th>作成日</th>
				</tr>
				<c:forEach items="${qnaList}" var="qnaVO">
					<tr>
						<td>${qnaVO.qseq}<c:choose>
								<c:when test='${qnaVO.q_status=="0"}'>(未処理)</c:when>
								<c:otherwise>(答弁処理完了)</c:otherwise>
							</c:choose>
						</td>
						<td><a href="admin_qna_view?qseq=${qnaVO.qseq}">
								${qnaVO.q_subject} </a></td>
						<td>${qnaVO.u_id}</td>
						<td><fmt:formatDate value="${qnaVO.indate}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</span>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>