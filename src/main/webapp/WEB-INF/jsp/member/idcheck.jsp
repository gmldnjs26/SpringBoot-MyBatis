<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link href="CSS/subpage.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: #B96DB5;
	font-family: Verdana;
}

#wrap {
	margin: 0 20px;
}

h1 {
	font-family: "Times New Roman", Times, serif;
	font-size: 45px;
	color: #CCC;
	font-weight: normal;
}

input[type=button], input[type=submit] {
	float: right;
}
</style>
<script type="text/javascript">
	function idok() {
		opener.formm.u_id.value = "${id}";
		opener.formm.reid.value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap">
		<h1>ID 重複確認</h1>
		<form method=post name=formm style="margin-right: 0" action="id_check">
			User ID <input type=text name="id" value="${id }">
			 <input type=submit value="検索" class="submit"><br>
			<div style="margin-top: 20px">
				<c:if test="${message == 0}">
        			${id}はすでに使われています。
      			</c:if>
				<c:if test="${message == 1}">
        			${id}は使用可能です。
        			<input type="button" value="使用" class="cancel" onclick="idok()">
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>