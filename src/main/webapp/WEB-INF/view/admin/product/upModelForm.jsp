<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Context-Type" context="text/html; charset=UTF-8">
<title></title>

<style>
	table{border-spacing: 20px;}
</style>


<!-- js -->
<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
<!--This page JavaScript -->
<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
<!-- Charts js Files -->
<script src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>	

</head>
<body>
	<h1>?????? ?????? ????????????</h1>
	<form method="post" name="modelform" action=" ${contextPath}/admin/product/upModel">
		<table>
			<tr>
				<td>???????????? :</td>
				<td><input type="text" value="${proNum}" name="proNum" disabled/></td>
				<td><input type="hidden" value="${proNum}" name="proNum"/></td>
			</tr>
			
			<tr>
				<td>?????? ???????????? :</td>
				<td>
					<c:if test="${proCategory == 1}">?????? </c:if>
					<c:if test="${proCategory == 2}">?????? </c:if>
					<c:if test="${proCategory == 3}">???????????? </c:if>
					<c:if test="${proCategory == 4}">?????? </c:if>
					<c:if test="${proCategory == 5}">?????? </c:if>
					<c:if test="${proCategory == 6}">????????? ??????</c:if>
				</td>
			</tr>
			
			<tr>
				<td>?????? ????????? : </td>
				<td>
					<c:if test="${proSize == 1}">XS </c:if>
					<c:if test="${proSize == 2}">S </c:if>
					<c:if test="${proSize == 3 }">M </c:if>
					<c:if test="${proSize == 4 }">L </c:if>
					<c:if test="${proSize == 5 }">XL </c:if>
				</td>
			</tr>
			
			<tr>
				<td>?????? ?????? :</td>
				<td>
					<c:if test="${proColor == 1 }">white</c:if>
					<c:if test="${proColor == 2 }">ivory</c:if>
					<c:if test="${proColor == 3 }">gray</c:if>
					<c:if test="${proColor == 4 }">pink</c:if>
					<c:if test="${proColor == 5 }">yellow</c:if>
					<c:if test="${proColor == 6 }">mint</c:if>
					<c:if test="${proColor == 7 }">green</c:if>
					<c:if test="${proColor == 8 }">purple</c:if>
					<c:if test="${proColor == 9 }">navy</c:if>
					<c:if test="${proColor == 11 }">black</c:if>
					<c:if test="${proColor == 12 }">brown</c:if>
					<c:if test="${proColor == 13 }">orange</c:if>
					<c:if test="${proColor == 14 }">blue</c:if>
					<c:if test="${proColor == 15 }">red</c:if>
					<c:if test="${proColor == 16 }">basic</c:if>
				</td>
			</tr>
			
			<tr>
				<td>?????? ?????? :</td>
				<td>
					<input type="text" name="proQuantity" value="${proQuantity}"/>
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>			
				<td>
					<input type="submit" value="??????"/>
					<input type="button" onClick="exit()" value="??????" />
				</td>			
			</tr>
		</table>
	</form>
</body>
</html>