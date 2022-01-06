<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#header .top{
	height: 130px;
	margin: 0 auto;
	padding:0 50px;
	position: relative;
}

#header .top a{
	width: 92px;
	height: 60px;
	position: relative;
	text-decoration: none;
	font-size: 50px;
	color: orange;
}

#header .top-nav{
	float:right;
	list-style: none;
}

#header .top-nav{
	display: inline-flex;	
	position: relative;
	margin: auto;
}

.top-nav img {
	vertical-align: top;
	margin-right: 15px;
	cursor: pointer;	
}

#oneNav{
	margin: auto;
	border: 1px solid #ccc;
}

#oneNav .bot-nav {
	list-style: none;
	display: inline-flex;
	text-align: center;
	
}

#oneNav .bot-nav li{
	display: table-cell;
	min-width: inherit;
	position: relative;
}

#container{
	border:1px solid #ccc;
	position: relative;
	width: 100%;
	margin: 0 auto;
}


#footer{
	clear:both;
	width: 100%;
	padding-bottom: 80px;
	border-top: 1px solid #999;
}

#footer-in{
	max-width: 1920px;
	min-width: 1400px;
	position: relative;
	overflow: hidden;
	padding: 0 4%;
}

.footer_inner_left{
	float:left;
	padding-top: 80px;
}

.footer_logo a{
	width: 92px;
	height: 60px;
	position: relative;
	text-decoration: none;
	font-size: 50px;
	color: orange;
}

.footer_inner_right{
 float:right;
 width: 580px;
 padding-top:80px;
 text-align: center;
}
</style>
<!-- 반응형 웹으로 변환 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, charset=utf-8">
<title>궁금하다면 참여해봐 : Join Us</title>
</head>
<body>
<!-- 전체 틀 LayOut -->
	<div id="layOut">
		<!-- -------------------------------------- -->
		<!-- header start -->
		<!-- -------------------------------------- -->
		<header id="header">
			<div class="top">
				<!-- https://icons8.com/icon/JWv_lqo5fs4F/shopaholic 로고 사용 -->
				
				<a href="${contextPath}/main">
					<img src="https://img.icons8.com/color/48/000000/shopaholic.png"/>
				Join Us
				</a>
				
				<ul class="top-nav">
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
		<nav id="oneNav">
			<ul class="bot-nav">
				<li>반팔</li>
				<li>긴팔</li>
				<li>슬립스리스</li>
				<li>후드</li>
				<li>셔츠</li>
				<li>스웨터</li>
			</ul>
		</nav>
		
		<div id="forSale">
			<label>세일</label>
		</div>			
		</header>
		<!-- -------------------------------------- -->
		<!-- header end -->
		<!-- -------------------------------------- -->
		
		<!-- container start -->
		<!-- -------------------------------------- -->
		<div class="container">
		중앙 영역
		
		</div>
		<!-- -------------------------------------- -->
		<!-- container end-->
		<!-- -------------------------------------- -->
				
		<!-- -------------------------------------- -->
		<!-- footer start-->
		<!-- -------------------------------------- -->
		<footer id="footer">
			<div id="footer-in">
			
				<div class="footer_inner_left">
					<div class="footer_logo">
						<a href="${contextPath}/main">
							<img src="https://img.icons8.com/color/48/000000/shopaholic.png"/>
							Join Us
						</a>
					</div>
					
					<div class="footer_left_bot">
					<ul>
						<li>회사 소개</li>
						<li>이용 약관</li>
						<li>개인정보처리방침</li>
						<li>고객센터</li>
					</ul>
					
					<address class="info">
						<span>사업자명 : 추가 예정 </span>
						<span>대표자명 : 추가 예정</span>
						<span>주소 : 대구</span>
						<span>제안/제휴문의 : change1677@naver.com</span>
					</address>
				</div>
					
					
			</div>
				
				
					
				<div class="footer_inner_right">
					<div class="footer_right_top">
						<div class="tel&time">
							<dl>
								<dd class="tell">053-999-9999</dd>
								<dd>평일 &nbsp; 09:00 ~ 18:00</dd>
								<dd>점심 &nbsp; 12:30 ~ 14:00</dd>
								<dd>휴일 &nbsp; 토/일/공휴일</dd>
							</dl>							
						</div>
						<div class="bank">
							<dl>
								<dd>BANK INFO</dd>
								<dd>국민은행 &nbsp; 940***-**-*****</dd>	
								<dd>농	협 &nbsp; 940***-**-*****</dd>
								<dd>(주)추가 예정</dd>	
							</dl>
							<dl>
								<dd>입금자명 불일치시 자동연동이 되지 않습니다.</dd>
								<dd>고객센터 또는 Q&A 문의주세요.</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			
			
		</footer>
		<!-- -------------------------------------- -->
		<!-- footer end-->
		<!-- -------------------------------------- -->
		
	</div>	
</body>
</html>