<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- 사용할 jquery, script 기능들 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"/>
<link rel="stylesheet" href="${contextPath }/resources/main/main.css">
<link rel="stylesheet" href="${contextPath }/resources/product/css/productDetail.css">
<link rel="stylesheet" href="${contextPath }/resources/product/css/star.css" />

<!-- ResponseEntity -> ajax를 사용하여 json데이터 테이블 구현 -->
<script>
	$(function(){
		/*숫자 증가 감소*/
		var useNum = 0;
		
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- productDetailItem 영역 -->
	<section id="ProductLoad"></section>
	<div class="productRight">
		<div class="calculator">
			<input class="cal btn pls" type="button" value='-'/>
			<div class="cal" id="result">0</div>
			<input class="cal btn minus" type="button" value='+'/>
		</div>
	</div>
	<div class="submitBtns">
		<input type="submit" id="cart" style="cursor: pointer;" value='장바구니' />
		<input type="submit" id="purchase" style="cursor: pointer;" value='구매하기' />
	</div>
	
	<!--REVIEW 찍을 영역 -->
	<section id="productDetailImg"></section>
	<section>
		<p class="menuTitle">REVIEW</p>
	</section>
</body>
</html>