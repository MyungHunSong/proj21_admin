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
<title>Insert title here</title>
</head>
<body>
	<div id="container">
	<!-- 공통 레이아웃 'header' 부분 -->
		<div id="header">
			<tiles:insertAttribute name="admin_header"/>
		</div>
	<!-- 공통 레이아웃 'body' 부분 -->
	<div id="content">
		<tiles:insertAttribute name="admin_body" />
	</div>
	<!-- 공통 레이아웃 'footer'부분 -->
	<div id="footer">
		<tiles:insertAttribute name="admin_footer" />
	</div>
	</div>
</body>
</html>