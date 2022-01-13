<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/resources/main/footer.css">
<style type="text/css">
#scrollMenu{
	margin: 0;
	width: 70px;
	height: 80px;
	position: fixed;
	bottom: 100px;
	right:30px;
}
#scrollMenu > ul{
	list-style: none;
}


</style>
<script type="text/javascript">
	$(function () {
			$("go_top").click(function(){
				$('html, body').animate({scrollTop:0}, 100);
				
				var scrollHeight = $(document).height();
				$("#go_down").click(function(){
					$('html, body').animate({scrollTop:scrollHeight}, 100);
				});
			});
	});
</script>
</head>
<body>
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
					<ul class="menu">
						<li><a href="#">회사 소개</a></li>
						<li><a href="#">이용 약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					
					<address class="info">
						<span>사업자명 : 추가 예정 </span>
						<span>대표자명 : 추가 예정</span>
						<br>
						<span>주소 : 대구</span>
						<span>제안/제휴문의 : change1677@naver.com</span>
					</address>
				</div>
					
					
			</div>
				
				
					
				<div class="footer_inner_right">
					<div class="footer_right_top">
						<div class="tel_time">
							<dl>
								<dd class="tell">053-999-9999</dd>
								<dd>평일 &nbsp; 09:00 ~ 18:00</dd>
								<dd>점심 &nbsp; 12:30 ~ 14:00</dd>
								<dd>휴일 &nbsp; 토/일/공휴일</dd>
							</dl>							
						</div>
						<div class="bank">
							<dl>
								<dt>BANK INFO</dt>
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
			
			<div id="scrollMenu">
				<ul>
					<li>
						<img id="go_top" src="https://img.icons8.com/ios/50/000000/circled-up-2.png"/>
					</li>
					<li>
						<img id="go_down" src="https://img.icons8.com/ios/50/000000/circled-down-2.png"/>
					</li>
				</ul>
			</div>
			
		</footer>
		<!-- -------------------------------------- -->
		<!-- footer end-->
		<!-- -------------------------------------- -->
</body>
</html>