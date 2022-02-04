<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}//resources/member/loginForm.css">
</head>
<body>
	<section id="LoginFormArea" >
		<form:form modelAttribute="loginCommand" class="loginForm">
      		<h2>Login</h2>
      		<div class="idForm">
        		<input type="text" name="id" class="id" placeholder="ID">
      		</div>
      		
      		<div class="passForm">
      		<!-- form 태그를 사용했다면 반드시 name 이름을 찍어줘야 한다. 만약 안찍어 준다면? 받아오지를 못한다 -->
        		<input type="password" name="password" class="pw" placeholder="PW" value="${authInfo.password}">
      		</div>
      			<input type="submit" value="LOG IN" class="btn">
      		<div class="bottomText">      		
        	Don't you have ID? <a href="#">sign up</a>
      </div>
	</form:form>
	</section>
</body>
</html>