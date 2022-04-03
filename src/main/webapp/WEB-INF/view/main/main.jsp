<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<!-- link 스타일 가져오기 -->
<link rel="stylesheet"
	href="${contextPath }/resources/main/css/mainContent.css">
<link rel="stylesheet" href="${contextPath}/resources/main/main.css">
<!-- bxSlider 사용시 반드시 가져와야할 css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet"
	href="${contextPath }/resources/main/css/mainProductList.css">

<!-- js사용 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- bxSlider 동작-->
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	/*bx Slider
	메뉴얼 대로 처야한다.
	 */
	$(document).ready(function() {
		$('.slider').bxSlider({
			slideWidth : 1400,
			mode : 'horizontal',
			speed : 500,
			moveSlides : 1,
			auto : true,
			autoHover : true
		})
	});
</script>
<!-- restfull 사용 -->
<script>
	$(function() {
		var contextPath = "${contextPath}";
		var proSize = [ "XS", "S", "M", "L", "XL" ];
		var proStatus = [ "RECOMMEND", "BEST", "SALE", "NEW" ];

		/* 방법 */
		// get으로 가져오기
		$.get(contextPath + "/api/selectProductsMain/" + proStatus[0],
			function(json){
				var dataLength = json.length;
				if(dataLength >= 1){
					
					var sCont = "";
					for(i=0; i<dataLength; i++){
						var proNum = json[i].proNum + ""
						console.log(proNum);
						sCont += "<div class='item'>";
						sCont += "		<div><a href='productDetail?proNum=" + proNum.substring(0, 3) + "'> <img src="+ contextPath +"/tumbnails?proNum=" + proNum.substring(0,3) + "3&fileName=" + json[i].proImgFileName + "></a></div>";
						sCont += "";
						sCont += "";
						sCont += "";
						sCont += "";
						sCont += "</div>";
						
					}
				}
			}		
		)
		
	});
</script>

<!-- 반응형 웹으로 변환 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, charset=utf-8">
<title>궁금하다면 참여해봐 : Join Us</title>
</head>
<body>
	<section id="container">
		<div>
			<!-- 1. 슬라이더 섹션 부분 -->
			<div class="homeMainSliderContainer">
				<div class="slider">
					<c:forEach var="i" begin="1" end="4">
						<div>
							<a href=""> <img
								src="${contextPath}/resources/banner/slide${i}.jpg"
								style="width: 100%;" />
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 1. 슬라이더 섹션 부분(끝) -->
		</div>
		<!-- 2.바로가기 섹션 부분 -->
		<section id="homeMainSection">
			<div class="homeMainContentTop">
				<div class="homeMainContentTopRecmmend listRemocon">
					<img class="imgBtn"
						src="${contextPath}/thumbnails?proNum=2113&fileName=2113-1.jpg" />
					<h2 class="imgBtnText">RECOMMEND</h2>
				</div>
				<div class="homeMainContentTopMostview listRemocon">
					<img class="imgBtn"
						src="${contextPath}/thumbnails?proNum=5033&fileName=5033-1.jpg" />
					<h2 class="imgBtnText">SALE</h2>
				</div>
			</div>
			<div class="homeMainContentTop">
				<div class="homeMainContentTopMostview listRemocon">
					<img class="imgBtn"
						src="${contextPath}/thumbnails?proNum=5113&fileName=5113-1.jpg" />
					<h2 class="imgBtnText">BEST</h2>
				</div>
				<div class="homeMainContentTopRecmmend listRemocon">
					<img class="imgBtn"
						src="${contextPath}/thumbnails?proNum=6023&fileName=6023-1.jpg" />
					<h2 class="imgBtnText">NEW</h2>
				</div>
			</div>
		</section>
		<!-- 2.바로가기 섹션 부분 -->


		<!-- 바로가기에 맞는 옷목록 부분 -->
		<section id="recommend">
			<h1 class="title">RECOMMEND</h1>
			<div id="RECOMMEND" class="productList"></div>
		</section>
		<section id="sale" class="listRemocon">
			<h1 class="title">SALE</h1>
			<div id="SALE" class="productList"></div>
		</section>
		<section id="best" class="listRemocon">
			<h1 class="title">BEST</h1>
			<div id="BEST" class="productList"></div>
		</section>
		<section id="new" class="listRemocon">
			<h1 class="title">NEW</h1>
			<div id="NEW" class="productList"></div>
		</section>

	</section>
</body>

</html>