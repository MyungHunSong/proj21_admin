<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value= "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<!-- <link rel="stylesheet" href="proj21_admin/resources/css/default.css"> -->
<title>Insert title here</title>
</head>
<body>
	<div id="container">
	<!-- 공통 레이아웃 'header' 부분 -->
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
	<!-- 공통 레이아웃 'body' 부분 -->
	<div id="content">
		<tiles:insertAttribute name="body" />
	</div>
	<!-- 공통 레이아웃 'footer'부분 -->
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
	</div>
</body>
</html>