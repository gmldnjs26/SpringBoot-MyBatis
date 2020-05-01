<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<!--메인 이미지 들어가는 곳 시작 --->
<div class="clear"></div>
<div id="main_img">
	<img src="images/yokohama01.jpg">
</div>
<!--메인 이미지 들어가는 곳 끝--->
<c:if test="${message != null}">
	<script>
		alert("${message}");
	</script>
</c:if>
<div class="clear"></div>

<div id="front">
	<h2>New Item</h2>
	<div id="bestProduct">
		<c:forEach items="${newProductList }" var="productVO">
			<div id="item">
				<a href="/product_detail?pseq=${productVO.pseq}">
					<img src="./product_images/${productVO.p_image}" />
					<h3>${productVO.p_name}</h3>
					<p>${productVO.p_price}</p>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<h2>Best Item</h2>
	<div id="bestProduct">
		<c:forEach items="${bestProductList}" var="productVO">
			<div id="item">
				<a href="/product_detail?pseq=${productVO.pseq}">
					<img src="./product_images/${productVO.p_image}" />
					<h3>${productVO.p_name}</h3>
					<p>${productVO.p_price}</p>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="./footer.jsp"%>
