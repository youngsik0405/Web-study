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
<title>Test05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) set문 실습</h1>
	<p>지수승 구하기</p>
	<hr>
</div>

<div>
	<!-- form 의 action 속성 생략 → 페이지 요청 및 데이터 수신처는 자기 자신 -->
	<form method="post">
		정수1
		<input type="text" name="su1" class="txt">
		<br><br>
		정수2
		<input type="text" name="su2" class="txt">
		<br><br>
		
		<button type="submit" class="btn"
		style="width: 200px; font-size: 16pt;">결과 확인</button>
		
	</form>
</div>
<br><br>

<div>
	<p>『c:set』은 JSP 의 setAttribute() 와 같은 역할을 수행한다.</p>
	<p> (page | request | session | application)
		범위의 변수(속성)를 설정한다.</p>
	<p>『c:remove』는 JSP 의 removeAttribute() 와 같은 역할을 수행한다.</p>
	<p> (page | request | session | application)
		범위의 변수(속성)를 제거한다.</p>
	<p>scope 속성이 생략될 경우 기본값(default)은 page 이다.</p>
</div>
<br><br>

<div>
	<c:if test="${!empty param.su1 }">
		
		<%-- 『<c:set var="result" value="1"></c:set>』 --%>
		<%-- → 변수를 선언하고 그 변수의 값을 할당할 수 있도록 처리해주는 구문 --%>
		<%--    해당 스코프에 지정된 변수가 존재하지 않을 경우 --%>
		<%--    변수를 새로 선언하여 초기화하는 효과가 적용되며 --%>
		<%--    해당 스코프에 지정된 변수가 이미 존재할 경우 --%>
		<%--    (즉, 같은 이름을 가진 변수가 보이는 상황이면...) --%>
		<%--    그 변수의 값을 갱신하는 효과가 적용된다. --%>
		
		<c:set var="result" value="1"></c:set>	<%--변수 새로 선언 및 초기화 --%>
		
		<c:forEach var="a" begin="1" end="${param.su2 }" step="1">
			<c:set var="result" value="${result * param.su1 }"></c:set>	<%--변수 값 갱신 --%>
			<h2>${param.su1 } 의 ${a } 승은 ${result } 이다.</h2>		
		</c:forEach>
	</c:if>
</div>
</body>
</html>