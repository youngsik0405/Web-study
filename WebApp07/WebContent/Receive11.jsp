<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(→ Forward11.jsp)로부터 넘어온 데이터 수신
	// → resultStr
	//    ---------
	//    setAttribute()
	
	String result = (String)request.getAttribute("resultStr");
	
	
	// 나의 풀이
	//String res = (String)request.getAttribute("res");
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>결과 확인</h1>
	<hr>
</div>

<div>
	<h2>연산 결과 : <%=result %></h2>
	
	<%-- 연산 결과 : <%=res %> --%>
</div>

</body>
</html>