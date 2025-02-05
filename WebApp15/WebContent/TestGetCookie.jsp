<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] ckArr = request.getCookies();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestGetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: center;}
</style>
</head>
<body>

<div>
	<h1>쿠키 정보 얻어내기</h1>
	<p>TestGetCookie.jsp</p>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>쿠키 이름</th>
			<th>쿠키 값</th>
		</tr>
		<%
		for (Cookie c : ckArr)
		{
		%>
		<tr>
			<td><%=c.getName() %></td>
			<td><%=c.getValue() %></td>
		</tr>
		<%
		}
		%>
	</table>
</div>


</body>
</html>