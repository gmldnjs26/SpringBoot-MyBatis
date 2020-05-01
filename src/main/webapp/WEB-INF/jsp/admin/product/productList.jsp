<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
	<h1>商品リスト</h1>
	<form name="frm" method="post">
		<table>
			<tr>
				<td width="642"><font size="3px" style="font-weight: bold;">商品名: </font> <input type="text" name="key">
				 <input class="btn" type="button" name="btn_search" value="検索" onClick="go_search()">
					<input class="btn" type="button"
					name="btn_total" value="全て " onClick="go_total()"> <input
					class="btn" type="button" name="btn_write" value="商品登録"
					onClick="go_wrt()">
				</td>
			</tr>
		</table>
		<table id="productList">
			<tr>
				<th>番号</th>
				<th>商品名</th>
				<th>原価</th>
				<th>販売価格</th>
				<th>登録日</th>
			</tr>
			<c:choose>
				<c:when test="${pageMaker.totalCount <=0}">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">登録された商品がありません。.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${productList}" var="productVO">
						<tr>
							<td height="23" align="center">${productVO.pseq}</td>
							<td
								style="text-align: left; padding-left: 50px; padding-right: 0px;">
								<a href="#" onClick="go_detail('${tpage}', '${productVO.pseq}')">
									${productVO.p_name} </a>
							</td>
							<td><fmt:formatNumber value="${productVO.p_costprice}" /></td>
							<td><fmt:formatNumber value="${productVO.p_price}" /></td>
							<td><fmt:formatDate value="${productVO.indate}" /></td>
						</tr>
					</c:forEach>
		</table>
		<div class="pagination">
			<c:if test="${pageMaker.prev }">
				<a href='<c:url value="admin_product_list?page=${pageMaker.startPage-1 }"/>' class="prev">
					<i class="fa fa-angle-double-left"></i></a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<a href='<c:url value="admin_product_list?page=${idx }"/>' class="page-number"><i
					class="fa">${idx }</i></a>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<a href='<c:url value="admin_product_list?page=${pageMaker.endPage+1 }"/>' class="next">
				<i class="fa fa-angle-double-right"></i></a>
			</c:if>
		</div>
		</c:otherwise>
		</c:choose>
	</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>