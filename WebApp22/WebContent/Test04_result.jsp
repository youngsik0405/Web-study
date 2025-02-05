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
<title>Test04_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) forEach문 실습</h1>
	<p>자료구조 활용</p>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		<!-- 
		fop (MyData dto : request.getAttribute("lists"))
		{
			dto 활용
		}
		-->
		
		<!-- 컬렉션 객체를 처리하기 위한 반복문 구성 -->
		<%-- 『<c:forEach var="변수" items="컬렉션"></c:forEach>』 --%>
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center;">${dto.name }</td> <%--자기가 알아서 dto의 getter함수 호출함--%>
			<td style="text-align: center;">${dto.age }</td>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>