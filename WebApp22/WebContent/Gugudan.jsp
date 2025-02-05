<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core)를 활용한 구구단 출력</h1>
	<hr>
</div>

<!--
	원하는 단을 입력받아 구구단을 출력하는 JSP 페이지를 구성한다.
	단, JSTL core if 문과 forEach 구문을 활용한다.
-->

<div>
	<form>
		원하는 단 입력 
		<input type="text" class="txt" name="dan"><br><br>
		
		<button type="submit" class="btn"
		style="width: 200px; font-size: 16pt;">구구단 시작~!!</button>
	</form>
</div>
<br><br>

<div>
	<!-- 결과 처리 -->
	<%-- ${param.dan } --%>
	
	<c:if test="${!empty param.dan}">
	<ul>
		<c:forEach var="su" begin="1" end="9" step="1">
		<li>
			${param.dan } * ${su } = ${param.dan * su }
		</li>
		</c:forEach>
	</ul>
	</c:if>
</div>

</body>
</html>