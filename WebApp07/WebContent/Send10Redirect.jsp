<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ Send10.html)로부터 넘어온 데이터 수신
	// → userName
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// 리다이렉트하기 전에 어떤 내용을 추가해서 리다이렉트 페이지로 넘겨주자~!~! (request.setAttribute())
	// 현재 페이지(Send10Redirect.jsp)에서 추가 작업
	request.setAttribute("message", "반갑습니다.");
	//-- requests 객체의 key(message)의 값으로
	//   "반갑습니다."를 value 로 넣는 작업 수행

	// 여기까지는 request객체가 살아있지만..
	// 아래 리다이렉트 시 새로운 request객체가 발생. 기존에 Send10.html으로부터 받았던 request객체는 사라진다.
	
	// ※ 리다이렉트
	//	  → 클라이언트에 Receive10.jsp 를 다시 (새롭게) 요청할 수 있도록 안내
	response.sendRedirect("Receive10.jsp");	//클라이언트한테 Receive10.jsp로 찾아가도록 응답을 넣었다.
	// 위 구문을 추가하니까 Send10.html 에서 Receive10.jsp로 바로 넘어간 것으로 보인다..
	// 주소창도 http://localhost:3306/WebApp07/Receive10.jsp로 바뀜
	// 실제로는, 해당 Send10Redirect.jsp에 제어권이 넘어와서 내용도 출력한 후 Receive10.jsp로 넘어가라는 응답이 있으니 그쪽으로 바로 넘어간 것이다.
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