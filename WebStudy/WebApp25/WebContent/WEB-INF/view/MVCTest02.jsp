<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>MVC 관련 실습 3</h1>
	<hr>
</div>

<div>
	<!-- Model 이 처리한 내용을 -->
	<!-- Controller 로 부터 수신한 결과 -->
	<ul>
		<c:forEach var="i" items="${modelActionResult }">
			<li>${i }</li>
		</c:forEach>
	</ul>
	
</div>

</body>
</html>