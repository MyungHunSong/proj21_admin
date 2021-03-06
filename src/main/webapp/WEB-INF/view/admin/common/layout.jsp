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
<style>
#container{
	width: 100%;
	margin: 0 auto;
	text-align: center;
	border: 0px solid #bcbcbc; 	
}

#header{
	padding: 5px;
	margin-bottom: 5px;
	border: 0px solid #bcbcbc;
	background-color: #FFFFFF;	
}

#sidebar-left{
	width: 15%;
	height: 700px;
	padding: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
	float: left;
	background-color:  yellow;
	font-size: 10px;
}

#content{
	width: 100%;
	padding: 5px;
	margin-right: 5px;
	float: left;
	border: 0px solid #bcbcbc;
}

#footer{
	clear: both;
	padding: 5px;
	border: 0px solid #bcbcbc;
	background-color: lightblue;
	
}
</style>
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