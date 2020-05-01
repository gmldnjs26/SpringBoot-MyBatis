<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kwak</title>
<link rel="stylesheet" href="admin/css/admin.css?ver=9">
<link rel="stylesheet" href="admin/css/paging.css?ver=3">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="admin/js/product.js?ver=3"></script>
<c:choose>
	<c:when test="${empty admin}">
		<script type="text/javascript">
			location.href = 'admin_login_form';
		</script>
	</c:when>
	<c:when test ="${message != null }">
		<script type="text/javascript">
			alert(${message});
		</script>
	</c:when>
</c:choose>
</head>
<body onload="go_ab()">
	<div id="wrap">
		<header>
			<div id="logo">
				<a href="admin_login_form.io">
					<img src="admin/images/yokohama01.jpg">
				</a>
			</div>
			<input class="btn" type="button"  value="logout"  style="float: right;"
				onclick="location.href='admin_logout.io'">
		</header>
		<div class="clear"></div>