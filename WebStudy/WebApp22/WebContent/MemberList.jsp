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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) 활용</h1>
	<p>회원 명단 확인</p>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			
			<c:forEach var="dto" items="${lists }">
			<tr>
				<td style="text-align: center;">${dto.name}</td>
				<td style="text-align: center;">${dto.tel}</td>
				<td style="text-align: center;">${dto.addr}</td>
			</tr>	
			</c:forEach>
		</tr>
	</table>
</div>



<%-- 
<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>		
		</tr>
		
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center;">${dto.name}</td>
			<td style="text-align: center;">${dto.tel}</td>
			<td style="text-align: center;">${dto.addr}</td>
		</tr>
		</c:forEach>
	</table>
</div>
 --%>

</body>
</html>