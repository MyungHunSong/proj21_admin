<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- 사용할 jquery, script 기능들 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" />
<link rel="stylesheet" href="${contextPath }/resources/main/main.css">
<link rel="stylesheet"
	href="${contextPath }/resources/product/css/productDetail.css">
<link rel="stylesheet"
	href="${contextPath }/resources/product/css/star.css" />

<!-- ResponseEntity -> ajax를 사용하여 json데이터 테이블 구현 -->
<script>
/* 상단 1. ProductLoad 2. ProductRight에 적용될 데이터 + 박스 구현 */
	$(function() {
		/*숫자 증가 감소*/
		var useNum = 0;
		
		/*재고 수량에 맞춰 올라가는 함수 (넘을시 입력x)*/
		function count(useNum){
			$('.btn').on('click', function(){
				var status = $(this).val();
				/*[0부터 시작 <= 재고 수량만큼] 변수*/
				/*id = result 밑의. text를 변수로 쓴다 (0이다)*/
				var num = $('#result').text();
				
				<!-- 수량 파악 -->
				/*intNum = parseInt("0") -> 정수로 변환된다*/
				var intNum = parseInt(num);
				var quantity = $("#size option:checked").text();
				var colon = quantity.indexOf(':');
				/*text 의 XS 남은 수량 : 10에서 substring을 사용하여 (:의 인덱스 번호 부터 나오는 숫자)*/
				useNum = quantity.substring(colon)
				
				if(status == '+' && intNum < useNum){
					intNum++
					console.log(intNum)
				}else if(status == '-' && intNum > 0){
					intNum--
					console.log(intNum)
				}
				$('.result').text(intNum)
			});			
		}
		/*재고 수량에 맞춰 올라가는 함수 -end-*/
		
		count(useNum)
		/* 사용할 데이터들 가져와 저장하기*/
		var contextPath = "{contextPath}";
		var proNum = ${proNum};
		var memberId = ${authInfo.id}
		/*데이터 베이스 저장 숫자가 1 이라면 -> view에선 XS로 찍히게 (DB 설정에서 1부터 사이즈를 찍기로 해나서 (인덱스 번호는 0부터 시작이니))*/
		var proSize = ["0", "XS", "S", "M", "L", "XL"];
		var proColor ["0", "white", "ivory",]var proColor =["0","white", "ivory", "gray", "pink", "yellow", "mint", "green", "purple", "navy", "10", "black", "brown", "orange", "blue", "red", "basic"];
		var num = 0;
		
		/* 제품 번호를 배열로 받아와 제품 상세 검색 (배열로 받은 이유 : 재고량을 각각 표시하기 위해서)*/
		$.get(contextPath + "/api/productDetail/" + proNum,
			function(json){
				console.log(json)
				
				var proSalerate = json[0].proSalesrate;
				var proPrice = parseInt(json[0].proPrice);
				/*세일 공식*/
				var salePrice = ((100-proSalerate)/100) * proPrice;
				
				
				/*가격을 정규식으로 찍어 내기위해 (###,###) 이런식*/
				var temp = proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				var add = proSalerate.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				
				/* 후기숫자 */
				var reCount = 0;
				for(i = 0; i < json.length; i++){
					reCount += json[i].reReplyCount;
					console.log(reCount);
				}
					
				var sCont = "";
				/*ProductLoad박스 안*/
				sCont += "<div class='productImage'><img src="+contextPath+"/resources/product/images/"+json[0].proImgFileName+"></div>";
				sCont += "<div class = 'productInfo'>";
				sCont += "<div class = 'productInfoName'>";
				sCont += "<strong>" + json[0].proName + "</strong>";
				if(reCount == 0){
					sCont += "<span class = 'review'>작성된 리뷰가 없습니다.</span>";
				}else{
					sCont += "<span class = 'review'>"+ json[0].reReplyCount +"개 리뷰 보기</span>";
				}
				sCont += "</div>";
				sCont += "<p> 조회수 : "+ json[0].proHits +"</p>";			
				sCont += "<p>"+ json[0].proContent + "</p>";
				sCont += "<p>"+ json[0].proStatus + "</p>";
				sCont += "<p class='proPrice'>"+ temp + "원</p>";
				sCont += "<span class='proSalerate'>"+ proSalerate +"% </span>";
				sCont += "<span class='proPriceSale'>"+ add +"원 </span>";
				sCont += "<p> <select id='size'> <option vale='size01'>사이즈를 선택해주세요</option>";
				for(i = 1; i < json.length + 1; i++){
					if(json[i-1].proQuantity == 0){
						sCont += "<option value = "+ i + " style = 'color:red' >"+proSize[json[i-1].proSize] + "남은 수량: " + json[i-1].proQuantity+ "</option>";
					}else{
						sCont += "<option value = " + i + ">" + proSize[json[i-1].proSize] + " 남은 수량: " + json[i-1].proQuantity + "</option>";
					}
				}
				sCont += "</div>"				
				
				$("#ProductLoad").append(sCont);
				var proNum = json[2].proNum + "";
				
				for(j=1; j<3; j++){
					imgCont += "<img class='detailImg' src="+ contextPath +"/resources/product/images/"+proNum+"-" + j +".jpg><br>"
				}
				imgCont += "<img class = 'detailImg' src="+contextPath+"/resources/product/sizeImages/"+json[0].proCategory+".jpg>";
				$("#productDetailImg").append(imgCont);
				
				$(".review").on('click', function(){
					$('html, body').animate({scrollTop:$('#productReview').position().top}, 'slow');
				});
			}		
		)
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- productDetailItem 영역 -->
	<!-- 1. 박스 -->
	<section id="ProductLoad"></section>
	<!-- 1. 박스 (끝) -->

	<!-- 2. 박스 -->
	<div class="productRight">
		<div class="calculator">
			<input class="cal btn pls" type="button" value='-' />
			<div class="cal" id="result">0</div>
			<input class="cal btn minus" type="button" value='+' />
		</div>

		<div class="submitBtns">
			<input type="submit" id="cart" style="cursor: pointer;" value='장바구니' />
			<input type="submit" id="purchase" style="cursor: pointer;"
				value='구매하기' />
		</div>
	</div>
	<!-- 2. 박스 (끝) -->


	
	<!-- 3. 박스 -->
	<section id="productDetailImg"></section>
	<!-- 3. 박스 (끝) -->
	
	<!-- 4. 박스 -->
	<section>
		<p class="menuTitle">REVIEW</p>
	</section>
	<!-- 4. 박스 (끝) -->
</body>
</html>