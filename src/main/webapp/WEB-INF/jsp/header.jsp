<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kwak Shop</title>
<link href="css/shopping2.css?ver=1" rel="stylesheet">
<script type="text/javascript" src="js/member.js?ver=1"></script>
<script type="text/javascript" src="js/mypage.js?ver=6"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>

<body>
	<div id="wrap">
		<!--헤더파일 들어가는 곳 시작 -->
		<header>
			<!--로고 들어가는 곳 시작--->
			<div id="logo">
				<a href="/index">
				<img src="images/f_logo.jpg" width="180" height="100" alt="kwakshop">
				</a>
			</div>
			<!--로고 들어가는 곳 끝-->
			<nav id="catagory_menu">
				<ul>
					<c:choose>
						<c:when test="${loginUser == null}">
							<li><a href="/login_form">LOGIN</a></li>
							<li>/</li>
							<li><a href="/contract">JOIN</a></li>
						</c:when>
						<c:otherwise>
							<li style="color: orange">${loginUser.u_name}(${loginUser.u_id})</li><li>&nbsp;/&nbsp;</li>
							<li><a href="/logout">LOGOUT</a></li>
						</c:otherwise>
					</c:choose>
					<li>/</li>
					<li><a href="/cart_list">CART</a></li>
					<li>/</li>
					<li><a href="/mypage">MY PAGE</a></li>
					<li>/</li>
					<li><a href="/qna_list">Q&amp;A(1:1)</a></li>
					<li>/</li>
					<li><a href="/admin_login_form">Admin</a></li>
				</ul>
			</nav>

			<nav id="top_menu">
				<ul>
					<li><a href="category.io?kind='OUTER'">OUTER</a>
					</li>
					<li><a href="category.io?kind='TOP'">TOP</a></li>
					<li><a href="category.io?kind='PANTS'">PANTS</a>
					</li>
					<li><a href="category.io?kind='SHOES'">SHOES</a>
					</li>
					<li><a href="category.io?kind='BAG'">BAG</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
			<hr>
		</header>
		<!--헤더파일 들어가는 곳 끝 -->