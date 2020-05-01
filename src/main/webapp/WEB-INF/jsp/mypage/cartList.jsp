<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu.jsp"%>
<article>
	<h2>Cart List</h2>
	<form name="formm" method="post">
		<c:choose>
			<c:when test="${cartList.size() == 0}">
				<h3 style="color: red; text-align: center;">カートが空いています。.</h3>
			</c:when>
			<c:otherwise>
				<table id="cartList">
					<tr>
						<th>商品名</th>
						<th>数量</th>
						<th>価格</th>
						<th>入れた日</th>
						<th>選択</th>
					</tr>

					<c:forEach items="${cartList}" var="cartVO">
						<tr>
							<td><a href="product_detail.do?pseq=${cartVO.pseq}">
									<h3>${cartVO.p_name}</h3>
							</a></td>
							<td>${cartVO.quantity}</td>
							<td>&yen;${cartVO.p_price*cartVO.quantity}</td>
							<td><fmt:formatDate value="${cartVO.indate}" type="date" /></td>
							<td><input type="checkbox" name="cseq"
								value="${cartVO.cseq}"></td>
						</tr>
					</c:forEach>

					<tr>
						<th colspan="2">総額</th>
						<th colspan="2">&yen;${totalPrice}<br></th>
						<th><a href="#" onclick="go_cart_delete()"><h3>削除する</h3></a></th>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>

		<div class="clear"></div>

		<div id="buttons" style="float: right">
			<input type="button" value="ショッピング続け" class="cancel"
				onclick="location.href='index'">
			<c:if test="${cartList.size() != 0}">
				<input type="button" value="注文する" class="submit"
					onclick="go_order_insert()">
			</c:if>
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>