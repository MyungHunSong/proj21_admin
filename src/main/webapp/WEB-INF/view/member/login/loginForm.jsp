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
<title>Insert title here</title>
</head>
<body>
	<h1>회원 로그인</h1>
	<section id="LoginFormArea">
		<form:form modelAttribute="LoginCommand">
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td><label for="password">비밀번호</label></td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
			</table>			
			<input type="submit" value="로그인" class="button"/>			
		</form:form>
	</section>
</body>
</html>