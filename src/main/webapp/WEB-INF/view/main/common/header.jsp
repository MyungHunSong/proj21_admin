<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/resources/main/header.css">

</head>
<body>
	<header id="header">
		<div class="top">
			<!-- https://icons8.com/icon/JWv_lqo5fs4F/shopaholic 로고 사용 -->
			<div class="top_logo">
				<a class="top_name" href="${contextPath}/main"> <img
					src="https://img.icons8.com/color/48/000000/shopaholic.png" /> Join
					Us
				</a>
			</div>
			<div class="top_product">
				<ul class="bot-nav">
					<li><a href="${contextPath}/product/productList?proCategory=1&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">반팔</a></li>
					<li><a href="${contextPath}/product/productList?proCategory=2&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">긴팔</a></li>
					<li><a href="${contextPath}/product/productList?proCategory=3&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">슬립리스</a></li>
					<li><a href="${contextPath}/product/productList?proCategory=4&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">후드</a></li>
					<li><a href="${contextPath}/product/productList?proCategory=5&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">셔츠</a></li>
					<li><a href="${contextPath}/product/productList?proCategory=6&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">스웨트 셔츠</a></li>
					<li><a href="${contextPath}/product/productList?proCategory=0&section=1&pageNum=1&priceRange=0&orderKind=asc&search=null">세일</a></li>
				</ul>
			</div>

			<div class="top_manual">
				<ul class="top-nav">
					<li data-tooltip="고객센터" data-tooltip-position="bottom"><a
						href="#"><img
							src="https://img.icons8.com/material/24/000000/phone-disconnected--v1.png" /></a>
						<ul id="menu_info">
							<li>고객센터</li>
						</ul></li>

					<li><a href="#"><img
							src="https://img.icons8.com/material/24/000000/user--v1.png" /></a>
						<ul id="menu_info">
							<li>마이페이지</li>
						</ul></li>

					<c:if test="${empty authInfo}">
						<li><a><img
								src="https://img.icons8.com/material-rounded/24/000000/add-user-male.png" /></a>
							<ul id="menu_info">
								<li>회원가입</li>
							</ul></li>
					</c:if>

					<c:if test="${empty authInfo}">
						<li><a href="${contextPath}/login"><img
								src="https://img.icons8.com/ios-glyphs/30/000000/login-rounded-right--v1.png" /></a>
							<ul id="menu_info">
								<li>로그인</li>
							</ul></li>
					</c:if>

					<c:if test="${!empty authInfo}">
						<li><a href="${contextPath}/logout"><img
								src="https://img.icons8.com/ios-filled/50/000000/logout-rounded-left.png"
								style="width: 24px; height: 24px;" /></a>
							<ul id="menu_info">
								<li>로그아웃</li>
							</ul></li>
					</c:if>

					<c:if test="${authInfo.id == 'admin' }">
						<li><a href="${contextPath}/admin/order/orderStatics"> <img
								src="${contextPath}/resources/admin/admin.png"
								style="width: 24px; height: 24px;" />
						</a>
							<ul id="menu_info">
								<li>관리자 페이지</li>
							</ul></li>
					</c:if>
				</ul>
			</div>

			<div id="member_point"></div>
		</div>
	</header>
</body>
</html>