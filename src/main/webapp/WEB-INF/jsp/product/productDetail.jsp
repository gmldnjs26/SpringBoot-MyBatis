<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.html"%>
<c:if test="${message != null}">
	<script>
		alert("${message}");
	</script>
</c:if>
<article>
	<h1>Item</h1>
	<div id="itemdetail">
		<form method="post" name="formm">
			<fieldset>
				<legend> Item detail Info</legend>
				<a href=product_detail?pseq=${productVO.pseq}">
				<span style="float: left;">
				<img src="product_images/${productVO.p_image}" />
				</span>
					<h2>${productVO.p_name}</h2>
				</a> <label> 価格 : </label>
				<p>${productVO.p_price}円</p>
				<input type="hidden" value="${loginUser}" name = "loginUser" id="loginUser">

				<label> 数量 : </label>
				<input type="text" name="quantity" size="2" value="1"> <br>
				<input type="hidden" name="pseq" value="${productVO.pseq}"> <br>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="button" value="カートに入れる" class="submit" onclick="go_cart()">
				<input type="button" value="購買" class="submit" onclick="go_order()">
				<input type="reset" value="キャンセル" class="cancel">
			</div>
		</form>
	</div>
</article>
<%@ include file="../footer.jsp"%>
