<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" charset="text/html; charset=UTF-8;">
<title>회원정보 리스트</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- 사용할 데이터들 (model map지정 데이터들) -->

<!-- 그래프 & 기타 CSS -->

<!-- 내가 사용할 바닐라 function -->
</head>
<body>
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<br><br>
					<center>
						<h2>상품 목록</h2>
					</center>
					<hr>
					
					<div id="listProductsByStatus">
						<ul class="smallul">
							<li>전체&nbsp;건 &nbsp;&nbsp;|</li>
							<li>신제품&nbsp;건 &nbsp;&nbsp;|</li>
							<li>베스트 셀러&nbsp;건 &nbsp;&nbsp;|</li>
							<li>스테디셀러&nbsp;건 &nbsp;&nbsp;|</li>
							<li>할인중&nbsp;건 &nbsp;&nbsp;|</li>
							<li>품절&nbsp;건 &nbsp;&nbsp;|</li>
						</ul>
					</div>
					<br><br><br>
					<form action="">
						<table style="width: 100%;">
							<tr>
								<td colspan="2">상품검색 &nbsp;&nbsp;</td>
								<td colspan="5" class="pleft">상품명 : 
									<input type="text" name="proName" placeholder="상품이름을 입력하세요" id="proName">
								</td>
							</tr>
							
							<tr>
								<td colspan="2">상품구분&nbsp;&nbsp;</td>
								<td colspan="5" class="pleft">
									<input type="radio" value="" name="proStatus" checked> 전체
									<input type="radio" value="신상" name="proStatus" checked>신제품
									<input type="radio" value="최고" name="proStatus" checked>베스트셀러
									<input type="radio" value="추천" name="proStatus" checked>스터디셀러
									<input type="radio" value="세일" name="proStatus" checked>할인중
									<input type="radio" value="품절" name="proStatus" checked>품절				
								</td>
							</tr>
							
							<tr>
								<td colspan="2">상품분류&nbsp;&nbsp;</td>
								<td colspan="5" class="pleft">
									<select name="proCategory" id="select1">
										<option value="" selected>--대분류 선택--</option>
										<option value="">--대분류 선택--</option>
										<option value="1">반팔</option>
										<option value="2">긴팔</option>
										<option value="3">슬립리스</option>
										<option value="4">후드</option>
										<option value="5">셔츠</option>
										<option value="6">스웨트 셔츠</option>
									</select>
									
									<select id="select2" name="orderPrice">
										<option value="">--가격분류 선택--</option>
										<option value="price_desc">가격 높은순</option>
										<option value="price_asc">가격 낮은순ㄴ</option>
									</select >
									
									<select id="select3" name="orderSalesRate">
										<option value="" selected>--판매량분류 선택--</option>
										<option value="salesRate_desc">판매량 많은순</option>
										<option value="salesRate_asc">판매량 적은순</option>
									</select>
									
									<select id="select4" name="orderHits">
										<option value="">--조회수분류 선택--</option>
										<option value="hits_desc">조회수 많은순</option>
										<option value="hits_asc">조회수 적은순</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td colspan="7">
									<input type="button" value="검색" id="search_option" /> &nbps;&nbps;
									<input type="reset" value="초기화">
								</td>
							</tr>			
						</table>
					</form>
					
					<hr>
					<!-- 제품 리스트 테이블 -->
					<form method="post" action="">
						<table border="1" style="border-color: #ddd #ddd #848484 #ddd; width:100%;" >
							<tr style="color: white;">
								<th>전체 선택 &nbsp;<input type="checkbox" id="ck_all" /></th>
								<th>상품 코드</th>
								<th>상품 분류</th>
								<th>상품 구분</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>판매량</th>
								<th>조회수</th>
								<th colspan="2">모델</th>
								<th>모델 추가</th>
							</tr>
							
							<c:choose>
								<c:when test="">
									<h1>등록된 상품이 없습니다.</h1>
								</c:when>
								
								<c:when test="">
									<c:forEach var="product" items="">
										<tr style="text-align: center;">
											<td><input type="checkbox" name="checkRow" value=""s></td>
											<td><a href=""></a></td>
											<td><a href=""></a></td>
											<td><a href=""></a></td>											
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>