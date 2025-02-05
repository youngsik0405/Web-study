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
<title>Test07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) import문 실습</h1>
	<hr>
</div>

<div>
	<p> 『c:import』는 URL 처리에 관여하며,</p>
	<p>URL을 사용하여 다른 자원의 결과를 삽입할 때 사용하게 된다.</p>
</div>
<br>

<!-- 변수 지정(url) -->
<c:set var="url" value="Gugudan.jsp"></c:set>

<!-- c:import 활용 -->
<%-- <c:import url="${url }" var="impt"></c:import> --%>

<c:import url="${url }" var="impt">
	<%-- 파라미터 값 넘겨주기 (Gugudan.jsp?dan=7)과 같은 효과.. --%>	
	<c:param name="dan" value="7"></c:param>
</c:import>
<!-- 여기까지만 해서는 뭔가 달라지거나 보여지는 건 없음.. -->


<!-- 결과 화면 출력 -->
<%-- <c:out value="${impt }" escapeXml="false"></c:out> --%>

<!-- 결과 화면 출력 시, 코드가 그대로 드러나게 하는 escapeXml 속성.. -->
<%-- <c:out value="${impt }" escapeXml="true"></c:out> --%>

<!-- 결과 화면 출력 과정에서 HTML 코드를 함께 출력하는 구문 -->
<!-- 『escapeXML』 속성의 기본값(default)은 true 로 설정되어 있다. -->
<c:out value="${impt }"></c:out>

</body>
</html>