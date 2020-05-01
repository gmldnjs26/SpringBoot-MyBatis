<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
<article>
	<h2>My Page(${title})</h2>
	<form name="formm" method="post">
		<table id="cartList">
			<tr>
				<th>注文日</th>
				<th>注文番号</th>
				<th>商品名</th>
				<th>決済金額</th>
				<th>商品詳細</th>
			</tr>
			<c:choose>
				<c:when test="${orderList != null }">
					<c:forEach items="${orderList}" var="orderVO">
						<tr>
							<td><fmt:formatDate value="${orderVO.indate}" type="date" /></td>
							<td>${orderVO.oseq}</td>
							<td>${orderVO.p_name}</td>
							<td><fmt:formatNumber value="${orderVO.p_price}"
									type="currency" /></td>
							<td><a href="product_detail?pseq=${orderVO.pseq}"> 照会
							</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p style="color: red;"> 注文なさったもとがございません。</p>
				</c:otherwise>
			</c:choose>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel"
				onclick="location.href='index'">
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>