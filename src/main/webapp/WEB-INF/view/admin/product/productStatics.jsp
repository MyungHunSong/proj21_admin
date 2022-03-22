<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="bestProducts" value="${viewMap.bestProducts}" />
<c:set var="newProducts" value="${viewMap.newProducts}" />
<c:set var="steadyProducts" value="${viewMap.steadyProducts}" />
<c:set var="offProducts" value="${viewMap.offProducts}" />
<c:set var="outProducts" value="${viewMap.outProducts}" />
<c:set var="totalCoat" value="${viewMap.totalCoat}" />

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

<script>
	var chart2 = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme : "light2", 
		title:{
			text:
		}
	});	
</script>

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
<title>상태</title>


</head>
<body>
	<div id="chartContainer" style="height:370px; width: 100%;"></div>
		<br><br><br><br>
	<div id="chartContainer2" style="height: 450px; width: 950px; margin: 0px auto;"></div>
</body> 
</html>