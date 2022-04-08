<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옷 목록 페이지</title>
<link rel="stylesheet"
	href="${contextPath}/resources/product/css/productlist.css">
<link rel="stylesheet"
	href="${contextPath }/resources/main/css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
<!-- 홈페이지 카테고리 영역 -->
$(function(){
	 
	$(".size span .color span").on({
		"click" : clickFnc
	})
	
	$(".like").click(function(){
		$(".like").toggleClass("active");
	});
	
	function clickFnc(){
		$(this).addClass()
		$(this).siblings().removeClass("active")
	}
	
	var contextPath = "${contextPath}";
	var proCategory = ${proCategory};
	var orderKind = "${orderKind}";
	var priceRange = ${priceRange};
	var pageNum = ${pageNum};
	var section = ${section};
	var search = "${search}";
	var proSize = ["XS", "S", "M", "L", "XL"];
	
	/*검색(proCategory,priceRange,orderKind,search) 및 페이징(section,pageNum)을 위한 조건들을 넣은 제품목록 검색문*/
	$.get(contextPath + "/api/selectProductsSale"+proCategory+"/" + section + "/" + pageNum +"/" + priceRange + "/" + orderKind + "/" + search + "/",
	function(json){
	
		var dataLength = json.length;
		if(dataLength >= 1){
			var sCont = "";
			for(i = 0; i < dataLength; i++){
			var proNum = json[i].proNum + "";
			
			sCont += "<div class='item'>";
			sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
			sCont += "			<div class='detail'>"
			sCont += "				<div class='title'>"
			sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
			sCont +="					<span class='price'>"+ json[i].proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +"원</span>"       
			sCont +="				</div>"
			sCont +="				<div class='info'>"
			sCont +="					<div class='size'>"
	        sCont +="						<label>Sizes</label>"
	        for(j = 0;j < proSize.length;j++){
	        	sCont +="						<span class ='prodSize prodSize"+j+"'>"+proSize[j]+"</span>"	
	        }
	        sCont +="					</div>"
	        sCont +="				</div>"
	        sCont +="			</div>"
	        sCont +="		<button class='add-cart'>Add to Cart</button>"
	        sCont +="</div>"
			}
			$(".productList").append(sCont);
		}
	});
	
	/* Filter안 조건 클릭 이벤트*/
	$('.orderKind').on('click', 'li', function(){
		// 사용할 변수 가져오기
		var contextPath = "${contextPath}";
		var sortOrder = $(this).data("order");
		var sortPrice = $(this).data("price");
		var proCategory = ${proCategory};
		
		$(".productList").remove();
		
		if(sortPrice == undefinded){
			sortPrice = 0;
			$.get(contextPath + "/api/selectProductsSale/"+proCategory+"/"+section+"/"+pageNum+"/"+sortPrice+"/"+sortOrder+"/"+search,
				function(json){
				
				var sCont = "";
				var dataLength = json.length;
				if(dataLength >= 1){
					for(i = 0; i <dataLength; i++){
						var proNum = json[i].proNum + "";
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='title'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ json[i].proPrice +"</span>"       
						sCont +="				</div>"
						sCont +="				<div class='info'>"
						sCont +="					<div class='size'>"
				        sCont +="						<label>Sizes</label>"
				        for(j = 0;j < proSize.length;j++){
				        	sCont +="						<span class ='prodSize'>"+proSize[j]+"</span>"	
				        }
				        sCont +="					</div>"
				        sCont +="				</div>"
				        sCont +="			</div>"
				        sCont +="		<button class='add-cart'>Add to Cart</button>"
				        sCont +="</div>"	
					}
					$(".productList").append(sCont);
				}
				$('.add-cart').on('click',function(){
					var uri = $(this).prev().prev().children().attr("href")
					var proNum = uri.substring(uri.length,uri.length-3)
					console.log(proNum)
					openPop(proNum)
				})
				
				function openPop(proNum){
					var popup = window.open("productDetailItem2?proNum="+proNum,'상품상세정보','width=1070px, height=600px');
				}
			});
			
		}else{
			$.get(contextPath + "/api/selectProductsSale/"+proCategory+"/"+section+"/"+pageNum+"/"+sortPrice+"/"+sortOrder+"/"+search,
			function(json){
				console.log(json)
				var dataLength = json.length;
				var sCont = "";
				if(dataLength >= 1){
					for(i = 0; i < dataLength; i++){
						var proNum =json[i].proNum+"" 
						sCont += "<div class='item'>";
						sCont += "			<div><a href='productDetail?proNum=" + proNum.substring(0,3) + "'><img src="+  contextPath+"/thumbnails?proNum="+proNum.substring(0,3)+"3&fileName="+json[i].proImgfileName+"></a></div>";
						sCont += "			<div class='detail'>"
						sCont += "				<div class='title'>"
						sCont += "					<span class='proName'>"+ json[i].proName +"</span><br>"
						sCont +="					<span class='price'>"+ json[i].proPrice +"</span>"       
						sCont +="				</div>"
						sCont +="				<div class='info'>"
						sCont +="					<div class='size'>"
				        sCont +="						<label>Sizes</label>"
				        for(j = 0;j < proSize.length;j++){
				        	sCont +="						<span class ='prodSize'>"+proSize[j]+"</span>"	
				        }
				        sCont +="					</div>"
				        sCont +="				</div>"
				        sCont +="			</div>"
				        sCont +="		<button class='add-cart'>Add to Cart</button>"
				        sCont +="</div>"
					}
					$(".productList").append(sCont);
					
					$('.add-cart').on('click',function(){
						var uri = $(this).prev().prev().children().attr("href")
						var proNum = uri.substring(uri.length,uri.length-3)
						console.log(proNum)
						openPop(proNum)
					});
					
					function openPop(proNum){
						var popup = window.open("productDetailItem2?proNum="+proNum,'상품상세정보','width=1070px, height=600px');
					}
			
		}else{
			sCont += "<div class='searchBlank'> 검색 결과<br> 없습니다. </div>"	
			$(".productList").append(sCont);
			
			}
		});
		}		
		/*세일인 경우에만 페이징을 사용하기 위해 주소에 있는 값을 변경시킴*/
		if(proCategory == 0){
			window.location.href = contextPath + "/productlist?proCategory=0&section=1&pageNum=1&priceRange="+sortPrice+"&orderKind="+sortOrder+"&search="+search;	
		}
		
	});
	
	$('.prodSearchBtn span').on('click', function(){
		
		if($(this).text() == 'Filter'){
			$('.prodSearchCondition').addClass('active')
			$('.searchPlace').removeClass('active')
			
		}else if($(this).text() == 'Search'){
			$('.prodSearchCondition').removeClass('active')
			$('.searchPlace').addClass('active')
		}
	});
	
	
/*main function end*/	
});

</script>

</head>
<body>
	<!-- 검색 상자 -->
	<div class="prodSearchBtn">
		<span>Filter</span> <span>Search</span>
	</div>
	<div class="prodSearchCondition">
		<!-- li태그의 data속성을 통해서 jquery에서 사용가능하다
	 data-order 시 -> javascript에서 $('li').data("order")이런식 으로-->
		<div class="conditions">
			<p>Sort By</p>
			<ul class="orderKind">
				<li data-order="asc">가격낮은순</li>
				<li data-order="desc">가격높은순</li>
				<li data-order="asc">오래된상품순</li>
				<li data-order="신상">최신상품순</li>
				<li data-order="proHits">조회수순</li>
			</ul>
		</div>
		<div class="conditions">
			<p>Price</p>
			<ul class="orderKind">
				<li data-price=0>ALL</li>
				<li data-price=1>10000 ~ 30000</li>
				<li data-price=2>30000 ~ 50000</li>
				<li data-price=3>50000 ~ 80000</li>
				<li data-price=4>80000 ~ 100000</li>
				<li data-price=5>100000</li>
			</ul>
		</div>
	</div>
	<!-- 검색기능 -->
	<div class="searchPlace">
		<input id="search" type="text" placeholder="검색"
			style="padding: 5px; width: 300px;"> <i class="fas fa-search"></i>
	</div>
	<!-- 가져온 json데이터 뿌려주는곳 -->
	<div class="productList"></div>
	<div id="pageBtn"></div>

</body>
</html>