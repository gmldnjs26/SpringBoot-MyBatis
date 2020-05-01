<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sub_menu.jsp"%>
<script type="text/javascript">
	function go_order_save() {
		var count = 0;
		if (document.frm2.result.length == undefined) {
			if (document.frm2.result.checked == true) {
				count++;
			}
		} else {
			for (var i = 0; i < document.frm2.result.length; i++) {
				if (document.frm2.result[i].checked == true) {
					count++;
				}
			}
		}
		if (count == 0) {
			alert("注文処理する商品を選んで下さい.");
		} else {
			document.frm2.action = "admin_update_order";
			document.frm2.submit();
		}
	}
	function go_search(){
		if(document.frm.key != null) {
			document.frm.action = "admin_serach";
			document.frm.submit();
		}
	}
</script>
<div class="list">
	<h1>注文リスト</h1>
	<form name="frm" method="post">
		<font size="2px" style="font-weight: bold;">ID</font>: <input
			type="text" name="key"> <input class="btn" type="button"
			value="検索" onclick="go_search()">
	</form>
	<br> <span id="qnaList">
		<form name="frm2" method="post">
			<table id="orderList">
				<tr>
					<th>注文番号(処理状態)</th>
					<th>ID</th>
					<th>商品名</th>
					<th>数量</th>
					<th>郵便番号</th>
					<th>配達先</th>
					<th>電話番号</th>
					<th>注文日</th>
				</tr>
				<c:forEach items="${orderList}" var="orderVO">
					<tr>
						<td><c:choose>
								<c:when test='${orderVO.o_status=="0"}'>
									<span style="font-weight: bold; color: blue">${orderVO.oseq}</span>
	       						(<input type="checkbox" name="result"
										value="${orderVO.oseq}"> 未処理)
	        				</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: red">${orderVO.oseq}</span>
	          					(<input type="checkbox" checked="checked"
										disabled="disabled">処理完了)
	        				</c:otherwise>
							</c:choose></td>
						<td>${orderVO.u_name}</td>
						<td>${orderVO.p_name}</td>
						<td>${orderVO.quantity}</td>
						<td>${orderVO.zip_num}</td>
						<td>${orderVO.address}</td>
						<td>${orderVO.phone}</td>
						<td><fmt:formatDate value="${orderVO.indate}" /></td>
					</tr>
				</c:forEach>
			</table>
			<input type="button" class="btn" style="width: 200px"
				value="注文処理(振込確認)" onClick="go_order_save()">
		</form>
	</span>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>