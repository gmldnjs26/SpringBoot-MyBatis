<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">
	function go_search() {
		document.frm.action = "admin_user_list";
		document.frm.submit();
	}
</script>

<div class="list">
	<h1>会員リスト</h1>
	<form name="frm" method="post">
		<font size="2px" style="font-weight: bold;">
		ID</font>: <input type="text" name="key" style="width: 8em;"> 
		<input class="btn" type="button" value="検索" onclick="go_search()">
	</form>
	<span id="qnaList">
		<table id="orderList">
			<tr>
				<th>ID</th>
				<th>名前</th>
				<th>E-mail</th>
				<th>郵便番号</th>
				<th>住所</th>
				<th>電話番号</th>
				<th>加入日</th>
			</tr>
			<c:forEach items="${userList}" var="userVO">
				<tr>
					<td>${userVO.u_id}</td>
					<td>${userVO.u_name}</td>
					<td>${userVO.email}</td>
					<td>${userVO.zip_num}</td>
					<td>${userVO.address}</td>
					<td>${userVO.phone}</td>
					<td><fmt:formatDate value="${userVO.indate}" /></td>
				</tr>
			</c:forEach>
		</table>
	</span>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>