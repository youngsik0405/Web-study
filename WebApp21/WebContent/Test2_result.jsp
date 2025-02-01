<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// 이전 페이지(→ Test2.java)로부터 넘어온 데이터 수신
	// → result
	String result = (String)request.getAttribute("result");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>최종 결과값 수신</h1>
	<p>Test2_result.jsp</p>
	<hr>
</div>

<div>
	<!-- <h2>결과 확인</h2> -->
	<h2><%=result %></h2>
</div>

</body>
</html>