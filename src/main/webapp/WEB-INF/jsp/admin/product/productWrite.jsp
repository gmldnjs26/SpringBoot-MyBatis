<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<h1>商品登録</h1>
	<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
	<form name="frm" method="post" enctype="multipart/form-data">
		<table id="list">
			<tr>
				<th>商品分類</th>
				<td colspan="5">
				<select name="p_kind">
					<c:forEach items="${kindList}" var="kind" varStatus="status">
						<option value="${kind}">${kind}</option>
					</c:forEach>
				</select><tr>
				<th>商品名</th>
				<td width="343" colspan="5"><input type="text" name="p_name"
					size="47" maxlength="100" value="こちらには商品名"></td>
			</tr>
			<tr>
				<th>原価[A]</th>
				<td width="70"><input type="text" name="p_price" size="11"
					onKeyUp='NumFormat(this)' value="10000"></td>
				<th>販売価[B]</th>
				<td width="70"><input type="text" name="p_costprice" size="11"
					onBlur="go_ab()" onKeyUp='NumFormat(this)' value="20000"></td>
				<th>[B-A]</th>
				<td width="72"><input type="text" name="price3" size="11"
					readonly onKeyUp='NumFormat(this)'></td>
			</tr>

			<tr>
				<th>商品説明</th>
				<td colspan="5"><textarea name="p_content" rows="8" cols="70">こちらには簡単な説明</textarea>
				</td>
			</tr>
			<tr>
				<th>商品の写真</th>
				<td width="343" colspan="5">
					<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
					<input type="file" name="product_image">
				</td>
			</tr>
		</table>
		<input class="btn" type="button" value="登録" onClick="go_save()">
		<input class="btn" type="button" value="取り消し" onClick="go_mov()">
	</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>