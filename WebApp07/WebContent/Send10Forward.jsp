<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ Send10.html)로부터 넘어온 데이터 수신
	// → userName
	
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	
	//스크립릿에서 포워딩처리를 하려면 리퀘스트디스패쳐라는 별도의 도구? 객체가 필요하기 때문에..
	//한번에 처리하는 JSP 액션태그를 밑에서 써볼거야.(아직 안 배움)
	
	// 포워드하기 전에 어떤 내용을 추가해서 리다이렉트 페이지로 넘겨주자~!~! (request.setAttribute())
	// 현재 페이지(Send10Forward.jsp)에서 추가 작업
	request.setAttribute("message", "또만납시다.");
	//-- requests 객체의 key(message)의 값으로
	//   "또만납시다."를 value 로 넣는 작업 수행
	
	// 포워드의 경우, 기존의 request가 계속 살아서 전달됨.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendForward.jsp</title>
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
<!-- 위 구문을 추가했더니 Send10.html에서 바로 Receive10.jsp의 내용이 출력되지만, 주소창에서는
     http://localhost:3306/WebApp07/Send10Forward.jsp로 남아있다..
     따라서 사용자 입장에서는 Send10Forward.jsp 페이지를 열람하고있다고 인지하게 됨. -->

</body>
</html>