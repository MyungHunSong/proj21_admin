<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#header .top a{
	width: 92px;
	height: 60px;
	position: relative;
	text-decoration: none;
	font-size: 40px;
	color: orange;
}

#header ul{
	float:right;
}

#header ul > li {
	display: table-cell;	
	]position: relative;
	margin: auto;
}

#header ul > li > img{
	vertical-align: top;
	margin-right: 10px;
	
}
</style>
<!-- 반응형 웹으로 변환 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, charset=utf-8">
<title>궁금하다면 참여해봐 : Join Us</title>
</head>
<body>
<!-- 전체 틀 LayOut -->
	<div id="layOut">
		<header id="header">
			<div class="top">
				<!-- https://icons8.com/icon/JWv_lqo5fs4F/shopaholic 로고 사용 -->
				<img src="https://img.icons8.com/color/48/000000/shopaholic.png"/>
				<a href="${contextPath}/main">Join Us</a>
				<ul>
					<li data-tooltip="고객센터" data-tooltip-position="button">
						<img src="https://img.icons8.com/material/24/000000/phone-disconnected--v1.png"/>
					</li>
					<li>
						<img src="https://img.icons8.com/material/24/000000/user--v1.png"/>
					</li>
					<li>
						<img src="https://img.icons8.com/material-rounded/24/000000/add-user-male.png"/>
					</li>
					<li>
						<img src="https://img.icons8.com/ios-glyphs/30/000000/login-rounded-right--v1.png"/>
					</li>
				</ul>				
			</div>
			
			
		</header>
		<div class="container"></div>
		<footer id="footer"></footer>
	</div>	
</body>
</html>