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
<title>Test02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) if문 실습</h1>
	<hr>
</div>

<div>
	<!-- form 의 action 속성 생략 → su 데이터 수신 및 요청 페이지는 자기 자신 -->
	<form method="post">
		정수
		<input type="text" name="su" class="txt">
		<br><br>
		
		<button type="submit" class="btn"
		style="width: 120px; font-size: 16pt;">결과 확인</button>
		
	</form>
</div>
<br><br>

<div>
	<!-- 결과 확인 -->
	<%-- <h2>${param.su }</h2> --%>
	
	<%-- 『<c:if test=""></c:if>』 : JSTL Core if문 --%>
	<%-- 『test=""』 : 조건식 지정. --%>
	<%--               『<c:if test="${!empty param.su }">』 → 파라미터로 수신한 su 가 비어있지 않으면 --%>
	<%-- 『param.su』: EL 을 활용한 폼 전송 데이터 수신하는 부분 --%>
	
	<c:if test="${!empty param.su }">
	
		<!-- <h2>비어있지 않다.</h2> -->
		
		<!-- 파라미터로 수신한 su 가 짝수라면... -->
		<c:if test="${param.su % 2 == 0}">
			<h2>${param.su } : 짝수</h2>
		</c:if>
		
		<!-- 파라미터로 수신한 su 가 짝수가 아니라면... -->
		<!-- core에 if문은 있는데 else문은 없음. : 추후 어떻게 else 쓰는건지 알려줄 것. -->
		<c:if test="${param.su % 2 != 0}">
			<h2>${param.su } : 홀수</h2>		
		</c:if>
		
	</c:if>
	
</div>



</body>
</html>