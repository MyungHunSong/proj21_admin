<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 파워포인트 활동현황 페이지
	기능 : 검색, 그래프, 배송중인 상품 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 사용할 데이터 -->
<c:set var="" value="" />
<c:set var="" value="" />
<c:set var="" value="" />
<c:set var="" value="" />
<c:set var="" value="" />
<c:set var="" value="" />
<c:set var="" value="" />
<html>
<head>
<meta http-equiv="Context-Type" charset="text/html; charset = EUC-KR">
<title>회원 정보</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
	src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script
	src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<!--This page JavaScript -->
<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
<!-- Charts js Files -->
<script
	src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script
	src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script
	src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>


<style>
@media ( min-width : 767.98px) {
}
</style>

<!-- 그래프 Canvas JS -->
</head>
<body>
	<!-- 전체 감싸기 -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->

		<!-- 첫번째 -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<
					<div class="comment-widgets scrollable">
						<br> <br>

						<!-- 첫번쨰 영역 -->
						<center>
							<h2>회원 상세 정보</h2>
							<hr>
							<form id="frm_search"
								action="${contextPath}/admin/member/searchMember" method="post">
								<table>
									<tr id="search">
										<td>회원</td>
										<td colsapn="5"><input type="text" placeholder="이름 혹 아이디"
											width="150" name="memberSearch" /></td>
										<td><input type="button"
											onClick="document.getElementById('frm_search').submit();"
											value="검색" /></td>
									</tr>
								</table>
							</form>
						</center>
						<!-- 첫번쨰 영역 (끝) -->
						<br> <br>
						<!-- 두번쨰 영역 -->
						<center>
							<table border="1" class="infotable">
								<tr>
									<td colspan="6">활동 정보</td>
								</tr>

								<tr>
									<td>이름</td>
									<td></td>
									<td>아이디</td>
									<td></td>
									<td>적립금</td>
									<td><fmt:formatNumber value="" pattern="#,###" /> <b>
											P</b></td>
								</tr>

								<tr>
									<td>방문수</td>
									<td><fmt:formatNumber value="" pattern="#,###" />회</td>
									<td>누적 구매액</td>
									<td><fmt:formatNumber value="" pattern="#,###" />원</td>
									<td>누적 주문수</td>
									<td><fmt:formatNumber value="" pattern="#,###" />회 (평균:<fmt:formatNumber
											value="" pattern="#,###" />)</td>
								</tr>
							</table>
						</center>
						<!-- 두번쨰 영역(끝) -->
						<br> <br>
						<!-- 세번쨰 영역 -->
						<center>
							<div id="chartContainer" style="height: 370px; width: 50%;"></div>
						</center>
						<!-- 세번쨰 영역(끝) -->
						<br>
						<hr>

						<!-- 네번쨰 영역 -->
						<center>
							<table>
								<caption>
									<strong>고객 데이터</strong>
								</caption>
								<tr>
									<td colspan="2">배송중인 상품</td>
									<td><a href="#"></a> <c:if test="">데이터 요구</c:if></td>
								</tr>

								<tr>
									<td>==============</td>
								</tr>

								<tr>
									<td colspan="2">반품대기중인 상품</td>
									<td><a href="#">데이터 요구 <c:if test="">0</c:if>
									</a>건</td>
								</tr>

								<tr>
									<td>===============</td>
								</tr>

								<tr>
									<td colspan="2">장바구니에 담은 상품</td>
									<td><a
										href="#">데이터 요구
											<c:if test="">0</c:if>
									</a>건</td>
								</tr>
							</table>
							<br><br>
							<!-- 1. 배송 중인 상품 -->
							<c:choose>
								<c:when test="">
									<br>
									<h3>배송중 이나 준비중인 상품</h3>
									<br>
									
									<table>
										<tr>
											<td width="100px">이미지</td>
											<td width="100px">상품명</td>
											<td width="100px">상품 정보</td>
											<td width="100px">주문자</td>
											<td width="100px">구매 가격</td>
											<td width="100px">주문 총 가격</td>
											<td width="100px">결제 일자</td>
											<td width="100px">배송 상태</td>
										</tr>
										
										<c:set var="final_total_price" value="0"/>
										
										<!-- for문을 사용해 orderList가져온다. -->
										<c:forEach var="order" items="">
											<tr>
												<td width="100px;">
													<a href="#">
														<img width="70px" height="105px" src="#">
													</a>
												</td>
												
												<td>데이터 요망</td>
												<!-- 색깔 1 ~ 16 , white ~ basic
													 사이즈 1 ~ 5 , 사이즈 -->
												<td>
													<c:if test=""></c:if>
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
													<c:if test=""></c:if>																								
												</td>
												
												<td>데이터 요망</td>
												
												<td>
													<fmt:formatNumber
														value=""
														pattern="#,###" />원
												</td>
												<td>
													<fmt:formatNumber
														value=""
														pattern="#,###" />원																												
												</td>
												<c:set var="price" value="#" />
												<c:set var="final_total_price"
													value="#" />
												<c:set var="final_total_price" value=""/>												
												<td>데이터 요망</td>
												<td>데이터 요망</td>
											</tr>
										</c:forEach>
										
										<tr>
											<td colspan="8" align="right"><strong>배송중인 상품 총
													주문 가격 : <fmt:formatNumber value=""
														pattern="#,###" />원
											</strong>
											</td>
										</tr>									
									</table>
								</c:when>
								<c:otherwise>
									<br>
									<h3>배송중인 상품이 없습니다.</h3>
									<br>
								</c:otherwise>
							</c:choose>							
							<!-- 1. 배송 중인 상품 (끝) -->
							
							<!-- 2. 반품 대기중인 상품 -->
							<c:choose></c:choose>
							<!-- 2. 반품 대기중인 상품 (끝) -->
							
							<!-- 3. 장바구니에 담은 상품-->
							<c:choose></c:choose>
							<!-- 3. 장바구니에 담은 상품 (끝) -->
							
						</center>
						<!-- 네번쨰 영역(끝) -->



					</div>
				</div>


			</div>


		</div>
	</div>
	<!-- 전체 감싸기 끝 -->
</body>
</html>