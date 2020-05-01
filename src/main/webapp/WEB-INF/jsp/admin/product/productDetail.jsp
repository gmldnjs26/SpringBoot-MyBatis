<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>

<article>
<h1>商品詳細</h1>
<form name="frm" method="post">
<table id="list">
  <tr>
    <th>商品分類</th>
    <td  colspan="5">
  		${kind}
    </td>
    </tr>
    <tr>
        <th align="center" >商品名</th>
        <td colspan="5">${productVO.p_name}</td>
    </tr>

    <tr>
        <th >原価[A]</th>
        <td width="60">${productVO.p_costprice}</td>
        <th>販売価格[B]</th>
        <td width="60">${productVO.p_price}</td>
        <th>[B-A]</th><td>${productVO.price3}</td>
    </tr>

    <tr>
        <th>詳細説明</th>
        <td colspan="5">${productVO.p_content}</td>
    </tr>

    <tr>
     <th>商品イメージ</th>
     <td colspan="5" align="center">
  <!--[7] 상품 이미지를 출력하기 -->
     <img src="product_images/${productVO.p_image}" width="200pt">
     </td>
    </tr>

</table>
<!--[8] 수정 버튼이 눌리면 상품 수정 페이지로 이동하되 현재 페이지와 상품 일련번호 값을 전달해 준다. -->
<input class="btn"  type="button" value="修正" onClick="go_mod('${tpage}','${productVO.pseq}')">
<!--[9] 목록 버튼이 눌리면 상품 리스트 페이지로 이동하되 현재 페이지를 전달해 준다. -->
<input class="btn"  type="button" value="リスト" onClick="go_list('${tpage}')">
</form>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>