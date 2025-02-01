<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이전 페이지(→ Send10.html)로부터 넘어온 데이터 수신
	// → name
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// 현재 페이지(→ Send10Redirect.jsp)에서 추가 작업
	request.setAttribute("message", "반갑습니다.");
	//-- request 객체의 key(message)에
	//   "반갑습니다."를 value 로 넣는 작업 수행
	
	
	// ※ 리다이렉트
	//    → 클라이언트에 Receive10.jsp 를 다시 (새롭게) 요청할 수 있도록 안내
	response.sendRedirect("Receive10.jsp");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10Redirect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<p>리다이렉트</p>
	<hr>
</div>

<div>
	<!-- <p>이름 : 윤영식</p> -->
	<p>이름 : <%=userName %></p>
</div>
</body>
</html>