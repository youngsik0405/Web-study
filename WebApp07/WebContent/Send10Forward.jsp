<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ Send10.html)로부터 넘어온 데이터 수신
	// → name
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// 현재 페이지(→ Send10Forward.jsp)에서 추가 작업
	request.setAttribute("message", "또만납시다.");
	//-- request 객체의 key(message)에
	//   "또만납시다."를 value 로 넣는 작업 수행
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10Forward.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<p>포워딩</p>
	<hr>
</div>

<div>
	<!-- <p>이름 : 엄서연</p> -->
	<p>이름 : <%=userName %></p>
</div>

<!-- ※ 포워드 -->
<jsp:forward page="Receive10.jsp"></jsp:forward>

</body>
</html>