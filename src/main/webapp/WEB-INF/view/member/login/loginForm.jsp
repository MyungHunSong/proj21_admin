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
<script>
      	let button = () => {
        	alert('login Button !')
        }
</script>
</head>
<body>
	<section id="LoginFormArea">
		<form:form modelAttribute="LoginCommand" action="index.html" class="loginForm">
      		<h2>Login</h2>
      		<div class="idForm">
        	<input type="text" class="id" placeholder="ID">
      		</div>
      		<div class="passForm">
        	<input type="password" class="pw" placeholder="PW">
      		</div>
      		<button type="button" class="btn" onclick="button()">
        	LOG IN
    	  	</button>
      		<div class="bottomText">
      		
        	Don't you have ID? <a href="#">sign up</a>
      </div>			
	</form:form>
	</section>
</body>
</html>