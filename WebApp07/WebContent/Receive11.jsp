<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이전 페이지(→ Forward11.jsp)로부터 넘어온 데이터 수신
	// → resultStr
	//    ---------
	//    setAttribute()
	
	//Object 반환하지만, 실제로 담겨있는 값은 String이므로 다운캐스팅을 해주자
	String result = (String)request.getAttribute("resultStr");
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
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<h2>연산 결과 : <%=result %></h2>
</div>

</body>
</html>