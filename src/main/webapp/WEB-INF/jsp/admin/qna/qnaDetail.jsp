<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">
	function go_list() {
		var theForm = document.frm;
		theForm.action = "admin_qna_list";
		theForm.submit();
	}

	function go_rep(qseq) {
		var theForm = document.frm;
		theForm.qseq.value = qseq;
		theForm.action = "admin_qna_repsave";
		theForm.submit();
	}
</script>
<c:if test="${message != null}">
	<script>
		alert("${message}");
	</script>
</c:if>
<div class="list">
	<h1>Q&amp;A 掲示板</h1>
	<span id="qnaList">
		<form name="frm" method="post" action="admin_qna_repsave">
			<input type="hidden" name="qseq" value="${qnaVO.qseq}">
			<table id="orderList">
				<tr>
					<th width="20%">題目</th>
					<td>${qnaVO.q_subject}</td>
				</tr>
				<tr>
					<th>登録日</th>
					<td><fmt:formatDate value="${qnaVO.indate}" /></td>
				</tr>
				<tr>
					<th>内容</th>
					<td>${qnaVO.q_content}</td>
				</tr>

			<c:choose>
				<c:when test='${qnaVO.q_status=="0"}'>
					<tr>
						<th>答弁</th>
						<td colspan="2"><textarea name="q_reply" rows="3" cols="50"></textarea>
					</tr>
					<br>
				</c:when>
				<c:otherwise>
					<tr>
						<th>答弁</th>
						<td>${qnaVO.q_reply}</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</table>
			<input type="submit" class="btn" value="書き込み">
			<input type="button"
				class="btn" value="リスト" onClick="go_list()">
		</form>
	</span>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>